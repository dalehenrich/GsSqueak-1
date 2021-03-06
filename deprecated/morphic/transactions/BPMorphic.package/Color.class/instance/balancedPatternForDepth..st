conversions
balancedPatternForDepth: depth
  "A generalization of bitPatternForDepth: as it exists. Generates a 2x2
	stipple of color.
	The topLeft and bottomRight pixel are closest approx to this color"

  | _gsSqueakTemp_pv1 _gsSqueakTemp_pv2 _gsSqueakTemp_mask1 _gsSqueakTemp_mask2 _gsSqueakTemp_pv3 _gsSqueakTemp_c |
  (depth == self bitPatternCache cachedDepth
    and: [ self bitPatternCache cachedBitPattern size = 2 ])
    ifTrue: [ ^ self bitPatternCache cachedBitPattern ].
  (depth between: 4 and: 16)
    ifFalse: [ ^ self bitPatternForDepth: depth ].
  self bitPatternCache cachedDepth: depth.
  _gsSqueakTemp_pv1 := self pixelValueForDepth: depth.	"
	Subtract error due to pv1 to get pv2.
	pv2 := (self - (err1 := (Color colorFromPixelValue: pv1 depth: depth) -
	self)) pixelValueForDepth: depth.
	Subtract error due to 2 pv1's and pv2 to get pv3.
	pv3 := (self - err1 - err1 - ((Color colorFromPixelValue: pv2 depth:
	depth) - self))
	pixelValueForDepth: depth
	"	"Above two statements computed faster by the following..."
  _gsSqueakTemp_pv2 := (_gsSqueakTemp_c := self
    - ((Color colorFromPixelValue: _gsSqueakTemp_pv1 depth: depth) - self))
    pixelValueForDepth: depth.
  _gsSqueakTemp_pv3 := _gsSqueakTemp_c
    +
      (_gsSqueakTemp_c - (Color colorFromPixelValue: _gsSqueakTemp_pv2 depth: depth))
    pixelValueForDepth: depth.	"Return to a 2-word bitmap that encodes a 2x2 stipple of the given
	pixelValues. "
  _gsSqueakTemp_mask1 := #(#'-' #'-' #'-' 16843009 #'-' #'-' #'-' 65537 #'-' #'-' #'-' #'-' #'-' #'-' #'-' 1)
    at: depth.	"replicates every other 4 bits"	"replicates every other 8 bits"	"replicates every other 16 bits"
  _gsSqueakTemp_mask2 := #(#'-' #'-' #'-' 269488144 #'-' #'-' #'-' 16777472 #'-' #'-' #'-' #'-' #'-' #'-' #'-' 65536)
    at: depth.	"replicates the other 4 bits"	"replicates the other 8 bits"	"replicates the other 16 bits"
  self bitPatternCache
    cachedBitPattern: Bitmap
    with:
      _gsSqueakTemp_mask1 * _gsSqueakTemp_pv1
        + (_gsSqueakTemp_mask2 * _gsSqueakTemp_pv2)
    with:
      _gsSqueakTemp_mask1 * _gsSqueakTemp_pv3
        + (_gsSqueakTemp_mask2 * _gsSqueakTemp_pv1).
  ^ self bitPatternCache cachedBitPattern