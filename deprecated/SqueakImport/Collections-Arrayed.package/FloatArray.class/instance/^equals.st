comparing
= aFloatArray 
	| length |
	
	aFloatArray class = self class ifFalse: [^ false].
	length := self size.
	length = aFloatArray size ifFalse: [^ false].
	1 to: self size do: [:i | (self at: i)
			= (aFloatArray at: i) ifFalse: [^ false]].
	^ true