visual properties
fillStyle: aFormOrColorOrFillStyle 
	^ super
		fillStyle: (aFormOrColorOrFillStyle isForm
				ifTrue: [InfiniteForm with: aFormOrColorOrFillStyle]
				ifFalse: [aFormOrColorOrFillStyle isColor
						ifTrue: [SolidFillStyle color: aFormOrColorOrFillStyle]
						ifFalse: [aFormOrColorOrFillStyle]])