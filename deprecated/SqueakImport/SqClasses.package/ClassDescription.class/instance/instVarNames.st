*SqClasses-instance variables
instVarNames
	"Answer an Array of the receiver's instance variable names."
	^ self _env0 instVarNames collect: [:symbol | symbol asString]
