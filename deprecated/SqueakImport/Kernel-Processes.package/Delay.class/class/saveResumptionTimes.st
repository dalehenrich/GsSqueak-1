timer process
saveResumptionTimes
	"Private! Record the resumption times of all Delays relative to a base time of zero.
	 This is done prior to snapshotting. This method should be called only while the
	 AccessProtect semaphore is held."

	| oldBaseTime |
	oldBaseTime := Time utcMicrosecondClock.
	ActiveDelay ifNotNil:
		[ActiveDelay adjustResumptionTimeOldBase: oldBaseTime newBase: 0].
	SuspendedDelays do:
		[:d | d adjustResumptionTimeOldBase: oldBaseTime newBase: 0]