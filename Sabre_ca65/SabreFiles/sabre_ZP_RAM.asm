;;;; SABRE ZP RAM ;;;;
	soundRegion:					.res 1
	sabreTemp: 						.res 1
	pointer16:						.res 2
	instrumentAddr:					.res 2
	channel_trackAddr: 				.res 18
	channel_patternOffsetAddr:		.res 18

	envelopeAddr = pointer16
	;; 42 bytes ZP 
	