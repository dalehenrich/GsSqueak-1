visual properties
fillStyle
	"Return the current fillStyle of the receiver."
	^ self
		valueOfProperty: #fillStyle
		ifAbsent: ["Workaround already converted morphs"
			color
				ifNil: [self defaultColor]]