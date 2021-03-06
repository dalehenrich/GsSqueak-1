translation
translateInDirectory: directory doInlining: inlineFlag
"This is the default method for writing out sources for a plugin. Several classes need special handling, so look at all implementors of this message"
	| cg fname fstat |
	 fname := self moduleFileName.

	"don't translate if the file is newer than my timeStamp"
	fstat := directory entryAt: fname ifAbsent:[nil].
	fstat ifNotNil:[self timeStamp < fstat modificationTime ifTrue:[^nil]].

	self initialize.
	cg := self buildCodeGenerator.
	cg storeCodeOnFile:  (directory fullNameFor: fname) doInlining: inlineFlag.
	^cg exportedPrimitiveNames asArray