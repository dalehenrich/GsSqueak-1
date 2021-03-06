combination rules
OLDrgbDiff: sourceWord with: destinationWord 
	"Subract the pixels in the source and destination, color by color,
	and return the sum of the absolute value of all the differences.
	For non-rgb, XOR the two and return the number of differing pixels.
	Note that the region is not clipped to bit boundaries, but only to the
	nearest (enclosing) word. This is because copyLoop does not do
	pre-merge masking. For accurate results, you must subtract the
	values obtained from the left and right fringes."
	| _gsSqueakTemp_diff _gsSqueakTemp_pixMask |
	<inline: false>
	destDepth < 16
		ifTrue: ["Just xor and count differing bits if not RGB"
			_gsSqueakTemp_diff := sourceWord bitXor: destinationWord.
			_gsSqueakTemp_pixMask := maskTable at: destDepth.
			[_gsSqueakTemp_diff = 0]
				whileFalse: [(_gsSqueakTemp_diff bitAnd: _gsSqueakTemp_pixMask)
							~= 0
						ifTrue: [bitCount := bitCount + 1].
					_gsSqueakTemp_diff := _gsSqueakTemp_diff >> destDepth].
			^ destinationWord"For no effect on dest"].
	destDepth = 16
		ifTrue: [_gsSqueakTemp_diff := self
						partitionedSub: sourceWord
						from: destinationWord
						nBits: 5
						nPartitions: 3.
			bitCount := bitCount
						+ (_gsSqueakTemp_diff bitAnd: 31)
						+ (_gsSqueakTemp_diff >> 5 bitAnd: 31)
						+ (_gsSqueakTemp_diff >> 10 bitAnd: 31).
			_gsSqueakTemp_diff := self
						partitionedSub: sourceWord >> 16
						from: destinationWord >> 16
						nBits: 5
						nPartitions: 3.
			bitCount := bitCount
						+ (_gsSqueakTemp_diff bitAnd: 31)
						+ (_gsSqueakTemp_diff >> 5 bitAnd: 31)
						+ (_gsSqueakTemp_diff >> 10 bitAnd: 31)]
		ifFalse: [_gsSqueakTemp_diff := self
						partitionedSub: sourceWord
						from: destinationWord
						nBits: 8
						nPartitions: 3.
			bitCount := bitCount
						+ (_gsSqueakTemp_diff bitAnd: 255)
						+ (_gsSqueakTemp_diff >> 8 bitAnd: 255)
						+ (_gsSqueakTemp_diff >> 16 bitAnd: 255)].
	^ destinationWord"For no effect on dest"