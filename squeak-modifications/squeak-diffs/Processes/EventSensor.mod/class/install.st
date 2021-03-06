class initialization
install	"EventSensor install"
    
	"Install an EventSensor in place of the current Sensor if one exists.
	On GsSqueak	bootstrap no Sensor exists."
	| newSensor |
	Sensor ifNotNil: [
    	Sensor shutDown ].
    
	newSensor := self new.
	newSensor startUp.
	
	Sensor ifNotNil: [
	    "Note: We must use #become: here to replace all references to the old sensor with the new one, since Sensor is referenced from all the existing controllers."
	    Sensor _env0 become: newSensor ]
	ifNil: [
	    Smalltalk at: #Sensor put: newSensor ]
