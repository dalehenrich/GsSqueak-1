*SqClasses-*SqClasses-*SqClasses-housekeeping
verifyChanges		"Smalltalk verifyChanges"
	"Recompile all methods in the changes file."
	self systemNavigation allBehaviorsDo: [:class | class recompileChanges].
