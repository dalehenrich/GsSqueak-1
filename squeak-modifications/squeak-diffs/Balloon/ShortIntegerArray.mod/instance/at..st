accessing
at: index
	"Return the 16-bit integer value at the given index of the receiver."

	<primitive: 1072> "GemStone Primitive"	
	index isInteger ifTrue: [self errorSubscriptBounds: index].
	index isNumber ifTrue: [^ self at: index truncated].
	self errorNonIntegerIndex.
