menu
setTarget: evt 
	"Set the default target object to be used for add item commands, and
	re-target all existing items to the new target or the the invoking hand."
	| _gsSqueakTemp_oldDefaultTarget |
	_gsSqueakTemp_oldDefaultTarget := defaultTarget.
	self sightTargets: evt.
	_gsSqueakTemp_oldDefaultTarget ~~ defaultTarget
		ifTrue: [self updateItemsWithTarget: defaultTarget orWithHand: evt hand]