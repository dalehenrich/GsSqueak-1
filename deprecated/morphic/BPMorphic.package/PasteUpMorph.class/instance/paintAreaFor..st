world state
paintAreaFor: aSketchMorph 
	"Answer the area to comprise the onion-skinned canvas for
	painting/repainting aSketchMorph"
	| itsOwner |
	((itsOwner := aSketchMorph owner) notNil
			and: [itsOwner isPlayfieldLike])
		ifTrue: [^ itsOwner bounds].
	"handles every plausible situation"
	^ self paintArea