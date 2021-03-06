file primitives
primitiveDirectoryEntry
	| name pathName array result |
	name := self stringOf: self stackTop.
	pathName := self stringOf: (self stackValue: 1).
	
	self successful ifFalse:
		[^self primitiveFail].

	array := FileDirectory default primLookupEntryIn: pathName name: name.
	array == nil ifTrue:
		[self pop: 3 thenPush: objectMemory nilObj.
		^array].
	array == #badDirectoryPath ifTrue:
		[self halt.
		^self primitiveFail].
	array == #primFailed ifTrue:
		[self halt.
		^self primitiveFail].

	result := self makeDirEntryName: (array at: 1) size: (array at: 1) size
				createDate: (array at: 2) modDate: (array at: 3)
				isDir: (array at: 4)  fileSize: (array at: 5).
	self pop: 3.
	self push: result