expression types
scanLitVec
	| s |
	s := WriteStream
				on: (Array new: 16).
	[tokenType == #rightParenthesis
		or: [tokenType == #doIt]]
		whileFalse: [tokenType == #leftParenthesis
				ifTrue: [self scanToken; scanLitVec]
				ifFalse: [(tokenType == #word
							or: [tokenType == #keyword
									or: [tokenType == #colon]])
						ifTrue: [self scanLitWord.
							token == #true
								ifTrue: [token := true].
							token == #false
								ifTrue: [token := false].
							token == #nil
								ifTrue: [token := nil]]
						ifFalse: [(token isCharacter
									and: [tokenType ~~ #character])
								ifTrue: [token := token asSymbol]
								ifFalse: [(token == #-
											and: [(self typeTableAt: hereChar)
													== #xDigit])
										ifTrue: [self scanToken.
											token := token negated]]]].
			s nextPut: token.
			self scanToken].
	token := s contents