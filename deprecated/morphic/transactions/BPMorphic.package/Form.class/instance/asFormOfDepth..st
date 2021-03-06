converting
asFormOfDepth: d 
	"Create a copy of me with depth 'd'. Includes a correction for some
	bitmaps that when imported have poorly set up transparency"
	| newForm |
	d = self depth
		ifTrue: [^ self].
	newForm := Form extent: self extent depth: d.
	(BitBlt toForm: newForm)
		colorMap: (self colormapIfNeededFor: newForm);
		
		copy: self boundingBox
		from: 0 @ 0
		in: self
		fillColor: nil
		rule: Form over.
	"Special case: For a 16 -> 32 bit conversion fill the alpha channel
	because it gets lost in translation."
	d = 32
		ifTrue: [newForm fixAlpha].
	^ newForm