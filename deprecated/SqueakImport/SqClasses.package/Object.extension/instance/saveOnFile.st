*SqClasses-objects from disk
saveOnFile
	"Ask the user for a filename and save myself on a SmartReferenceStream file.  Writes out the version and class structure.  The file is fileIn-able.  Does not file out the class of the object."

	| aFileName |
	aFileName := self class name asFileName.	"do better?"
	aFileName := UIManager default 
				saveFilenameRequest: 'File name?' translated initialAnswer: aFileName.
	aFileName ifNil: [^ Beeper beep].

	self saveOnFileNamed: aFileName
