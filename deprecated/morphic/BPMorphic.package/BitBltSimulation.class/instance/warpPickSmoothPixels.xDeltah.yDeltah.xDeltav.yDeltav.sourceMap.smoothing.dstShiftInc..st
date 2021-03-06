pixel mapping
warpPickSmoothPixels: nPixels xDeltah: xDeltah yDeltah: yDeltah xDeltav: xDeltav yDeltav: yDeltav sourceMap: sourceMap smoothing: n dstShiftInc: dstShiftInc 
	"Pick n (sub-) pixels from the source form, mapped by sourceMap,
	average the RGB values, map by colorMap and return the new word.
	This version is only called from WarpBlt with smoothingCount > 1"
	| _gsSqueakTemp_rgb _gsSqueakTemp_x _gsSqueakTemp_y _gsSqueakTemp_a _gsSqueakTemp_r _gsSqueakTemp_g _gsSqueakTemp_b _gsSqueakTemp_xx _gsSqueakTemp_yy _gsSqueakTemp_xdh _gsSqueakTemp_ydh _gsSqueakTemp_xdv _gsSqueakTemp_ydv _gsSqueakTemp_dstMask _gsSqueakTemp_destWord _gsSqueakTemp_i _gsSqueakTemp_j _gsSqueakTemp_k _gsSqueakTemp_nPix |
	<inline: false>
	"nope - too much stuff in here"
	_gsSqueakTemp_dstMask := maskTable at: destDepth.
	_gsSqueakTemp_destWord := 0.
	n = 2
		ifTrue: ["Try avoiding divides for most common n (divide by 2 is
			generated as shift)"
			_gsSqueakTemp_xdh := xDeltah // 2.
			_gsSqueakTemp_ydh := yDeltah // 2.
			_gsSqueakTemp_xdv := xDeltav // 2.
			_gsSqueakTemp_ydv := yDeltav // 2]
		ifFalse: [_gsSqueakTemp_xdh := xDeltah // n.
			_gsSqueakTemp_ydh := yDeltah // n.
			_gsSqueakTemp_xdv := xDeltav // n.
			_gsSqueakTemp_ydv := yDeltav // n].
	_gsSqueakTemp_i := nPixels.
	[_gsSqueakTemp_x := sx.
	_gsSqueakTemp_y := sy.
	_gsSqueakTemp_a := _gsSqueakTemp_r := _gsSqueakTemp_g := _gsSqueakTemp_b := 0.
	"Pick and average n*n subpixels"
	_gsSqueakTemp_nPix := 0.
	"actual number of pixels (not clipped and not transparent)"
	_gsSqueakTemp_j := n.
	[_gsSqueakTemp_xx := _gsSqueakTemp_x.
	_gsSqueakTemp_yy := _gsSqueakTemp_y.
	_gsSqueakTemp_k := n.
	["get a single subpixel"
	_gsSqueakTemp_rgb := self pickWarpPixelAtX: _gsSqueakTemp_xx y: _gsSqueakTemp_yy.
	(combinationRule = 25
			and: ["PAINT"
				_gsSqueakTemp_rgb = 0])
		ifFalse: ["If not clipped and not transparent, then tally rgb values"
			_gsSqueakTemp_nPix := _gsSqueakTemp_nPix + 1.
			sourceDepth < 16
				ifTrue: ["Get RGBA values from sourcemap table"
					_gsSqueakTemp_rgb := self long32At: sourceMap + (_gsSqueakTemp_rgb << 2)]
				ifFalse: ["Already in RGB format"
					sourceDepth = 16
						ifTrue: [_gsSqueakTemp_rgb := self rgbMap16To32: _gsSqueakTemp_rgb]
						ifFalse: [_gsSqueakTemp_rgb := self rgbMap32To32: _gsSqueakTemp_rgb]].
			_gsSqueakTemp_b := _gsSqueakTemp_b
						+ (_gsSqueakTemp_rgb bitAnd: 255).
			_gsSqueakTemp_g := _gsSqueakTemp_g
						+ (_gsSqueakTemp_rgb >> 8 bitAnd: 255).
			_gsSqueakTemp_r := _gsSqueakTemp_r
						+ (_gsSqueakTemp_rgb >> 16 bitAnd: 255).
			_gsSqueakTemp_a := _gsSqueakTemp_a + (_gsSqueakTemp_rgb >> 24)].
	_gsSqueakTemp_xx := _gsSqueakTemp_xx + _gsSqueakTemp_xdh.
	_gsSqueakTemp_yy := _gsSqueakTemp_yy + _gsSqueakTemp_ydh.
	(_gsSqueakTemp_k := _gsSqueakTemp_k - 1) = 0] whileFalse.
	_gsSqueakTemp_x := _gsSqueakTemp_x + _gsSqueakTemp_xdv.
	_gsSqueakTemp_y := _gsSqueakTemp_y + _gsSqueakTemp_ydv.
	(_gsSqueakTemp_j := _gsSqueakTemp_j - 1) = 0] whileFalse.
	(_gsSqueakTemp_nPix = 0
			or: [combinationRule = 25
					and: ["PAINT"
						_gsSqueakTemp_nPix < (n * n // 2)]])
		ifTrue: [_gsSqueakTemp_rgb := 0
			"All pixels were 0, or most were transparent"]
		ifFalse: ["normalize rgba sums"
			_gsSqueakTemp_nPix = 4
				ifTrue: ["Try to avoid divides for most common n"
					_gsSqueakTemp_r := _gsSqueakTemp_r >> 2.
					_gsSqueakTemp_g := _gsSqueakTemp_g >> 2.
					_gsSqueakTemp_b := _gsSqueakTemp_b >> 2.
					_gsSqueakTemp_a := _gsSqueakTemp_a >> 2]
				ifFalse: [_gsSqueakTemp_r := _gsSqueakTemp_r // _gsSqueakTemp_nPix.
					_gsSqueakTemp_g := _gsSqueakTemp_g // _gsSqueakTemp_nPix.
					_gsSqueakTemp_b := _gsSqueakTemp_b // _gsSqueakTemp_nPix.
					_gsSqueakTemp_a := _gsSqueakTemp_a // _gsSqueakTemp_nPix].
			_gsSqueakTemp_rgb := _gsSqueakTemp_a << 24 + (_gsSqueakTemp_r << 16) + (_gsSqueakTemp_g << 8) + _gsSqueakTemp_b.
			"map the pixel"
			_gsSqueakTemp_rgb = 0
				ifTrue: ["only generate zero if pixel is really transparent"
					_gsSqueakTemp_r + _gsSqueakTemp_g + _gsSqueakTemp_b + _gsSqueakTemp_a > 0
						ifTrue: [_gsSqueakTemp_rgb := 1]].
			_gsSqueakTemp_rgb := self mapPixel: _gsSqueakTemp_rgb flags: cmFlags].
	"Mix it in"
	_gsSqueakTemp_destWord := _gsSqueakTemp_destWord bitOr: (_gsSqueakTemp_rgb bitAnd: _gsSqueakTemp_dstMask)
					<< dstBitShift.
	dstBitShift := dstBitShift + dstShiftInc.
	sx := sx + xDeltah.
	sy := sy + yDeltah.
	(_gsSqueakTemp_i := _gsSqueakTemp_i - 1) = 0] whileFalse.
	^ _gsSqueakTemp_destWord