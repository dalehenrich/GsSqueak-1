accessing class hierarchy
subclassesDo: aBlock 
	"Evaluate the argument, aBlock, for each of the receiver's immediate subclasses."
	self _env0 subclassesDo: aBlock
