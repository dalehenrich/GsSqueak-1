submorphs-add/remove
replaceSubmorph: oldMorph by: newMorph 
	| index itsPosition |
	oldMorph stopStepping.
	itsPosition := oldMorph referencePositionInWorld.
	index := submorphs indexOf: oldMorph.
	oldMorph privateDelete.
	self privateAddMorph: newMorph atIndex: index.
	newMorph referencePositionInWorld: itsPosition.
	newMorph world
		ifNotNil: [:w | w startSteppingSubmorphsOf: newMorph]