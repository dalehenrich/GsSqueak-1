system simulation
copyBitsFrom: aBitBlt
  "Simulate the copyBits primitive"

  | _gsSqueakTemp_proxy _gsSqueakTemp_bb context |
  _gsSqueakTemp_proxy := InterpreterProxy new.
  context := GsProcess _frameContentsAt: 2.
  _gsSqueakTemp_proxy loadStackFrom: context.	"  _gsSqueakTemp_proxy loadStackFrom: thisContext sender home."
  _gsSqueakTemp_bb := self simulatorClass new.
  _gsSqueakTemp_bb initialiseModule.
  _gsSqueakTemp_bb setInterpreter: _gsSqueakTemp_proxy.
  _gsSqueakTemp_proxy success: (_gsSqueakTemp_bb loadBitBltFrom: aBitBlt).
  _gsSqueakTemp_bb primitiveCopyBits.
  ^ _gsSqueakTemp_proxy stackValue: 0