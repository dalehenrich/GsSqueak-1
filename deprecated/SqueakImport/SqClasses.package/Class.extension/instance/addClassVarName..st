*SqClasses-class variables
addClassVarName: aString 
	"Add the argument, aString, as a class variable of the receiver.
	Signal an error if the first character of aString is not capitalized,
	or if it is already a variable named in the class."
	^ self _env0 addClassVarName: aString
