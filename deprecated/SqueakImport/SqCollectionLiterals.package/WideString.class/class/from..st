instance creation
from: aString 

	| newString |
	(aString isMemberOf: self)
		ifTrue: [^ aString copy].
	newString := QuadByteString new: aString size.
	1 to: aString size do: [:index | newString basicAt: index put: (aString basicAt: index)].
	^ newString
