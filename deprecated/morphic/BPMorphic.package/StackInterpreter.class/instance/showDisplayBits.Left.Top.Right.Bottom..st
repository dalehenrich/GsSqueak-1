I/O primitive support
showDisplayBits: aForm Left: l Top: t Right: r Bottom: b 
	"Repaint the portion of the Smalltalk screen bounded by the affected
	rectangle. Used to synchronize the screen after a Bitblt to the
	Smalltalk Display object."
	(deferDisplayUpdates
			or: [aForm
					~= (objectMemory splObj: TheDisplay)])
		ifTrue: [^ nil].
	self
		updateDisplayLeft: l
		Top: t
		Right: r
		Bottom: b