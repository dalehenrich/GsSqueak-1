postscript generation
storeHexBitsOn: aStream 
	^ self
		storeBits: 28
		to: 0
		on: aStream