*CompiledMethod-printing
printOn: aStream
	aStream
		nextPut: $<;
		print: self message;
		nextPutAll: ' "in '.
	method printReferenceOn: aStream.
	aStream nextPutAll: '">'