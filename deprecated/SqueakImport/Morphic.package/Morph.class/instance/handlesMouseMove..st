event handling
handlesMouseMove: anEvent 
	"Do I want to receive mouseMove: when the hand passes over the receiver?  Rules say that by default a morph gets #mouseMove iff
		* the hand is not dragging anything,
			+ and some button is down,
			+ and the receiver is the current mouse focus."
	self eventHandler ifNotNil: [^ self eventHandler handlesMouseMove: anEvent].
	self wantsEveryMouseMove ifTrue: [^ true].
	anEvent hand hasSubmorphs ifTrue: [ ^ false ].
	(anEvent anyButtonPressed and: [ anEvent hand mouseFocus == self ]) ifFalse: [ ^ false ].
	^ true