*Kernel-Processes-mutual exclusion
critical: aBlock
	"Evaluate aBlock protected by the receiver."
	^ self _env0 critical: aBlock
