instance creation
new: length neg: neg
	"Answer an instance of a large integer whose size is length. neg is a flag 
	determining whether the integer is negative or not."

	neg 
		ifTrue: [^ self shouldBeImplemented.]
		ifFalse: [^LargeInteger new: length]
