WiW support
restartWorldCycleWithEvent: evt 
	"RAA 27 Nov 99 - redispatch that click picked up from our inner world"
	evt
		ifNotNil: [self primaryHand
				handleEvent: (evt setHand: self primaryHand)].
	Project current spawnNewProcessAndTerminateOld: true