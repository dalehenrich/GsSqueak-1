testing
isRunnable
	"A process is runnable if it is the active process or is on one of the runnable process lists."
	| myPriority |
	"Grab my prioirty now.  Even though evaluation is strictly right-to-left, accessing Processor could involve a send."
	myPriority := self priority.
	^myList
		ifNil: [^self == Processor activeProcess]
		ifNotNil: [:list| list == (Processor waitingProcessesAt: myPriority)]
