displaying-generic
displayOn: aDisplayMedium
	"Display the border and insideRegion of the receiver."

	borderWidth ~= 0 ifTrue: [
		aDisplayMedium
			border: self region
			widthRectangle: borderWidth
			rule: Form over
			fillColor: borderColor ].
	insideColor ifNotNil: [
		aDisplayMedium fill: self inside fillColor: insideColor ]