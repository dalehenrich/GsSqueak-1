*SqClasses-*SqClasses-*SqClasses-vm parameters
maxExternalSemaphores
	"The size of table where external semaphores are registered. Only in Cog"
	self isRunningCog ifFalse: [^nil].
	^self vmParameterAt: 49
