event handling
keyUp: anEvent 
	"Handle a key up event. The default response is to let my
	eventHandler, if any, handle it."
	self eventHandler
		ifNotNil: [self eventHandler keyUp: anEvent fromMorph: self]