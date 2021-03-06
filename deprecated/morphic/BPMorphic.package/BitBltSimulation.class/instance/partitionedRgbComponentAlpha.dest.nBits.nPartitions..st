combination rules
partitionedRgbComponentAlpha: sourceWord dest: destWord nBits: nBits nPartitions: nParts 
	| _gsSqueakTemp_mask _gsSqueakTemp_result _gsSqueakTemp_p1 _gsSqueakTemp_p2 _gsSqueakTemp_v |
	_gsSqueakTemp_mask := maskTable at: nBits.
	"partition mask starts at the right"
	_gsSqueakTemp_result := 0.
	1
		to: nParts
		do: [:i | 
			_gsSqueakTemp_p1 := (sourceWord bitAnd: _gsSqueakTemp_mask)
						>> (i - 1 * nBits).
			_gsSqueakTemp_p2 := (destWord bitAnd: _gsSqueakTemp_mask)
						>> (i - 1 * nBits).
			nBits = 32
				ifFalse: [nBits = 16
						ifTrue: [_gsSqueakTemp_p1 := (self rgbMap16To32: _gsSqueakTemp_p1)
										bitOr: 4278190080.
							_gsSqueakTemp_p2 := (self rgbMap16To32: _gsSqueakTemp_p2)
										bitOr: 4278190080]
						ifFalse: [_gsSqueakTemp_p1 := (self
										rgbMap: _gsSqueakTemp_p1
										from: nBits
										to: 32)
										bitOr: 4278190080.
							_gsSqueakTemp_p2 := (self
										rgbMap: _gsSqueakTemp_p2
										from: nBits
										to: 32)
										bitOr: 4278190080]].
			_gsSqueakTemp_v := self rgbComponentAlpha32: _gsSqueakTemp_p1 with: _gsSqueakTemp_p2.
			nBits = 32
				ifFalse: [_gsSqueakTemp_v := self
								rgbMap: _gsSqueakTemp_v
								from: 32
								to: nBits].
			_gsSqueakTemp_result := _gsSqueakTemp_result bitOr: _gsSqueakTemp_v << (i - 1 * nBits).
			_gsSqueakTemp_mask := _gsSqueakTemp_mask << nBits
			"slide left to next partition"].
	^ _gsSqueakTemp_result