*SqClasses-instance creation
readFrom: textStringOrStream
	"Create an object based on the contents of textStringOrStream."

	| object |
	(Compiler couldEvaluate: textStringOrStream)
		ifFalse: [^ self error: 'expected String, Stream, or Text'].
	object := self environment beCurrentDuring: [Compiler evaluate: textStringOrStream environment: self environment].
	(object isKindOf: self) ifFalse: [self error: self name, ' expected'].
	^object
