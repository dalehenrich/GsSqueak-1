events-processing
sendFilterEventCapture: anEvent for: anObject 
	"Apply event capturing filters."
	^ self
		sendFilterEventCaptureAgain: (self
				sendFilterEvent: anEvent
				for: anObject
				to: self eventCaptureFilters)
		for: anObject