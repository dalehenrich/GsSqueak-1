*SqNumbers-comparing
= comparand 
	"Implementation of Number 'comparing' method."
	comparand isNumber ifFalse: [^ false].
	(comparand isKindOf: ScaledDecimal) ifTrue: [^ mantissa = comparand asFraction].
	^ comparand adaptToScaledDecimal: self andCompare: #=
