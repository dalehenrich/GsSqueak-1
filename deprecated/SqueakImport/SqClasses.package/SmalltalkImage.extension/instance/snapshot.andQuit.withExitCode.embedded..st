*SqClasses-*SqClasses-*SqClasses-snapshot and quit
snapshot: save andQuit: quit withExitCode: exitCode embedded: embeddedFlag
	"Mark the changes file and close all files as part of #processShutdownList.
	If save is true, save the current state of this Smalltalk in the image file.
	If quit is true, then exit to the outer OS shell.
	If exitCode is not nil, then use it as exit code.
	The latter part of this method runs when resuming a previously saved image. This resume logic checks for a document file to process when starting up."

	| resuming msg |
	Object flushDependents.
	Object flushEvents.

	(SourceFiles at: 2) ifNotNil:[
		msg := String streamContents: [ :s |
			s nextPutAll: '----';
			nextPutAll: (save ifTrue: [ quit ifTrue: [ 'QUIT' ] ifFalse: [ 'SNAPSHOT' ] ]
							ifFalse: [quit ifTrue: [ 'QUIT/NOSAVE' ] ifFalse: [ 'NOP' ]]);
			nextPutAll: '----';
			print: Date dateAndTimeNow; space;
			nextPutAll: (FileDirectory default localNameFor: self imageName);
			nextPutAll: ' priorSource: ';
			print: LastQuitLogPosition ].
		self assureStartupStampLogged.
		save ifTrue: [ LastQuitLogPosition := (SourceFiles at: 2) setToEnd; position ].
		self logChange: msg.
		Transcript cr; show: msg
	].

	Smalltalk processShutDownList: quit.
	Cursor write show.
	save ifTrue: [resuming := embeddedFlag 
					ifTrue: [self snapshotEmbeddedPrimitive] 
					ifFalse: [self snapshotPrimitive]]  "<-- PC frozen here on image file"
		ifFalse: [resuming := false].
	quit & (resuming == false) ifTrue: [
		exitCode
			ifNil: [ self quitPrimitive ]
			ifNotNil: [ self quitPrimitive: exitCode ] ].
	Cursor normal show.
	Smalltalk setGCParameters.
	resuming == true ifTrue: [Smalltalk clearExternalObjects].
	Smalltalk processStartUpList: resuming == true.
	resuming == true ifTrue:[
		self setPlatformPreferences.
		self recordStartupStamp].
	Project current wakeUpTopWindow.
	"Now it's time to raise an error"
	resuming == nil ifTrue: [self error:'Failed to write image file (disk full?)'].
	^ resuming
