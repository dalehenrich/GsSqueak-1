drawing-images
warpImage: aForm transform: aTransform at: extraOffset sourceRect: sourceRect cellSize: cellSize 
	"Warp the given using the appropriate transform and offset."
	| _gsSqueakTemp_tfm |
	_gsSqueakTemp_tfm := (MatrixTransform2x3 withOffset: origin)
				composedWithLocal: aTransform.
	^ self
		privateWarp: aForm
		transform: _gsSqueakTemp_tfm
		at: extraOffset
		sourceRect: sourceRect
		cellSize: cellSize