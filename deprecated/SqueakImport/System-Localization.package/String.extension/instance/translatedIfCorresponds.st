*System-Localization
translatedIfCorresponds
	"answer the receiver translated to the default language only if 
	the receiver begins and ends with an underscore (_)"
	^ ('_*_' match: self)
		ifTrue: [(self copyFrom: 2 to: self size - 1) translated]
		ifFalse: [self]