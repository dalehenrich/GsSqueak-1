primitive support
signed32BitValueOf: oop 
	"Convert the given object into an integer value.
	The object may be either a SmallInteger or a four-byte LargeInteger."
	objectMemory hasSixtyFourBitImmediates
		ifTrue: [(objectMemory isIntegerObject: oop)
				ifTrue: [| value64 |
					value64 := objectMemory integerValueOf: oop.
					(self
							cCode: [(self cCoerceSimple: value64 to: #int)
									~= value64]
							inSmalltalk: [value64 >> 31 ~= 0
									and: [value64 >> 31 ~= -1]])
						ifTrue: [self primitiveFail.
							value64 := 0].
					^ value64].
			self primitiveFail.
			^ 0]
		ifFalse: [(objectMemory isIntegerObject: oop)
				ifTrue: [^ objectMemory integerValueOf: oop].
			^ self noInlineSigned32BitValueGutsOf: oop]