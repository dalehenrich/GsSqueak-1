testing-printing
self waitingForCompilerImplementation.
testPrintStringAll
	Character allByteCharacters do: [ :each |
		self assert: (self class newCompiler 
			evaluate: each printString) = each ].
