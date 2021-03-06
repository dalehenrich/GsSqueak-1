inner loop
warpLoop
	"This version of the inner loop traverses an arbirary quadrilateral
	source, thus producing a general affine transformation."
	| _gsSqueakTemp_skewWord _gsSqueakTemp_halftoneWord _gsSqueakTemp_mergeWord _gsSqueakTemp_startBits _gsSqueakTemp_deltaP12x _gsSqueakTemp_deltaP12y _gsSqueakTemp_deltaP43x _gsSqueakTemp_deltaP43y _gsSqueakTemp_pAx _gsSqueakTemp_pAy _gsSqueakTemp_pBx _gsSqueakTemp_pBy _gsSqueakTemp_xDelta _gsSqueakTemp_yDelta _gsSqueakTemp_smoothingCount _gsSqueakTemp_sourceMapOop _gsSqueakTemp_nSteps _gsSqueakTemp_nPix _gsSqueakTemp_words _gsSqueakTemp_destWord _gsSqueakTemp_endBits _gsSqueakTemp_mergeFnwith _gsSqueakTemp_dstShiftInc _gsSqueakTemp_dstShiftLeft _gsSqueakTemp_mapperFlags |
	<inline: false>
	<var: #mergeFnwith declareC: 'sqInt (*mergeFnwith)(sqInt, sqInt)'>
	_gsSqueakTemp_mergeFnwith := self
				cCoerce: (opTable at: combinationRule + 1)
				to: 'sqInt (*)(sqInt, sqInt)'.
	_gsSqueakTemp_mergeFnwith.
	"null ref for compiler"
	(interpreterProxy slotSizeOf: bitBltOop)
			>= (BBWarpBase + 12)
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_nSteps := height - 1.
	_gsSqueakTemp_nSteps <= 0
		ifTrue: [_gsSqueakTemp_nSteps := 1].
	_gsSqueakTemp_pAx := self fetchIntOrFloat: BBWarpBase ofObject: bitBltOop.
	_gsSqueakTemp_words := self fetchIntOrFloat: BBWarpBase + 3 ofObject: bitBltOop.
	_gsSqueakTemp_deltaP12x := self
				deltaFrom: _gsSqueakTemp_pAx
				to: _gsSqueakTemp_words
				nSteps: _gsSqueakTemp_nSteps.
	_gsSqueakTemp_deltaP12x < 0
		ifTrue: [_gsSqueakTemp_pAx := _gsSqueakTemp_words - (_gsSqueakTemp_nSteps * _gsSqueakTemp_deltaP12x)].
	_gsSqueakTemp_pAy := self fetchIntOrFloat: BBWarpBase + 1 ofObject: bitBltOop.
	_gsSqueakTemp_words := self fetchIntOrFloat: BBWarpBase + 4 ofObject: bitBltOop.
	_gsSqueakTemp_deltaP12y := self
				deltaFrom: _gsSqueakTemp_pAy
				to: _gsSqueakTemp_words
				nSteps: _gsSqueakTemp_nSteps.
	_gsSqueakTemp_deltaP12y < 0
		ifTrue: [_gsSqueakTemp_pAy := _gsSqueakTemp_words - (_gsSqueakTemp_nSteps * _gsSqueakTemp_deltaP12y)].
	_gsSqueakTemp_pBx := self fetchIntOrFloat: BBWarpBase + 9 ofObject: bitBltOop.
	_gsSqueakTemp_words := self fetchIntOrFloat: BBWarpBase + 6 ofObject: bitBltOop.
	_gsSqueakTemp_deltaP43x := self
				deltaFrom: _gsSqueakTemp_pBx
				to: _gsSqueakTemp_words
				nSteps: _gsSqueakTemp_nSteps.
	_gsSqueakTemp_deltaP43x < 0
		ifTrue: [_gsSqueakTemp_pBx := _gsSqueakTemp_words - (_gsSqueakTemp_nSteps * _gsSqueakTemp_deltaP43x)].
	_gsSqueakTemp_pBy := self fetchIntOrFloat: BBWarpBase + 10 ofObject: bitBltOop.
	_gsSqueakTemp_words := self fetchIntOrFloat: BBWarpBase + 7 ofObject: bitBltOop.
	_gsSqueakTemp_deltaP43y := self
				deltaFrom: _gsSqueakTemp_pBy
				to: _gsSqueakTemp_words
				nSteps: _gsSqueakTemp_nSteps.
	_gsSqueakTemp_deltaP43y < 0
		ifTrue: [_gsSqueakTemp_pBy := _gsSqueakTemp_words - (_gsSqueakTemp_nSteps * _gsSqueakTemp_deltaP43y)].
	interpreterProxy failed
		ifTrue: [^ false].
	"ie if non-integers above"
	interpreterProxy methodArgumentCount = 2
		ifTrue: [_gsSqueakTemp_smoothingCount := interpreterProxy stackIntegerValue: 1.
			_gsSqueakTemp_sourceMapOop := interpreterProxy stackValue: 0.
			_gsSqueakTemp_sourceMapOop = interpreterProxy nilObject
				ifTrue: [sourceDepth < 16
						ifTrue: ["color map is required to smooth non-RGB dest"
							^ interpreterProxy primitiveFail]]
				ifFalse: [(interpreterProxy slotSizeOf: _gsSqueakTemp_sourceMapOop)
							< (1 << sourceDepth)
						ifTrue: ["sourceMap must be long enough for
							sourceDepth "
							^ interpreterProxy primitiveFail].
					_gsSqueakTemp_sourceMapOop := self
								oopForPointer: (interpreterProxy firstIndexableField: _gsSqueakTemp_sourceMapOop)]]
		ifFalse: [_gsSqueakTemp_smoothingCount := 1.
			_gsSqueakTemp_sourceMapOop := interpreterProxy nilObject].
	_gsSqueakTemp_nSteps := width - 1.
	_gsSqueakTemp_nSteps <= 0
		ifTrue: [_gsSqueakTemp_nSteps := 1].
	_gsSqueakTemp_startBits := destPPW
				- (dx bitAnd: destPPW - 1).
	_gsSqueakTemp_endBits := (dx + bbW - 1 bitAnd: destPPW - 1)
				+ 1.
	bbW < _gsSqueakTemp_startBits
		ifTrue: [_gsSqueakTemp_startBits := bbW].
	destY < clipY
		ifTrue: ["Advance increments if there was clipping in y"
			_gsSqueakTemp_pAx := _gsSqueakTemp_pAx + (clipY - destY * _gsSqueakTemp_deltaP12x).
			_gsSqueakTemp_pAy := _gsSqueakTemp_pAy + (clipY - destY * _gsSqueakTemp_deltaP12y).
			_gsSqueakTemp_pBx := _gsSqueakTemp_pBx + (clipY - destY * _gsSqueakTemp_deltaP43x).
			_gsSqueakTemp_pBy := _gsSqueakTemp_pBy + (clipY - destY * _gsSqueakTemp_deltaP43y)].
	"Setup values for faster pixel fetching."
	self warpLoopSetup.
	"Setup color mapping if not provided"
	(_gsSqueakTemp_smoothingCount > 1
			and: [(cmFlags bitAnd: ColorMapNewStyle)
					= 0])
		ifTrue: [cmLookupTable == nil
				ifTrue: [destDepth = 16
						ifTrue: [self setupColorMasksFrom: 8 to: 5]]
				ifFalse: [self setupColorMasksFrom: 8 to: cmBitsPerColor]].
	_gsSqueakTemp_mapperFlags := cmFlags bitAnd: ColorMapNewStyle bitInvert32.
	destMSB
		ifTrue: [_gsSqueakTemp_dstShiftInc := 0 - destDepth.
			_gsSqueakTemp_dstShiftLeft := 32 - destDepth]
		ifFalse: [_gsSqueakTemp_dstShiftInc := destDepth.
			_gsSqueakTemp_dstShiftLeft := 0].
	1
		to: bbH
		do: [:i | 
			"here is the vertical loop..."
			_gsSqueakTemp_xDelta := self
						deltaFrom: _gsSqueakTemp_pAx
						to: _gsSqueakTemp_pBx
						nSteps: _gsSqueakTemp_nSteps.
			_gsSqueakTemp_xDelta >= 0
				ifTrue: [sx := _gsSqueakTemp_pAx]
				ifFalse: [sx := _gsSqueakTemp_pBx - (_gsSqueakTemp_nSteps * _gsSqueakTemp_xDelta)].
			_gsSqueakTemp_yDelta := self
						deltaFrom: _gsSqueakTemp_pAy
						to: _gsSqueakTemp_pBy
						nSteps: _gsSqueakTemp_nSteps.
			_gsSqueakTemp_yDelta >= 0
				ifTrue: [sy := _gsSqueakTemp_pAy]
				ifFalse: [sy := _gsSqueakTemp_pBy - (_gsSqueakTemp_nSteps * _gsSqueakTemp_yDelta)].
			destMSB
				ifTrue: [dstBitShift := 32 - ((dx bitAnd: destPPW - 1)
									+ 1 * destDepth)]
				ifFalse: [dstBitShift := (dx bitAnd: destPPW - 1)
								* destDepth].
			destX < clipX
				ifTrue: ["Advance increments if there was clipping in x"
					sx := sx + (clipX - destX * _gsSqueakTemp_xDelta).
					sy := sy + (clipX - destX * _gsSqueakTemp_yDelta)].
			noHalftone
				ifTrue: [_gsSqueakTemp_halftoneWord := AllOnes]
				ifFalse: [_gsSqueakTemp_halftoneWord := self halftoneAt: dy + i - 1].
			destMask := mask1.
			_gsSqueakTemp_nPix := _gsSqueakTemp_startBits.
			"Here is the inner loop..."
			_gsSqueakTemp_words := nWords.
			["pick up word"
			_gsSqueakTemp_smoothingCount = 1
				ifTrue: ["Faster if not smoothing"
					_gsSqueakTemp_skewWord := self
								warpPickSourcePixels: _gsSqueakTemp_nPix
								xDeltah: _gsSqueakTemp_xDelta
								yDeltah: _gsSqueakTemp_yDelta
								xDeltav: _gsSqueakTemp_deltaP12x
								yDeltav: _gsSqueakTemp_deltaP12y
								dstShiftInc: _gsSqueakTemp_dstShiftInc
								flags: _gsSqueakTemp_mapperFlags]
				ifFalse: ["more difficult with smoothing"
					_gsSqueakTemp_skewWord := self
								warpPickSmoothPixels: _gsSqueakTemp_nPix
								xDeltah: _gsSqueakTemp_xDelta
								yDeltah: _gsSqueakTemp_yDelta
								xDeltav: _gsSqueakTemp_deltaP12x
								yDeltav: _gsSqueakTemp_deltaP12y
								sourceMap: _gsSqueakTemp_sourceMapOop
								smoothing: _gsSqueakTemp_smoothingCount
								dstShiftInc: _gsSqueakTemp_dstShiftInc].
			"align next word access to left most pixel"
			dstBitShift := _gsSqueakTemp_dstShiftLeft.
			destMask = AllOnes
				ifTrue: ["avoid read-modify-write"
					_gsSqueakTemp_mergeWord := self
								mergeFn: (_gsSqueakTemp_skewWord bitAnd: _gsSqueakTemp_halftoneWord)
								with: (self dstLongAt: destIndex).
					self
						dstLongAt: destIndex
						put: (destMask bitAnd: _gsSqueakTemp_mergeWord)]
				ifFalse: ["General version using dest masking"
					_gsSqueakTemp_destWord := self dstLongAt: destIndex.
					_gsSqueakTemp_mergeWord := self
								mergeFn: (_gsSqueakTemp_skewWord bitAnd: _gsSqueakTemp_halftoneWord)
								with: (_gsSqueakTemp_destWord bitAnd: destMask).
					_gsSqueakTemp_destWord := (destMask bitAnd: _gsSqueakTemp_mergeWord)
								bitOr: (_gsSqueakTemp_destWord bitAnd: destMask bitInvert32).
					self dstLongAt: destIndex put: _gsSqueakTemp_destWord].
			destIndex := destIndex + 4.
			_gsSqueakTemp_words = 2
				ifTrue: ["e.g., is the next word the last word?"
					"set mask for last word in this row"
					destMask := mask2.
					_gsSqueakTemp_nPix := _gsSqueakTemp_endBits]
				ifFalse: ["use fullword mask for inner loop"
					destMask := AllOnes.
					_gsSqueakTemp_nPix := destPPW].
			(_gsSqueakTemp_words := _gsSqueakTemp_words - 1) = 0] whileFalse.
			"--- end of inner loop ---"
			_gsSqueakTemp_pAx := _gsSqueakTemp_pAx + _gsSqueakTemp_deltaP12x.
			_gsSqueakTemp_pAy := _gsSqueakTemp_pAy + _gsSqueakTemp_deltaP12y.
			_gsSqueakTemp_pBx := _gsSqueakTemp_pBx + _gsSqueakTemp_deltaP43x.
			_gsSqueakTemp_pBy := _gsSqueakTemp_pBy + _gsSqueakTemp_deltaP43y.
			destIndex := destIndex + destDelta]