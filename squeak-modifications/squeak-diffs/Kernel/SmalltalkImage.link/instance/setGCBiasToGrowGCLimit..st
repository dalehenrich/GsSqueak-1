memory space
setGCBiasToGrowGCLimit: aNumber
	"Primitive. Indicate that the bias to grow logic should do a GC after aNumber Bytes"
	
	^self primitiveFailed
"Example:
	Smalltalk setGCBiasToGrowGCLimit: 16*1024*1024.
"
