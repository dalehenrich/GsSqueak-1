*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqArray-testing
isLiteralIfContainedBy: parents
	" Answer whether the receiver has a literal text form recognized by the compiler. Precondition: the receiver is an instance of Array. "

	(parents includes: self) ifTrue: [ ^false ].
	parents add: self.
	1 to: self size do: [ :index |
		| element |
		element := self at: index.
		(element class == Array
			ifTrue: [ element isLiteralIfContainedBy: parents ]
			ifFalse: [ element isLiteral ]) ifFalse: [ ^false ] ].
	parents remove: self.
	^true
