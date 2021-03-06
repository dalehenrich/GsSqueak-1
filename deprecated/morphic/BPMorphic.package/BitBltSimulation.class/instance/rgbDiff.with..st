combination rules
rgbDiff: sourceWord with: destinationWord 
	"Subract the pixels in the source and destination, color by color,
	and return the sum of the absolute value of all the differences.
	For non-rgb, return the number of differing pixels."
	| _gsSqueakTemp_pixMask _gsSqueakTemp_destShifted _gsSqueakTemp_sourceShifted _gsSqueakTemp_destPixVal _gsSqueakTemp_bitsPerColor _gsSqueakTemp_rgbMask _gsSqueakTemp_sourcePixVal _gsSqueakTemp_diff _gsSqueakTemp_maskShifted |
	<inline: false>
	_gsSqueakTemp_pixMask := maskTable at: destDepth.
	destDepth = 16
		ifTrue: [_gsSqueakTemp_bitsPerColor := 5.
			_gsSqueakTemp_rgbMask := 31]
		ifFalse: [_gsSqueakTemp_bitsPerColor := 8.
			_gsSqueakTemp_rgbMask := 255].
	_gsSqueakTemp_maskShifted := destMask.
	_gsSqueakTemp_destShifted := destinationWord.
	_gsSqueakTemp_sourceShifted := sourceWord.
	1
		to: destPPW
		do: [:i | 
			(_gsSqueakTemp_maskShifted bitAnd: _gsSqueakTemp_pixMask)
					> 0
				ifTrue: ["Only tally pixels within the destination rectangle"
					_gsSqueakTemp_destPixVal := _gsSqueakTemp_destShifted bitAnd: _gsSqueakTemp_pixMask.
					_gsSqueakTemp_sourcePixVal := _gsSqueakTemp_sourceShifted bitAnd: _gsSqueakTemp_pixMask.
					destDepth < 16
						ifTrue: [_gsSqueakTemp_sourcePixVal = _gsSqueakTemp_destPixVal
								ifTrue: [_gsSqueakTemp_diff := 0]
								ifFalse: [_gsSqueakTemp_diff := 1]]
						ifFalse: [_gsSqueakTemp_diff := self
										partitionedSub: _gsSqueakTemp_sourcePixVal
										from: _gsSqueakTemp_destPixVal
										nBits: _gsSqueakTemp_bitsPerColor
										nPartitions: 3.
							_gsSqueakTemp_diff := (_gsSqueakTemp_diff bitAnd: _gsSqueakTemp_rgbMask)
										+ (_gsSqueakTemp_diff >> _gsSqueakTemp_bitsPerColor bitAnd: _gsSqueakTemp_rgbMask)
										+ (_gsSqueakTemp_diff >> _gsSqueakTemp_bitsPerColor >> _gsSqueakTemp_bitsPerColor bitAnd: _gsSqueakTemp_rgbMask)].
					bitCount := bitCount + _gsSqueakTemp_diff].
			_gsSqueakTemp_maskShifted := _gsSqueakTemp_maskShifted >> destDepth.
			_gsSqueakTemp_sourceShifted := _gsSqueakTemp_sourceShifted >> destDepth.
			_gsSqueakTemp_destShifted := _gsSqueakTemp_destShifted >> destDepth].
	^ destinationWord"For no effect on dest"