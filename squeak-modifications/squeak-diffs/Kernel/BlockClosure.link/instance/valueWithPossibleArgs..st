evaluating
valueWithPossibleArgs: anArray 

	^self numArgs = 0
		ifTrue: [self value]
		ifFalse:
			[self valueWithArguments:
				(self numArgs = anArray size
					ifTrue: [anArray]
					ifFalse:
						[self numArgs > anArray size
							ifTrue: [anArray, (Array new: self numArgs - anArray size)]
							ifFalse: [anArray copyFrom: 1 to: self numArgs]])]

