file creation
forceNewFileNamed: fileName 
	"Create a new file with the given name, and answer a stream opened 
	for writing on that file. If the file already exists, delete it without 
	asking before creating the new file."
	| dir localName fullName f |
	fullName := self fullName: fileName.
	(self isAFileNamed: fullName)
		ifFalse: 
			[f := self new open: fullName forWrite: true.
			^ f
				ifNil: ["Failed to open the file"
					(FileDoesNotExistException fileName: fullName) signal]].
	dir := FileDirectory forFileName: fullName.
	localName := FileDirectory localNameFor: fullName.
	dir
		deleteFileNamed: localName
		ifAbsent: [(CannotDeleteFileException new
			messageText: 'Could not delete the old version of file ' , fullName) signal].
	f := self new open: fullName forWrite: true.
	^ f
		ifNil: ["Failed to open the file"
			(FileDoesNotExistException fileName: fullName) signal]