as yet unclassified
isClassForVersion: aString

	^(aString beginsWith: '3.2')
		or: [aString beginsWith: '3.3']
		or: [aString beginsWith: '3.4']
		or: [aString beginsWith: '3.5']
	