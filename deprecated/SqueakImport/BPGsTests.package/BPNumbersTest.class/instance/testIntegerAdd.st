as yet unclassified
testIntegerAdd
	Object newMethodFromSqueakString: 'foo
	^ 2 + (5/2) = (9/2)' inEnv:7.
	self assert: (Object new @env7: foo) equals: true.
