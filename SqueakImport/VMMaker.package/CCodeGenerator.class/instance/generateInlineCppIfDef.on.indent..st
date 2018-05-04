C translation
generateInlineCppIfDef: msgNode on: aStream indent: level
	"Generate the C code for this message onto the given stream."

	| comment |
	aStream cr; nextPutAll: '# ifdef ', msgNode args first value.
	comment := msgNode args third value.
	(comment isKindOf: String)
		ifTrue: [aStream nextPutAll: '  // ', comment]
		ifFalse: ["nil argument, ignore it"].
	aStream cr.
	msgNode isExpression
		ifTrue:
			[aStream tab: level + 1; nextPut: $(.
			msgNode args fourth asExpression
				emitCCodeOn: aStream level: level + 1 generator: self.
			aStream nextPut: $); cr]
		ifFalse:
			[msgNode args fourth
				emitCCodeOn: aStream level: level generator: self].
	aStream nextPutAll: '# endif  // ', msgNode args first value; cr; tab: level