*SqClasses-message handling
perform: selector withEnoughArguments: anArray
	"Send selector to the receiver with arguments in anArray. Only use enough arguments for the arity of the selector; supply nils for missing ones."
	
	| numArgs args |
	(numArgs := selector numArgs) = anArray size 
		ifTrue: [ args := anArray asArray ]
		ifFalse: [
			args := Array new: numArgs.
			args 
				replaceFrom: 1
				to: (anArray size min: args size)
				with: anArray
				startingAt: 1 ].
	^self perform: selector withArguments: args
