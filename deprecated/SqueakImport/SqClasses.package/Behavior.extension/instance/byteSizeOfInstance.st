*SqClasses-accessing instances and variables
byteSizeOfInstance
	"Answer the total memory size of an instance of the receiver."

	self isVariable ifTrue:
		[^self byteSizeOfInstanceOfSize: 0].
	self primitiveFailed
