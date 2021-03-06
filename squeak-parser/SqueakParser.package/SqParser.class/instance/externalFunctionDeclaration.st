primitives
externalFunctionDeclaration
	"Parse the function declaration for a call to an external library."
	| descriptorClass callType modifier retType externalName args argType module fn |
	descriptorClass := cue environment
				valueOf: #ExternalFunction
				ifAbsent: [^ false].
	callType := descriptorClass callingConventionFor: here.
	callType == nil
		ifTrue: [^ false].
	[modifier := descriptorClass callingConventionModifierFor: token.
	modifier notNil]
		whileTrue: [self advance.
			callType := callType bitOr: modifier].
	"Parse return type"
	self advance.
	retType := self externalType: descriptorClass.
	retType == nil
		ifTrue: [^ self expected: 'return type'].
	"Parse function name or index"
	externalName := here.
	(self match: #string)
		ifTrue: [externalName := externalName asSymbol]
		ifFalse: [(self match: #number)
				ifFalse: [^ self expected: 'function name or index']].
	(self match: #leftParenthesis)
		ifFalse: [^ self expected: 'argument list'].
	args := WriteStream on: Array new.
	[self match: #rightParenthesis]
		whileFalse: [argType := self externalType: descriptorClass.
			argType == nil
				ifTrue: [^ self expected: 'argument'].
			argType isVoid & argType isPointerType not
				ifFalse: [args nextPut: argType]].
	(self matchToken: 'module:')
		ifTrue: [module := here.
			(self match: #string)
				ifFalse: [^ self expected: 'String'].
			module := module asSymbol].
	Smalltalk
		at: #ExternalLibraryFunction
		ifPresent: [:xfn | 
			fn := xfn
						name: externalName
						module: module
						callType: callType
						returnType: retType
						argumentTypes: args contents.
			self allocateLiteral: fn].
	(self matchToken: 'error:')
		ifTrue: [| errorCodeVariable |
			errorCodeVariable := here.
			(hereType == #string
					or: [hereType == #word])
				ifFalse: [^ self expected: 'error code (a variable or string)'].
			self advance.
			self
				addPragma: (SqPragma
						keyword: #primitive:error:
						arguments: (Array with: 120 with: errorCodeVariable)).
			fn
				ifNotNil: [fn setErrorCodeName: errorCodeVariable]]
		ifFalse: [self
				addPragma: (SqPragma keyword: #primitive: arguments: #(120))].
	^ true