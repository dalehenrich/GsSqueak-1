instance creation
fromFileNamed: fileName
	"Read a Form or ColorForm from the given file."

	| file form |
	file := (FileStream readOnlyFileNamed: fileName) binary.
	form := self fromBinaryStream: file.
	Smalltalk isMorphic ifTrue:[
		Project current resourceManager
			addResource: form
			url: (FileDirectory urlForFileNamed: file name) asString].
	file close.
	^ form
