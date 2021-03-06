combination rules
pixClear: sourceWord with: destinationWord 
	"Clear all pixels in destinationWord for which the pixels of sourceWord
	have the same values. Used to clear areas of some constant color to
	zero. "
	| _gsSqueakTemp_mask _gsSqueakTemp_result _gsSqueakTemp_nBits _gsSqueakTemp_pv |
	<inline: false>
	destDepth = 32
		ifTrue: [sourceWord = destinationWord
				ifTrue: [^ 0]
				ifFalse: [^ destinationWord]].
	_gsSqueakTemp_nBits := destDepth.
	_gsSqueakTemp_mask := maskTable at: _gsSqueakTemp_nBits.
	"partition mask starts at the right"
	_gsSqueakTemp_result := 0.
	1
		to: destPPW
		do: [:i | 
			_gsSqueakTemp_pv := destinationWord bitAnd: _gsSqueakTemp_mask.
			(sourceWord bitAnd: _gsSqueakTemp_mask)
					= _gsSqueakTemp_pv
				ifTrue: [_gsSqueakTemp_pv := 0].
			_gsSqueakTemp_result := _gsSqueakTemp_result bitOr: _gsSqueakTemp_pv.
			_gsSqueakTemp_mask := _gsSqueakTemp_mask << _gsSqueakTemp_nBits
			"slide left to next partition"].
	^ _gsSqueakTemp_result