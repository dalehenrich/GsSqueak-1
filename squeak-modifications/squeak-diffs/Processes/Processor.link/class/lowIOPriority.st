priority names
lowIOPriority
	"Answer the priority at which most input/output processes should run. 
	Examples are the process handling input from the user (keyboard, 
	pointing device, etc.) and the process distributing input from a network."

	^ self _env0 lowIOPriority
