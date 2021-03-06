inner loop
copyLoopPixMap
	"This version of the inner loop maps source pixels
	to a destination form with different depth. Because it is already
	unweildy, the loop is not unrolled as in the other versions.
	Preload, skew and skewMask are all overlooked, since pickSourcePixels
	delivers its destination word already properly aligned.
	Note that pickSourcePixels could be copied in-line at the top of
	the horizontal loop, and some of its inits moved out of the loop."
	"ar 12/7/1999:
	The loop has been rewritten to use only one pickSourcePixels call.
	The idea is that the call itself could be inlined. If we decide not
	to inline pickSourcePixels we could optimize the loop instead."
	| _gsSqueakTemp_skewWord _gsSqueakTemp_halftoneWord _gsSqueakTemp_mergeWord _gsSqueakTemp_scrStartBits _gsSqueakTemp_nSourceIncs _gsSqueakTemp_startBits _gsSqueakTemp_endBits _gsSqueakTemp_sourcePixMask _gsSqueakTemp_destPixMask _gsSqueakTemp_mergeFnwith _gsSqueakTemp_nPix _gsSqueakTemp_srcShift _gsSqueakTemp_dstShift _gsSqueakTemp_destWord _gsSqueakTemp_words _gsSqueakTemp_srcShiftInc _gsSqueakTemp_dstShiftInc _gsSqueakTemp_dstShiftLeft _gsSqueakTemp_mapperFlags |
	<inline: false>
	<var: #mergeFnwith declareC: 'sqInt (*mergeFnwith)(sqInt, sqInt)'>
	_gsSqueakTemp_mergeFnwith := self
				cCoerce: (opTable at: combinationRule + 1)
				to: 'sqInt (*)(sqInt, sqInt)'.
	_gsSqueakTemp_mergeFnwith.
	"null ref for compiler"
	"Additional inits peculiar to unequal source and dest pix size..."
	sourcePPW := 32 // sourceDepth.
	_gsSqueakTemp_sourcePixMask := maskTable at: sourceDepth.
	_gsSqueakTemp_destPixMask := maskTable at: destDepth.
	_gsSqueakTemp_mapperFlags := cmFlags bitAnd: ColorMapNewStyle bitInvert32.
	sourceIndex := sourceBits + (sy * sourcePitch) + (sx // sourcePPW * 4).
	_gsSqueakTemp_scrStartBits := sourcePPW
				- (sx bitAnd: sourcePPW - 1).
	bbW < _gsSqueakTemp_scrStartBits
		ifTrue: [_gsSqueakTemp_nSourceIncs := 0]
		ifFalse: [_gsSqueakTemp_nSourceIncs := bbW - _gsSqueakTemp_scrStartBits // sourcePPW + 1].
	sourceDelta := sourcePitch - (_gsSqueakTemp_nSourceIncs * 4).
	"Note following two items were already calculated in destmask setup!"
	_gsSqueakTemp_startBits := destPPW
				- (dx bitAnd: destPPW - 1).
	_gsSqueakTemp_endBits := (dx + bbW - 1 bitAnd: destPPW - 1)
				+ 1.
	bbW < _gsSqueakTemp_startBits
		ifTrue: [_gsSqueakTemp_startBits := bbW].
	"Precomputed shifts for pickSourcePixels"
	_gsSqueakTemp_srcShift := (sx bitAnd: sourcePPW - 1)
				* sourceDepth.
	_gsSqueakTemp_dstShift := (dx bitAnd: destPPW - 1)
				* destDepth.
	_gsSqueakTemp_srcShiftInc := sourceDepth.
	_gsSqueakTemp_dstShiftInc := destDepth.
	_gsSqueakTemp_dstShiftLeft := 0.
	sourceMSB
		ifTrue: [_gsSqueakTemp_srcShift := 32 - sourceDepth - _gsSqueakTemp_srcShift.
			_gsSqueakTemp_srcShiftInc := 0 - _gsSqueakTemp_srcShiftInc].
	destMSB
		ifTrue: [_gsSqueakTemp_dstShift := 32 - destDepth - _gsSqueakTemp_dstShift.
			_gsSqueakTemp_dstShiftInc := 0 - _gsSqueakTemp_dstShiftInc.
			_gsSqueakTemp_dstShiftLeft := 32 - destDepth].
	1
		to: bbH
		do: [:i | 
			"here is the vertical loop"
			"*** is it possible at all that noHalftone == false? ***"
			noHalftone
				ifTrue: [_gsSqueakTemp_halftoneWord := AllOnes]
				ifFalse: [_gsSqueakTemp_halftoneWord := self halftoneAt: dy + i - 1].
			"setup first load"
			srcBitShift := _gsSqueakTemp_srcShift.
			dstBitShift := _gsSqueakTemp_dstShift.
			destMask := mask1.
			_gsSqueakTemp_nPix := _gsSqueakTemp_startBits.
			"Here is the horizontal loop..."
			_gsSqueakTemp_words := nWords.
			["pick up the word"
			_gsSqueakTemp_skewWord := self
						pickSourcePixels: _gsSqueakTemp_nPix
						flags: _gsSqueakTemp_mapperFlags
						srcMask: _gsSqueakTemp_sourcePixMask
						destMask: _gsSqueakTemp_destPixMask
						srcShiftInc: _gsSqueakTemp_srcShiftInc
						dstShiftInc: _gsSqueakTemp_dstShiftInc.
			"align next word to leftmost pixel"
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
			sourceIndex := sourceIndex + sourceDelta.
			destIndex := destIndex + destDelta]