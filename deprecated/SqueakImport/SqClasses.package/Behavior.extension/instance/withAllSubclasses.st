*SqClasses-accessing class hierarchy
withAllSubclasses
	"Answer a Collection of the receiver, the receiver's descendent's, and the  
	receiver's descendent's subclasses."

	^ self allSubclasses addFirst: self;
		 yourself
