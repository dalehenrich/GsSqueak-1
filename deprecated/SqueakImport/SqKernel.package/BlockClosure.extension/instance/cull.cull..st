*SqKernel-evaluating
cull: firstArg cull: secondArg
	"Activate the receiver, with two or less arguments."
	
	self numArgs >= 2 ifTrue: [ ^self value: firstArg value: secondArg ].	
	self numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value

