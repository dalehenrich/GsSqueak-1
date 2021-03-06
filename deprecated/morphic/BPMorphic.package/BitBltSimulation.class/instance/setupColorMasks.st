interpreter interface
setupColorMasks
	"WARNING: For WarpBlt w/ smoothing the source depth is wrong
	here! "
	| _gsSqueakTemp_bits _gsSqueakTemp_targetBits |
	_gsSqueakTemp_bits := _gsSqueakTemp_targetBits := 0.
	sourceDepth <= 8
		ifTrue: [^ nil].
	sourceDepth = 16
		ifTrue: [_gsSqueakTemp_bits := 5].
	sourceDepth = 32
		ifTrue: [_gsSqueakTemp_bits := 8].
	cmBitsPerColor = 0
		ifTrue: ["Convert to destDepth"
			destDepth <= 8
				ifTrue: [^ nil].
			destDepth = 16
				ifTrue: [_gsSqueakTemp_targetBits := 5].
			destDepth = 32
				ifTrue: [_gsSqueakTemp_targetBits := 8]]
		ifFalse: [_gsSqueakTemp_targetBits := cmBitsPerColor].
	self setupColorMasksFrom: _gsSqueakTemp_bits to: _gsSqueakTemp_targetBits