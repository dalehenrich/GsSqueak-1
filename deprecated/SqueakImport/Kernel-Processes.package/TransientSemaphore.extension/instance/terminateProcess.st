*Kernel-Processes-initialize-release
terminateProcess
	"Terminate the process waiting on this semaphore, if any."

    | semaphore |
    semaphore := self _env0 semaphore.
	semaphore _env0 isEmpty ifFalse: [ self _env0 removeFirst terminate ].
