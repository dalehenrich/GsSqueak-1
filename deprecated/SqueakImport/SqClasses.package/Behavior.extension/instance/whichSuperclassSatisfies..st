*SqClasses-queries
whichSuperclassSatisfies: aBlock 
	(aBlock value: self) ifTrue: [^self].
	^ self superclass isNil 
		ifTrue: [nil]
		ifFalse: [self superclass whichSuperclassSatisfies: aBlock]
