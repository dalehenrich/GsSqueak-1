primitives
primSocket: aHandle listenOn: portNumber backlogSize: backlog
	"Primitive. Set up the socket to listen on the given port.
	Will be used in conjunction with #accept only."
	self notYetImplemented.
	self destroy. "Accept not supported so clean up"