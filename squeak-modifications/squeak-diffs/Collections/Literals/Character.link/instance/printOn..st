printing
printOn: aStream
	| integerValue |
	((integerValue := self asInteger) > 32 and: [integerValue ~= 127]) ifTrue:
		[^self printAsLiteralOn: aStream].
	(self class constantNameFor: self)
		ifNotNil: [ :name | aStream nextPutAll: self class name; space; nextPutAll: name ]
		ifNil: [ aStream nextPutAll: self class name; nextPutAll: ' value: '; print: integerValue ]
