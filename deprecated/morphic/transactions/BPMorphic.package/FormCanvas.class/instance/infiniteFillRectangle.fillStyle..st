private
infiniteFillRectangle: aRectangle fillStyle: aFillStyle 
	"this is a bit of a kludge to get the form to be aligned where I *think* it
	should be.
	something better is needed, but not now"
	| _gsSqueakTemp_additionalOffset _gsSqueakTemp_rInPortTerms _gsSqueakTemp_clippedPort _gsSqueakTemp_targetTopLeft _gsSqueakTemp_clipOffset _gsSqueakTemp_ex |
	_gsSqueakTemp_additionalOffset := 0 @ 0.
	_gsSqueakTemp_ex := aFillStyle form extent.
	_gsSqueakTemp_rInPortTerms := aRectangle translateBy: origin.
	_gsSqueakTemp_clippedPort := port clippedBy: _gsSqueakTemp_rInPortTerms.
	_gsSqueakTemp_targetTopLeft := _gsSqueakTemp_clippedPort clipRect topLeft truncateTo: _gsSqueakTemp_ex.
	_gsSqueakTemp_clipOffset := _gsSqueakTemp_rInPortTerms topLeft - _gsSqueakTemp_targetTopLeft.
	_gsSqueakTemp_additionalOffset := _gsSqueakTemp_clipOffset \\ _gsSqueakTemp_ex - _gsSqueakTemp_ex.
	^ aFillStyle displayOnPort: _gsSqueakTemp_clippedPort offsetBy: _gsSqueakTemp_additionalOffset