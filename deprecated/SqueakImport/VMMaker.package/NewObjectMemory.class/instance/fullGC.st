garbage collection
fullGC
	"Do a mark/sweep garbage collection of the entire object memory. Free inaccessible objects but do not move them."

	<inline: false>
	fullGCLock > 0 ifTrue:
		[self warning: 'aborting fullGC because fullGCLock > 0'.
		 ^false].
	self initializeFreeBlocksPreSweep.
	self runLeakCheckerForFullGC: true.
	interpreter preGCAction: true.
	gcStartUsecs := self ioMicroSecondClock.
	statSweepCount := statMarkCount := statMkFwdCount := statCompMoveCount := 0.
	self clearRootsTable.
	youngStart := self startOfMemory.  "process all of memory"
	self markPhase: true.
	"Sweep phase returns the number of survivors.
	Use the up-to-date version instead the one from startup."
	totalObjectCount := self sweepPhaseForFullGC.
	self runLeakCheckerForFullGC: true.
	self fullCompaction.
	statFullGCs := statFullGCs + 1.
	statGCEndUsecs := self ioMicroSecondClock.
	statFullGCUsecs := statFullGCUsecs + (statGCEndUsecs - gcStartUsecs).
	self capturePendingFinalizationSignals.

	youngStart := freeStart.  "reset the young object boundary"
	self postGCAction: true.
	self runLeakCheckerForFullGC: true