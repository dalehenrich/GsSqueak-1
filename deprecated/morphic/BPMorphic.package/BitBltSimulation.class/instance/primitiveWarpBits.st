primitives
primitiveWarpBits
	"Invoke the warpBits primitive. If the destination is the display, then
	copy it to the screen."
	| _gsSqueakTemp_rcvr |
	<export: true>
	_gsSqueakTemp_rcvr := interpreterProxy stackValue: interpreterProxy methodArgumentCount.
	(self loadWarpBltFrom: _gsSqueakTemp_rcvr)
		ifFalse: [^ interpreterProxy primitiveFail].
	self warpBits.
	interpreterProxy failed
		ifTrue: [^ nil].
	self showDisplayBits.
	interpreterProxy failed
		ifTrue: [^ nil].
	interpreterProxy pop: interpreterProxy methodArgumentCount