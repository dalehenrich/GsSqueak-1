accessing - real class
originalSuperclass

	^ self realClass superclass
		ifNil: [#nil]
		ifNotNil: [:cls | cls theNonMetaClass name]