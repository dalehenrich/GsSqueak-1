system control primitives
primitiveSignalAtMilliseconds
	"Cause the time semaphore, if one has been registered, to be
	 signalled when the microsecond clock is greater than or equal to
	 the given tick value. A tick value of zero turns off timer interrupts."
	| msecsObj msecs deltaMsecs sema |
	<var: #msecs type: #usqInt>
	msecsObj := self stackTop.
	sema := self stackValue: 1.
	msecs := self positive32BitValueOf: msecsObj.
	(self failed
	 or: [objectMemory isIntegerObject: sema]) ifTrue:
		[self primitiveFail.
		 ^nil].
	(objectMemory fetchClassOfNonInt: sema) = (objectMemory splObj: ClassSemaphore)
		ifTrue:
			[objectMemory splObj: TheTimerSemaphore put: sema.
			deltaMsecs := msecs - (self ioMSecs bitAnd: MillisecondClockMask).
			deltaMsecs < 0 ifTrue:
				[deltaMsecs := deltaMsecs + MillisecondClockMask + 1].
			nextWakeupUsecs := self ioUTCMicroseconds + (deltaMsecs * 1000)]
		ifFalse:
			[objectMemory
				storePointer: TheTimerSemaphore
				ofObject: objectMemory getSpecialObjectsOop
				withValue: objectMemory nilObject.
			nextWakeupUsecs := 0].
	self pop: 2