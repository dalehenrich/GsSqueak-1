visual properties
setAsBackground: aFormOrColorOrFillStyle

	(self outermostWorldMorph == self and: [Project current isMorphic])
		ifTrue: [Project current setAsBackground: aFormOrColorOrFillStyle]
		ifFalse: [self fillStyle: aFormOrColorOrFillStyle].