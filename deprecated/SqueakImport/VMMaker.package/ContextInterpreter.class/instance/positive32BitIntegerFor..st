primitive support
positive32BitIntegerFor: integerValue

	| newLargeInteger |
	"Note - integerValue is interpreted as POSITIVE, eg, as the result of
		Bitmap>at:, or integer>bitAnd:."
	integerValue >= 0
		ifTrue: [(objectMemory isIntegerValue: integerValue)
					ifTrue: [^ objectMemory integerObjectOf: integerValue]].

	objectMemory bytesPerWord = 4
	ifTrue: ["Faster instantiateSmallClass: currently only works with integral word size."
			newLargeInteger := objectMemory instantiateSmallClass: (objectMemory splObj: ClassLargePositiveInteger)
					sizeInBytes: objectMemory baseHeaderSize + 4]
	ifFalse: ["Cant use instantiateSmallClass: due to integral word requirement."
			newLargeInteger := objectMemory instantiateClass: (objectMemory splObj: ClassLargePositiveInteger)
					indexableSize: 4].
	objectMemory storeByte: 3 ofObject: newLargeInteger withValue: ((integerValue >> 24) bitAnd: 16rFF).
	objectMemory storeByte: 2 ofObject: newLargeInteger withValue: ((integerValue >> 16) bitAnd: 16rFF).
	objectMemory storeByte: 1 ofObject: newLargeInteger withValue: ((integerValue >> 8) bitAnd: 16rFF).
	objectMemory storeByte: 0 ofObject: newLargeInteger withValue: (integerValue bitAnd: 16rFF).
	^ newLargeInteger