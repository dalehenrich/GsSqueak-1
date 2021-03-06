*SqClasses-message handling
perform: selector withArguments: argArray inSuperclass: lookupClass
	"NOTE:  This is just like perform:withArguments:, except that
	the message lookup process begins, not with the receivers's class,
	but with the supplied superclass instead.  It will fail if lookupClass
	cannot be found among the receiver's superclasses.
	Primitive. Essential. See Object documentation whatIsAPrimitive."

	(self isKindOf: lookupClass) ifFalse: [self error: 'lookupClass is not in my inheritance chain'].
	^ (lookupClass lookupSelector: selector)
		ifNil: [self error: 'lookupClass is not in my inheritance chain']
		ifNotNil: [:compiledMethod | self withArgs: argArray executeMethod: compiledMethod]
	
