private
setHue: hue saturation: saturation brightness: brightness 
	"Initialize this color to the given hue, saturation, and brightness. See
	the comment in the instance creation method for details."
	| _gsSqueakTemp_s _gsSqueakTemp_v _gsSqueakTemp_hf _gsSqueakTemp_i _gsSqueakTemp_f _gsSqueakTemp_p _gsSqueakTemp_q _gsSqueakTemp_t |
	_gsSqueakTemp_s := (saturation asFloat max: 0.0)
				min: 1.0.
	_gsSqueakTemp_v := (brightness asFloat max: 0.0)
				min: 1.0.
	"zero saturation yields gray with the given brightness"
	_gsSqueakTemp_s = 0.0
		ifTrue: [^ self
				setRed: _gsSqueakTemp_v
				green: _gsSqueakTemp_v
				blue: _gsSqueakTemp_v].
	_gsSqueakTemp_hf := hue asFloat.
	(_gsSqueakTemp_hf < 0.0
			or: [_gsSqueakTemp_hf >= 360.0])
		ifTrue: [_gsSqueakTemp_hf := _gsSqueakTemp_hf \\ 360].
	_gsSqueakTemp_hf := _gsSqueakTemp_hf / 60.0.
	_gsSqueakTemp_i := _gsSqueakTemp_hf asInteger.
	"integer part of hue"
	_gsSqueakTemp_f := _gsSqueakTemp_hf fractionPart.
	"fractional part of hue"
	_gsSqueakTemp_p := 1.0 - _gsSqueakTemp_s * _gsSqueakTemp_v.
	_gsSqueakTemp_q := 1.0 - (_gsSqueakTemp_s * _gsSqueakTemp_f) * _gsSqueakTemp_v.
	_gsSqueakTemp_t := 1.0 - (_gsSqueakTemp_s * (1.0 - _gsSqueakTemp_f)) * _gsSqueakTemp_v.
	0 = _gsSqueakTemp_i
		ifTrue: [^ self
				setRed: _gsSqueakTemp_v
				green: _gsSqueakTemp_t
				blue: _gsSqueakTemp_p].
	1 = _gsSqueakTemp_i
		ifTrue: [^ self
				setRed: _gsSqueakTemp_q
				green: _gsSqueakTemp_v
				blue: _gsSqueakTemp_p].
	2 = _gsSqueakTemp_i
		ifTrue: [^ self
				setRed: _gsSqueakTemp_p
				green: _gsSqueakTemp_v
				blue: _gsSqueakTemp_t].
	3 = _gsSqueakTemp_i
		ifTrue: [^ self
				setRed: _gsSqueakTemp_p
				green: _gsSqueakTemp_q
				blue: _gsSqueakTemp_v].
	4 = _gsSqueakTemp_i
		ifTrue: [^ self
				setRed: _gsSqueakTemp_t
				green: _gsSqueakTemp_p
				blue: _gsSqueakTemp_v].
	5 = _gsSqueakTemp_i
		ifTrue: [^ self
				setRed: _gsSqueakTemp_v
				green: _gsSqueakTemp_p
				blue: _gsSqueakTemp_q].
	self error: 'implementation error'