printing
printOn: aStream 
	"Append to the argument, aStream, a sequence of characters that 
	identifies the receiver." 
	super printOn: aStream.
	aStream nextPutAll: ' ' , self identityHashPrintString.
	locked == true
		ifTrue: [aStream nextPutAll: ' [locked] '].
	visible == false
		ifTrue: [aStream nextPutAll: '[not visible] '].
	sticky == true
		ifTrue: [aStream nextPutAll: ' [sticky] '].
	balloonText
		ifNotNil: [aStream nextPutAll: ' [balloonText] '].
	balloonTextSelector
		ifNotNil: [aStream nextPutAll: ' [balloonTextSelector: ' , balloonTextSelector printString , '] '].
	externalName
		ifNotNil: [aStream nextPutAll: ' [externalName = ' , externalName , ' ] '].
	isPartsDonor == true
		ifTrue: [aStream nextPutAll: ' [isPartsDonor] '].
	player
		ifNotNil: [aStream nextPutAll: ' [player = ' , player printString , '] '].
	eventHandler
		ifNotNil: [aStream nextPutAll: ' [eventHandler = ' , eventHandler printString , '] '].
	(otherProperties isNil or: [otherProperties isEmpty ]) ifTrue: [^ self].
	aStream nextPutAll: ' [other: '.
	self otherProperties
		keysDo: [:aKey | aStream nextPutAll: ' (' , aKey , ' -> ' , (self otherProperties at: aKey) printString , ')'].
	aStream nextPut: $]