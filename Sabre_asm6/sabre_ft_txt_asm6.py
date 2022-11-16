#!/usr/bin/python3

# started by maple "mavica" syrup <maple@maple.pet> 2022-10-11

import re
import math
import sys
import os.path

NOTE_COUNT = 86

NOTE_LENGTHS = [
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18,
	20, 22, 24, 26, 28, 30, 32, 36, 40, 48, 64, 96, 128, 256
]
SUPPORTED_EFFECTS = "DC"
NOTE_NULL = "NUL"
INST_SILENT = "SLNT"

EMPTY_ROW = "... .. . ..."

CHANNELS = [
	"pulse1",
	"pulse2",
	"triangle",
	"noise",
	"DMC",
]

def ft_note_to_sabre(note:str) -> str:
	# noise channel
	if note[2] == "#":
		return f"${note[0]}"
	# regular case
	if (note[0] not in "CDEFGAB"):
		raise RuntimeWarning("Unknown note")
	if (note[1] not in "-#"):
		raise RuntimeWarning("Unknown note")
	if (note[2] not in "01234567"):
		raise RuntimeWarning("Unknown note")
	return f"{note[0]}{'S' if note[1] == '#' else ''}{note[2]}"

def vacuum_orders(seq):
    seen = set()
    seen_add = seen.add
    return [x for x in seq if not (x in seen or seen_add(x))]

class Envelope:
	# tuple (type, index) where corresponds to original famitracker macro
	indices:"list[tuple]" = []

	def __init__(self, envelope:"list[int]", loop_point:int):
		self.envelope = envelope
		# envelope cannot be empty
		if (len(self.envelope) < 1):
			raise RuntimeError('Tried to create empty envelope')

		self.loop_point = loop_point
		# assert loop point constrant
		if (self.loop_point == -1 or self.loop_point >= len(self.envelope)):
			self.loop_point = len(self.envelope) - 1
		
		self.indices = []

	def add_index(self, idx:tuple):
		self.indices.append(idx)

	def __eq__(self, other):
		if (isinstance(other, Envelope)):
			return self.envelope == other.envelope and self.loop_point == other.loop_point
		return False

class Instrument:
	# envelope numbers
	def __init__(self, name:str, volume:int, arpeggio:int, pitch:int, duty:int):
		self.name = name
		self.volume = volume
		self.arpeggio = arpeggio
		self.pitch = pitch
		self.duty = duty

	def label(self) -> str:
		return f"inst_{safe_asm_label(self.name)}"

class DPCM_Sample:
	def __init__(self, name:str, length:int, data:"list[int]"):
		self.name = name
		self.length = length
		self.data = data

	def label(self) -> str:
		return f"dpcm_sample_{safe_asm_label(self.name)}"

class Row_data:
	def __init__(self, pattdata:str):
		pattdata = pattdata.split()
		if pattdata[0] == "---":
			note = None
			inst = INST_SILENT
		else:
			note = ft_note_to_sabre(pattdata[0]) if pattdata[0] != "..." else None
			inst = str(int(pattdata[1], base=16)+1) if pattdata[1] != ".." else None
		effect = pattdata[3] if pattdata[3][0] in SUPPORTED_EFFECTS != "..." else None

		if note == None and inst == None:
			note = NOTE_NULL

		self.length = 1
		self.note = note
		self.inst = inst
		self.effect = effect

	def inc_length(self):
		self.length += 1

	def contains_note_data(self) -> bool:
		if self.note != None and self.note != NOTE_NULL:
			return True
		if self.inst != None and self.inst != INST_SILENT:
			return True
		if self.effect != None:
			return True
		return False

def compile_sabre_pattern(rows:"list[Row_data]", channel:str, sfx:bool = False) -> "list[str]":
	pattern = []

	last_length = None
	last_inst = None
	last_note = None

	for i,row in enumerate(rows):
		next_row = None
		try:
			next_row = rows[i+1]
			if next_row.effect != None and next_row.inst == None and next_row.note == NOTE_NULL:
				row.length += 1
		except IndexError:
			pass

		include_length = False
		include_inst = False
		include_note = False
		if row.length != last_length and (row.inst != None or row.note != None):
			include_length = True
			last_length = row.length
		if row.inst != None and row.inst != last_inst and channel != "DMC":
			include_inst = True
			last_inst = row.inst
		if row.note != None and row.note != last_note:
			include_note = True
			last_note = row.note
		
		if include_length and not include_inst:
			include_note = True
		if not include_length and not include_note and row.note != None:
			include_note = True
		
		if include_length:
			if row.length in NOTE_LENGTHS:
				pattern.append(f"NL{str(row.length)}")
			else:
				pattern.append("NLC")
				pattern.append(str(row.length))
		if include_inst:
			cont = "|CONT" if include_note else ""
			pattern.append(f"INST{cont}|{row.inst}")
		if include_note:
			pattern.append(row.note)
		if row.effect != None:
			pattern.append(row.effect)

		if next_row != None and (next_row.effect == "D00" or next_row.effect == "C00"):
			pattern.append(next_row.effect)
			break
	
	if rows[-1].effect == None:
		if sfx:
			pattern.append("END_SFX")
		else:
			pattern.append("D00")

	return pattern

class Track:
	def __init__(self, name:str, group:str, speed:int):
		self.name = name
		self.group = group
		self.speed = speed
		self.frames = 0
		self.patterns = {
			"pulse1": {},
			"pulse2": {},
			"triangle": {},
			"noise": {},
			"DMC": {}
		}
		self.orders = {
			"pulse1": [],
			"pulse2": [],
			"triangle": [],
			"noise": [],
			"DMC": []
		}
		try:
			self.group_hex = int(self.group, base=16)
		except ValueError:
			self.group_hex = 0
		if self.group_hex == 0 or self.group_hex >= 256:
			if self.group not in ["sfx", "default"]:
				self.name = '_'.join([self.group, self.name])
				self.group = "default"
			self.group_hex = 0

	def add_order(self, p1:int, p2:int, tri:int, noi:int, dmc:int):
		self.frames += 1
		self.orders["pulse1"].append(p1)
		self.orders["pulse2"].append(p2)
		self.orders["triangle"].append(tri)
		self.orders["noise"].append(noi)
		self.orders["DMC"].append(dmc)

	def init_pattern(self, idx:int):
		for ch in CHANNELS:
			self.patterns[ch][idx] = []

	def add_row_change(self, channel:int, pattern:int, pattdata:str):
		self.patterns[CHANNELS[channel]][pattern].append(Row_data(pattdata))
	
	def inc_last_row(self, channel:int, pattern:int, full:bool=False):
		if full:
			self.patterns[CHANNELS[channel]][pattern][-1].length = 128
		else:
			self.patterns[CHANNELS[channel]][pattern][-1].inc_length()

	def check_channel_used(self, channel:int) -> bool:
		used_patterns = [*set(self.orders[CHANNELS[channel]])]
		for i in used_patterns:
			try:
				rows = self.patterns[CHANNELS[channel]][i]
			except KeyError:
				# pattern is used but doesn't exist. start blank
				self.patterns[CHANNELS[channel]][i] = []
				self.add_row_change(channel, i, EMPTY_ROW)
				self.inc_last_row(channel, i, True)
				rows = self.patterns[CHANNELS[channel]][i]
			for row in rows:
				if row.contains_note_data():
					return True
		return False

	def label(self) -> str:
		return f"_{safe_asm_label(self.group)}_{safe_asm_label(self.name)}"

class Music:
	envelopes:"list[Envelope]" = []
	instruments:"list[Instrument]" = []
	samples:"list[DPCM_Sample]" = []
	sampleNotes:"list[int]" = []
	samplePitches:"list[int]" = []
	tracks:"list[Track]" = []
	
	def add_envelope(self, envelope:Envelope):
		self.envelopes.append(envelope)

	def add_instrument(self, instrument:Instrument):
		if instrument.volume < 0 or instrument.volume >= len(self.envelopes):
			raise RuntimeError('Tried to create instrument with invalid volume envelope')
		if instrument.arpeggio < 0 or instrument.arpeggio >= len(self.envelopes):
			raise RuntimeError('Tried to create instrument with invalid arpeggio envelope')
		if instrument.pitch < 0 or instrument.pitch >= len(self.envelopes):
			raise RuntimeError('Tried to create instrument with invalid pitch envelope')
		if instrument.duty < 0 or instrument.duty >= len(self.envelopes):
			raise RuntimeError('Tried to create instrument with invalid duty envelope')

		self.instruments.append(instrument)

	def add_sample(self, sample:DPCM_Sample):
		self.samples.append(sample)

	def add_track(self, track:Track):
		self.tracks.append(track)

	def map_sample(self, note:int, sample:int, pitch:int):
		if note < 0 or note >= NOTE_COUNT:
			# don't map samples outside 0-85
			return
		if sample >= len(self.samples):
			raise RuntimeError('Invalid sample index for DPCM mapping')
		self.sampleNotes[note] = sample
		self.samplePitches[note] = pitch

	def __init__(self):
		empty_env = Envelope([0], 0)
		self.add_envelope(empty_env)
		silent_inst = Instrument("silent", 0, 0, 0, 0)
		self.add_instrument(silent_inst)
		self.sampleNotes = [255]*NOTE_COUNT
		self.samplePitches = [255]*NOTE_COUNT

	def find_envelope(self, index:tuple) -> int:
		for i, env in enumerate(self.envelopes):
			if index in env.indices:
				return i
		return -1

	def sample_length(self, sample:int) -> int:
		if sample == 255:
			return 255
		return self.samples[sample].length >> 4

	def get_group_list(self):
		groups = [track.group for track in self.tracks]
		groups = [*set(groups)]
		try:
			groups.remove("sfx")
		except ValueError:
			pass
		return groups

	def get_tracks_by_group(self, group:str) -> "list[Track]":
		tracks = []
		for track in self.tracks:
			if track.group == group:
				tracks.append(track)
		return tracks

	def get_nonsfx_tracks(self) -> "list[Track]":
		tracks = []
		for track in self.tracks:
			if track.group != "sfx":
				tracks.append(track)
		return tracks

# read ft txt export and parse into Music object
def read_ft_txt(filename:str):
	music_data = Music()

	with open(filename, "r") as f:
		# read DPCMDEFs
		# this is jank. soz
		sample_name = ""
		sample_length = 0
		sample_data = []
		for line in f:
			if line.startswith("DPCMDEF"):
				sample_data = line.split()
				sample_length = int(sample_data[2])
				m = re.match(r".*\"(.*)\"", line)
				sample_name = m.group(1)
				sample_data = []
				continue
			if line.startswith("DPCM :"):
				line_bytes = line.split(":")[1]
				line_bytes = [int(x, base=16) for x in line_bytes.split()]
				sample_data += line_bytes
				if len(sample_data) >= sample_length:
					# we need to pad to 64byte align
					pad_len = 64 - (sample_length % 64)
					sample_data += [0]*pad_len
					sample_obj = DPCM_Sample(sample_name, sample_length, sample_data)
					music_data.add_sample(sample_obj)

		# read KEYDPCMs
		f.seek(0)
		for line in f:
			if line.startswith("KEYDPCM"):
				key_data = line.split()
				note = ((int(key_data[2]) * 12) + int(key_data[3])) - 9
				sample = int(key_data[4])
				pitch = int(key_data[5]) | (int(key_data[6]) * 64)
				music_data.map_sample(note, sample, pitch)

		# read MACRO lines into envelopes
		f.seek(0)
		for line in f:
			if line.startswith("MACRO"):
				macro_data, envelope = line.split(":")
				envelope = list(map(int,envelope.split()))
				macro_data = macro_data.split()
				ft_type = int(macro_data[1])
				ft_index = int(macro_data[2])
				loop_point = int(macro_data[3])

				# duty cycle envelopes are left-shifted by 5
				if ft_type == 4:
					envelope = [x<<5 for x in envelope]

				index = (ft_type, ft_index)
				new_env = Envelope(envelope, loop_point)

				# check if music_data already has this macro
				match = False
				for env in music_data.envelopes:
					if env == new_env:
						env.add_index(index)
						match = True
						break
				if match == False:
					new_env.add_index(index)
					music_data.add_envelope(new_env)

		# read INST2A03 lines into instruments
		f.seek(0)
		for line in f:
			if line.startswith("INST2A03"):
				inst_data = line.split()
				m = re.match(r".*\"(.*)\"", line)
				inst_name = m.group(1)
				volume = 0
				arpeggio = 0
				pitch = 0
				duty = 0
				if int(inst_data[2]) != -1:
					volume = music_data.find_envelope((0, int(inst_data[2])))
				if int(inst_data[3]) != -1:
					arpeggio = music_data.find_envelope((1, int(inst_data[3])))
				if int(inst_data[4]) != -1:
					pitch = music_data.find_envelope((2, int(inst_data[4])))
				if int(inst_data[6]) != -1:
					duty = music_data.find_envelope((4, int(inst_data[6])))
				inst_obj = Instrument(inst_name, volume, arpeggio, pitch, duty)
				music_data.add_instrument(inst_obj)

		# here comes the pain.
		# read track data
		f.seek(0)
		track_name = ""
		pattern_length = 0
		pattern_current = None
		row_current = None
		track_speed = 0
		track_obj = None
		for line in f:
			if line.startswith("TRACK"):
				track_data = line.split()
				m = re.match(r".*\"(.*)\"", line)
				track_name = m.group(1)

				if "_" in track_name:
					group, track_name = track_name.split("_",1)
				else:
					group = "default"

				pattern_length = int(track_data[1])
				pattern_count = 0
				track_speed = int(track_data[2])
				track_obj = Track(track_name, group, track_speed)
			if line.startswith("ORDER"):
				order_data = line.split()
				order_data = [int(x, base=16) for x in order_data[3:]]
				track_obj.add_order(order_data[0], order_data[1], order_data[2], order_data[3], order_data[4])
				pattern_count = max([pattern_count] + order_data)
			if line.startswith("PATTERN"):
				pattern_current = int(line.split()[1], base=16)
				track_obj.init_pattern(pattern_current)
				row_current = 0
			if line.startswith("ROW"):
				row_data = line.split(" : ")
				for i, pattdata in enumerate(row_data[1:]):
					pattdata = pattdata.rstrip()
					if pattdata == EMPTY_ROW and row_current != 0:
						track_obj.inc_last_row(i, pattern_current)
					else:
						track_obj.add_row_change(i, pattern_current, pattdata)
				row_current += 1
				if pattern_current >= pattern_count and row_current >= pattern_length:
					music_data.add_track(track_obj)

	return music_data

# remove non-alphanumeric and replace spaces and periods with underscore
def safe_asm_label(text:str) -> str:
	text = re.sub(r"[^\w\s\.]", '', text)
	text = re.sub(r"[\s\.]+", '_', text)
	return text

# pretty print long lists
def pretty_print(list, size, prefix, format="{0}") -> str:
	buffer = ""
	for i in range(math.ceil(len(list)/size)):
		buffer += prefix
		buffer += ",".join([format.format(v) for v in list[i * size:(i+1) * size]])
	return buffer

# writes Music object into Sabre-formatted assembly data
def write_asm(music_data:Music, filename:str):
	static_buffer:str = ""

	# track counts and headers
	sfx_count = len(music_data.get_tracks_by_group("sfx"))
	track_count = len(music_data.tracks)-sfx_count
	static_buffer += "sabre_maxTracks:\n"
	static_buffer += f"\t.db {track_count}\n"
	static_buffer += "sabre_maxSFX:\n"
	static_buffer += f"\t.db {sfx_count}\n\n"

	track_names = []
	sfx_names = []
	for track in music_data.tracks:
		if track.group == "sfx":
			sfx_names.append(track.label())
		else:
			track_names.append(track.label())

	static_buffer += "trackHeaderTable_lo:\n"
	for label in track_names:
		static_buffer += f"\t.db <{label}_header\n"
	static_buffer += "trackHeaderTable_hi:\n"
	for label in track_names:
		static_buffer += f"\t.db >{label}_header\n"
	static_buffer += "trackTable_PRGbank:\n\t.db "
	static_buffer += ','.join([f'${x.group_hex:02x}' for x in music_data.get_nonsfx_tracks()])
	static_buffer += "\n\n"

	static_buffer += "sfxHeaderTable_lo:\n"
	for label in sfx_names:
		static_buffer += f"\t.db <{label}_header\n"
	static_buffer += "sfxHeaderTable_hi:\n"
	for label in sfx_names:
		static_buffer += f"\t.db >{label}_header\n"
	static_buffer += "\n"

	# envelopes
	for i, env in enumerate(music_data.envelopes):
		static_buffer += f"env{i}:\n"
		env_str = ",".join(map(str, env.envelope))
		static_buffer += f"\t.db {env_str},ENV_LOOP,{env.loop_point}\n"

	static_buffer += "\n"

	# instrument header table
	static_buffer += "instrumentHeaderTable:\n"
	for inst in music_data.instruments:
		static_buffer += f"\t.dw {inst.label()}\n"

	static_buffer += "\n"

	# instruments
	for inst in music_data.instruments:
		static_buffer += f"{inst.label()}:\n"
		static_buffer += f"\t.dw env{inst.volume}\n"
		static_buffer += f"\t.dw env{inst.arpeggio}\n"
		static_buffer += f"\t.dw env{inst.pitch}\n"
		static_buffer += f"\t.dw env{inst.duty}\n"

	static_buffer += "\n"
	
	# dpcm mapping

	static_buffer += "dpcm_sampleAddressTable:\n"
	for sample in music_data.samples:
		static_buffer += f"\t.db <({sample.label()} >> 6)\n"
	static_buffer += "\n"

	static_buffer += "dpcm_noteToSampleTable:"
	static_buffer += pretty_print(music_data.sampleNotes, 24, "\n\t.db ", "${0:02x}")
	static_buffer += "\n"
	static_buffer += "dpcm_noteToSampleRateAndFlags:"
	static_buffer += pretty_print(music_data.samplePitches, 24, "\n\t.db ", "${0:02x}")
	static_buffer += "\n"
	static_buffer += "dpcm_noteToSampleLength:"
	lengths = [music_data.sample_length(i) for i in music_data.sampleNotes]
	static_buffer += pretty_print(lengths, 24, "\n\t.db ", "${0:02x}")
	static_buffer += "\n\n"

	for sfx in music_data.get_tracks_by_group("sfx"):
		static_buffer += f"{sfx.label()}_header:\n"
		static_buffer += f"\t.db {sfx.speed}\n"
		SFX_CHANNELS = CHANNELS[:len(CHANNELS)-1]
		for i,ch in enumerate(SFX_CHANNELS):
			label = sfx.label() if sfx.check_channel_used(i) else "NULL"
			static_buffer += f"\t.dw {label}_{ch}\n"
		for i,ch in enumerate(SFX_CHANNELS):
			if sfx.check_channel_used(i):
				static_buffer += f"{sfx.label()}_{ch}:"
				static_buffer += pretty_print(compile_sabre_pattern(sfx.patterns[ch][0],ch,True),10,"\n\t.db ")
				static_buffer += "\n"
		static_buffer += "\n"

	with open(f"{filename}_static.asm", "w") as f:
		f.write(static_buffer)

	if len(music_data.samples) > 0:
		dpcm_buffer = ""

		for sample in music_data.samples:
			dpcm_buffer += f"{sample.label()}:"
			dpcm_buffer += pretty_print(sample.data, 24, "\n\t.db ", "${0:02x}")
			dpcm_buffer += "\n\n"

		with open(f"{filename}_dpcm.asm", "w") as f:
			f.write(dpcm_buffer)

	for group in music_data.get_group_list():
		tracks = music_data.get_tracks_by_group(group)
		buffer = ""
		for track in tracks:
			buffer += f"{track.label()}_header:\n"
			buffer += f"\t.db {track.speed}\n"
			buffer += f"\t.db {len(track.orders[CHANNELS[0]])}\n"
			for i,ch in enumerate(CHANNELS):
				label = track.label() if track.check_channel_used(i) else "NULL"
				buffer += f"\t.dw {label}_{ch}\n"
			buffer += "\n"
			for i,ch in enumerate(CHANNELS):
				if track.check_channel_used(i):
					buffer += f"{track.label()}_{ch}:\n"
					for order in track.orders[ch]:
						buffer += f"\t.dw {track.label()}_{ch}_pattern{str(order)}\n"
					for pattern in [*set(track.orders[ch])]:
						patt_commands = compile_sabre_pattern(track.patterns[ch][pattern],ch)
						buffer += f"{track.label()}_{ch}_pattern{pattern}:"
						buffer += pretty_print(patt_commands,10,"\n\t.db ")
						buffer += "\n"
					buffer += "\n"
		
		with open(f"{filename}_{group}.asm", "w") as f:
			f.write(buffer)

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print(f"Usage: {sys.argv[0]} <filename.txt> [output prefix]")
		sys.exit()
	
	filename, extension = os.path.splitext(sys.argv[1])

	if len(sys.argv) > 2:
		filename = sys.argv[2]

	if extension.lower() != ".txt":
		print("Input file must have txt extension")
		sys.exit()

	music_data = read_ft_txt(sys.argv[1])
	write_asm(music_data, filename)