declaring
declarations
	^ Array
		streamContents: [:out | declarations
				associationsDo: [:ea | out nextPut: ea]]