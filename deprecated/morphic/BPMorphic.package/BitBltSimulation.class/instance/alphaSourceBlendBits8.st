inner loop
alphaSourceBlendBits8
	"This version assumes 
	combinationRule = 34
	sourcePixSize = 32
	destPixSize = 8
	sourceForm ~= destForm.
	Note: This is not real blending since we don't have the source colors
	available. "
	| _gsSqueakTemp_srcIndex _gsSqueakTemp_dstIndex _gsSqueakTemp_sourceWord _gsSqueakTemp_srcAlpha _gsSqueakTemp_destWord _gsSqueakTemp_deltaX _gsSqueakTemp_deltaY _gsSqueakTemp_srcY _gsSqueakTemp_dstY _gsSqueakTemp_dstMask _gsSqueakTemp_srcShift _gsSqueakTemp_adjust _gsSqueakTemp_mappingTable _gsSqueakTemp_mapperFlags |
	<inline: false>
	<var: #mappingTable type: 'unsigned int *'>
	_gsSqueakTemp_mappingTable := self default8To32Table.
	_gsSqueakTemp_mapperFlags := cmFlags bitAnd: ColorMapNewStyle bitInvert32.
	_gsSqueakTemp_deltaY := bbH + 1.
	"So we can pre-decrement"
	_gsSqueakTemp_srcY := sy.
	_gsSqueakTemp_dstY := dy.
	mask1 := (dx bitAnd: 3)
				* 8.
	destMSB
		ifTrue: [mask1 := 24 - mask1].
	mask2 := AllOnes bitXor: 255 << mask1.
	(dx bitAnd: 1)
			= 0
		ifTrue: [_gsSqueakTemp_adjust := 0]
		ifFalse: [_gsSqueakTemp_adjust := 522133279].
	(dy bitAnd: 1)
			= 0
		ifTrue: [_gsSqueakTemp_adjust := _gsSqueakTemp_adjust bitXor: 522133279].
	"This is the outer loop"
	[(_gsSqueakTemp_deltaY := _gsSqueakTemp_deltaY - 1) ~= 0]
		whileTrue: [_gsSqueakTemp_adjust := _gsSqueakTemp_adjust bitXor: 522133279.
			_gsSqueakTemp_srcIndex := sourceBits + (_gsSqueakTemp_srcY * sourcePitch) + (sx * 4).
			_gsSqueakTemp_dstIndex := destBits + (_gsSqueakTemp_dstY * destPitch) + (dx // 4 * 4).
			_gsSqueakTemp_deltaX := bbW + 1.
			"So we can pre-decrement"
			_gsSqueakTemp_srcShift := mask1.
			_gsSqueakTemp_dstMask := mask2.
			"This is the inner loop"
			[(_gsSqueakTemp_deltaX := _gsSqueakTemp_deltaX - 1) ~= 0]
				whileTrue: [_gsSqueakTemp_sourceWord := ((self srcLongAt: _gsSqueakTemp_srcIndex)
								bitAnd: _gsSqueakTemp_adjust bitInvert32)
								+ _gsSqueakTemp_adjust.
					_gsSqueakTemp_srcAlpha := _gsSqueakTemp_sourceWord >> 24.
					_gsSqueakTemp_srcAlpha > 31
						ifTrue: ["Everything below 31 is transparent"
							_gsSqueakTemp_srcAlpha < 224
								ifTrue: ["Everything above 224 is opaque"
									_gsSqueakTemp_destWord := self dstLongAt: _gsSqueakTemp_dstIndex.
									_gsSqueakTemp_destWord := _gsSqueakTemp_destWord bitAnd: _gsSqueakTemp_dstMask bitInvert32.
									_gsSqueakTemp_destWord := _gsSqueakTemp_destWord >> _gsSqueakTemp_srcShift.
									_gsSqueakTemp_destWord := _gsSqueakTemp_mappingTable at: _gsSqueakTemp_destWord.
									_gsSqueakTemp_sourceWord := self alphaBlendScaled: _gsSqueakTemp_sourceWord with: _gsSqueakTemp_destWord].
							_gsSqueakTemp_sourceWord := self mapPixel: _gsSqueakTemp_sourceWord flags: _gsSqueakTemp_mapperFlags.
							_gsSqueakTemp_sourceWord := _gsSqueakTemp_sourceWord << _gsSqueakTemp_srcShift.
							"Store back"
							self
								dstLongAt: _gsSqueakTemp_dstIndex
								put: _gsSqueakTemp_sourceWord
								mask: _gsSqueakTemp_dstMask].
					_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 4.
					destMSB
						ifTrue: [_gsSqueakTemp_srcShift = 0
								ifTrue: [_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex + 4.
									_gsSqueakTemp_srcShift := 24.
									_gsSqueakTemp_dstMask := 16777215]
								ifFalse: [_gsSqueakTemp_srcShift := _gsSqueakTemp_srcShift - 8.
									_gsSqueakTemp_dstMask := _gsSqueakTemp_dstMask >> 8 bitOr: 4278190080]]
						ifFalse: [_gsSqueakTemp_srcShift = 24
								ifTrue: [_gsSqueakTemp_dstIndex := _gsSqueakTemp_dstIndex + 4.
									_gsSqueakTemp_srcShift := 0.
									_gsSqueakTemp_dstMask := 4294967040]
								ifFalse: [_gsSqueakTemp_srcShift := _gsSqueakTemp_srcShift + 8.
									_gsSqueakTemp_dstMask := _gsSqueakTemp_dstMask << 8 bitOr: 255]].
					_gsSqueakTemp_adjust := _gsSqueakTemp_adjust bitXor: 522133279].
			_gsSqueakTemp_srcY := _gsSqueakTemp_srcY + 1.
			_gsSqueakTemp_dstY := _gsSqueakTemp_dstY + 1]