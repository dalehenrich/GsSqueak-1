evaluating
cull: firstArg cull: secondArg cull: thirdArg cull: fourthArg
	"Activate the receiver, with four or less arguments."
	
	self numArgs >= 3 ifTrue: [
		self numArgs >= 4 ifTrue: [
			^self value: firstArg value: secondArg value: thirdArg value: fourthArg ].
		^self value: firstArg value: secondArg value: thirdArg ].
	self numArgs = 2 ifTrue: [ ^self value: firstArg value: secondArg ].	
	self numArgs = 1 ifTrue: [ ^self value: firstArg ].
	^self value

