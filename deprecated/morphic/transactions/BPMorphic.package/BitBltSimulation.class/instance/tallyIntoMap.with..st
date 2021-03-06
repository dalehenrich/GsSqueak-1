combination rules
tallyIntoMap: sourceWord with: destinationWord 
	"Tally pixels into the color map. Those tallied are exactly those
	in the destination rectangle. Note that the source should be 
	specified == destination, in order for the proper color map checks 
	to be performed at setup."
	| _gsSqueakTemp_mapIndex _gsSqueakTemp_pixMask _gsSqueakTemp_destShifted _gsSqueakTemp_maskShifted _gsSqueakTemp_pixVal |
	<inline: false>
	(cmFlags
			bitAnd: (ColorMapPresent bitOr: ColorMapIndexedPart))
			= (ColorMapPresent bitOr: ColorMapIndexedPart)
		ifFalse: [^ destinationWord"For no effect on dest"].
	_gsSqueakTemp_pixMask := maskTable at: destDepth.
	_gsSqueakTemp_destShifted := destinationWord.
	_gsSqueakTemp_maskShifted := destMask.
	1
		to: destPPW
		do: [:i | 
			(_gsSqueakTemp_maskShifted bitAnd: _gsSqueakTemp_pixMask)
					= 0
				ifFalse: ["Only tally pixels within the destination rectangle"
					_gsSqueakTemp_pixVal := _gsSqueakTemp_destShifted bitAnd: _gsSqueakTemp_pixMask.
					destDepth < 16
						ifTrue: [_gsSqueakTemp_mapIndex := _gsSqueakTemp_pixVal]
						ifFalse: [destDepth = 16
								ifTrue: [_gsSqueakTemp_mapIndex := self
												rgbMap: _gsSqueakTemp_pixVal
												from: 5
												to: cmBitsPerColor]
								ifFalse: [_gsSqueakTemp_mapIndex := self
												rgbMap: _gsSqueakTemp_pixVal
												from: 8
												to: cmBitsPerColor]].
					self tallyMapAt: _gsSqueakTemp_mapIndex put: (self tallyMapAt: _gsSqueakTemp_mapIndex)
							+ 1].
			_gsSqueakTemp_maskShifted := _gsSqueakTemp_maskShifted >> destDepth.
			_gsSqueakTemp_destShifted := _gsSqueakTemp_destShifted >> destDepth].
	^ destinationWord"For no effect on dest"