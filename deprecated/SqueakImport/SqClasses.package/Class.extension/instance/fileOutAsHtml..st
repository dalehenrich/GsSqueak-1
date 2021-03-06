*SqClasses-fileIn/Out
fileOutAsHtml: useHtml
	"File a description of the receiver onto a new file whose base name is the name of the receiver."

	| internalStream |
	internalStream := WriteStream on: (String new: 100).
	internalStream header; timeStamp.

	self sharedPools size > 0 ifTrue: [
		self shouldFileOutPools
			ifTrue: [self fileOutSharedPoolsOn: internalStream]].
	self fileOutOn: internalStream moveSource: false toFile: 0.
	internalStream trailer.

	FileStream writeSourceCodeFrom: internalStream baseName: self name isSt: true useHtml: useHtml.
