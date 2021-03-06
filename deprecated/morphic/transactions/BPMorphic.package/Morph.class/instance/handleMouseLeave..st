events-processing
handleMouseLeave: anEvent 
	"System level event handling."
	anEvent hand removePendingBalloonFor: self.
	anEvent hand removePendingHaloFor: self.
	anEvent isDraggingEvent
		ifTrue: [(self handlesMouseOverDragging: anEvent)
				ifTrue: [anEvent wasHandled: true.
					self mouseLeaveDragging: anEvent].
			^ self].
	(self handlesMouseOver: anEvent)
		ifTrue: [anEvent wasHandled: true.
			self mouseLeave: anEvent]