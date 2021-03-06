layout
fullBounds
	"Return the bounding box of the receiver and all its children. Recompute the layout if necessary."
	fullBounds ifNotNil:[^fullBounds].
	"Errors at this point can be critical so make sure we catch 'em all right"
	[self doLayoutIn: self layoutBounds] on: Error do:[:ex|
		"This should do it unless you don't screw up the bounds"
		fullBounds := bounds.
		ex pass].
	^fullBounds