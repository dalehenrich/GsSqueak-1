memory access
uint16AtPointer: pointer put: value 
	"This gets implemented by Macros in C, where its types will also be
	checked. pointer is a raw address, and the result is an 16 bit integer."
	^ self shortAt: pointer put: value