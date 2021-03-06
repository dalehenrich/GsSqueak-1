*VMMaker-translation support
isDefinedTrueExpression: condition inSmalltalk: conditionBlock comment: commentStringOrNil ifTrue: trueExpressionOrBlock ifFalse: falseExpressionOrBlockOrNil
	"When translated, produces #if (condition) #else #endif CPP directives.
	Example usage:

		self isDefinedTrueExpression: 'BytesPerWord == 8'
			inSmalltalk: [BytesPerWord = 8]
			comment: 'conditional on object word size'
			ifTrue: [self doSomethingFor64BitWord]
			ifFalse: [self doSomethingFor32BitWord]"

	^ conditionBlock value
		ifTrue: [trueExpressionOrBlock value]
		ifFalse: [falseExpressionOrBlockOrNil value]
