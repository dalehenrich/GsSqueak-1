*SqCollections-enumeration
associationsDo: aBlock 
	
	self _env0 keyAndValuesDo: [ :key :value | aBlock value: (Association key: key value: value) ]
