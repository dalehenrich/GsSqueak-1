metaclasses
theNonMetaClass

	^ self isMeta
		ifTrue: [self copy isMeta: false]
		ifFalse: [self]