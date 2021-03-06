conversions
scaledPixelValue32
	"Return the alpha scaled pixel value for depth 32"
	| _gsSqueakTemp_pv32 _gsSqueakTemp_a _gsSqueakTemp_b _gsSqueakTemp_g _gsSqueakTemp_r |
	_gsSqueakTemp_pv32 := super scaledPixelValue32.
	_gsSqueakTemp_a := (self alpha * 255.0) rounded.
	_gsSqueakTemp_b := (_gsSqueakTemp_pv32 bitAnd: 255)
				* _gsSqueakTemp_a // 256.
	_gsSqueakTemp_g := ((_gsSqueakTemp_pv32 bitShift: -8)
				bitAnd: 255)
				* _gsSqueakTemp_a // 256.
	_gsSqueakTemp_r := ((_gsSqueakTemp_pv32 bitShift: -16)
				bitAnd: 255)
				* _gsSqueakTemp_a // 256.
	^ _gsSqueakTemp_b
		+ (_gsSqueakTemp_g bitShift: 8)
		+ (_gsSqueakTemp_r bitShift: 16)
		+ (_gsSqueakTemp_a bitShift: 24)