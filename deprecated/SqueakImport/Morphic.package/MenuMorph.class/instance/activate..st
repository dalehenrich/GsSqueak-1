events
activate: evt
	"Receiver should be activated; e.g., so that control passes correctly."
	evt hand 
		newMouseFocus: self;
		newKeyboardFocus: self