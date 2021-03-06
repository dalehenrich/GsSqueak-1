examples
colorRampForDepth: depth extent: aPoint 
	"Returns a form of the given size showing R, G, B, and gray ramps for
	the given depth. Useful for testing color conversions between
	different depths."
	"(Color colorRampForDepth: Display depth extent: 256@80) display"
	"(Color colorRampForDepth: 32 extent: 256@80) displayOn: Display at:
	0@0 rule: Form paint"
	| _gsSqueakTemp_f _gsSqueakTemp_dx _gsSqueakTemp_dy _gsSqueakTemp_r |
	_gsSqueakTemp_f := Form extent: aPoint depth: depth.
	_gsSqueakTemp_dx := aPoint x // 256.
	_gsSqueakTemp_dy := aPoint y // 4.
	0
		to: 255
		do: [:i | 
			_gsSqueakTemp_r := _gsSqueakTemp_dx * i @ 0 extent: _gsSqueakTemp_dx @ _gsSqueakTemp_dy.
			_gsSqueakTemp_f
				fill: _gsSqueakTemp_r
				fillColor: (Color
						r: i
						g: 0
						b: 0
						range: 255).
			_gsSqueakTemp_r := _gsSqueakTemp_r translateBy: 0 @ _gsSqueakTemp_dy.
			_gsSqueakTemp_f
				fill: _gsSqueakTemp_r
				fillColor: (Color
						r: 0
						g: i
						b: 0
						range: 255).
			_gsSqueakTemp_r := _gsSqueakTemp_r translateBy: 0 @ _gsSqueakTemp_dy.
			_gsSqueakTemp_f
				fill: _gsSqueakTemp_r
				fillColor: (Color
						r: 0
						g: 0
						b: i
						range: 255).
			_gsSqueakTemp_r := _gsSqueakTemp_r translateBy: 0 @ _gsSqueakTemp_dy.
			_gsSqueakTemp_f
				fill: _gsSqueakTemp_r
				fillColor: (Color
						r: i
						g: i
						b: i
						range: 255)].
	^ _gsSqueakTemp_f