printing
printDefinitionForClosureAnalysisOn: aStream 
	| refs |
	aStream nextPut: ${;
		 nextPutAll: key.
	definingScope
		ifNotNil: [definingScope blockExtent
				ifNotNil: [:be | aStream nextPutAll: ' d@';
						 print: be first]].
	readingScopes
		ifNotNil: [refs := Set new.
			readingScopes
				do: [:elems | refs addAll: elems].
			refs sorted
				do: [:read | aStream nextPutAll: ' r@';
						 print: read]].
	remoteTemps
		do: [:rt | rt printDefinitionForClosureAnalysisOn: aStream]
		separatedBy: [aStream nextPut: $,;
				 space].
	aStream nextPut: $}