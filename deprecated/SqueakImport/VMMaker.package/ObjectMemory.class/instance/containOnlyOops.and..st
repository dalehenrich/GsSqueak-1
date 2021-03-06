become
containOnlyOops: array1 and: array2 
	"Return true if neither array contains a small integer. You 
	can't become: integers!"
	| fieldOffset |
	fieldOffset := self lastPointerOf: array1.
	"same size as array2"
	[fieldOffset >= self baseHeaderSize]
		whileTrue: [(self isIntegerObject: (self longAt: array1 + fieldOffset)) ifTrue: [^ false].
			(self isIntegerObject: (self longAt: array2 + fieldOffset)) ifTrue: [^ false].
			fieldOffset := fieldOffset - self bytesPerWord].
	^ true