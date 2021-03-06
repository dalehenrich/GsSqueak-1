world menu
activateObjectsTool
	"Offer the user a parts bin of morphs -- if one already exists, bring it to the front and flash its border beckoningly; if none exists yet, create a new one and place it in the center of the screen"

	| anObjectTool |
	submorphs do:
		[:aMorph | (aMorph renderedMorph isKindOf: ObjectsTool)
			ifTrue:
				[aMorph comeToFront.
				aMorph flash.
				^ self]].
	"None found, so create one"

	anObjectTool := ObjectsTool newStandAlone.
	self addMorphFront: anObjectTool.
	anObjectTool fullBounds.
	anObjectTool center: self center

	"ActiveWorld activateObjectsTool"