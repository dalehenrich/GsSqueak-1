*SqClasses-printing
printWithClosureAnalysisOn: aStream 
	"Refer to the comment in Object|printOn:." 

	aStream nextPutAll: 'a descendent of '.
	self superclass printWithClosureAnalysisOn: aStream
