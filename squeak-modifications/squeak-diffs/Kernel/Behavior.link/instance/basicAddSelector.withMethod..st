adding/removing methods
basicAddSelector: selector withMethod: compiledMethod 
	"Add the message selector with the corresponding compiled method to the 
	receiver's method dictionary.
	Do this without sending system change notifications"

	self methodDict at: selector put: compiledMethod.
	compiledMethod
		methodClass: self;
		selector: selector.

	"Now flush Squeak's method cache for this selector"
	selector flushCache
