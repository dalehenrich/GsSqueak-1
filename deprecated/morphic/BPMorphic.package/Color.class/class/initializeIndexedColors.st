class initialization
initializeIndexedColors
	"Build an array of colors corresponding to the fixed colormap used
	for display depths of 1, 2, 4, or 8 bits."
	"Color initializeIndexedColors"
	| _gsSqueakTemp_a _gsSqueakTemp_index _gsSqueakTemp_grayVal |
	_gsSqueakTemp_a := Array new: 256.
	"1-bit colors (monochrome)"
	_gsSqueakTemp_a
		at: 1
		put: (Color
				r: 1.0
				g: 1.0
				b: 1.0).
	"white or transparent"
	_gsSqueakTemp_a
		at: 2
		put: (Color
				r: 0.0
				g: 0.0
				b: 0.0).
	"black"
	"additional colors for 2-bit color"
	_gsSqueakTemp_a
		at: 3
		put: (Color
				r: 1.0
				g: 1.0
				b: 1.0).
	"opaque white"
	_gsSqueakTemp_a
		at: 4
		put: (Color
				r: 0.5
				g: 0.5
				b: 0.5).
	"1/2 gray"
	"additional colors for 4-bit color"
	_gsSqueakTemp_a
		at: 5
		put: (Color
				r: 1.0
				g: 0.0
				b: 0.0).
	"red"
	_gsSqueakTemp_a
		at: 6
		put: (Color
				r: 0.0
				g: 1.0
				b: 0.0).
	"green"
	_gsSqueakTemp_a
		at: 7
		put: (Color
				r: 0.0
				g: 0.0
				b: 1.0).
	"blue"
	_gsSqueakTemp_a
		at: 8
		put: (Color
				r: 0.0
				g: 1.0
				b: 1.0).
	"cyan"
	_gsSqueakTemp_a
		at: 9
		put: (Color
				r: 1.0
				g: 1.0
				b: 0.0).
	"yellow"
	_gsSqueakTemp_a
		at: 10
		put: (Color
				r: 1.0
				g: 0.0
				b: 1.0).
	"magenta"
	_gsSqueakTemp_a
		at: 11
		put: (Color
				r: 0.125
				g: 0.125
				b: 0.125).
	"1/8 gray"
	_gsSqueakTemp_a
		at: 12
		put: (Color
				r: 0.25
				g: 0.25
				b: 0.25).
	"2/8 gray"
	_gsSqueakTemp_a
		at: 13
		put: (Color
				r: 0.375
				g: 0.375
				b: 0.375).
	"3/8 gray"
	_gsSqueakTemp_a
		at: 14
		put: (Color
				r: 0.625
				g: 0.625
				b: 0.625).
	"5/8 gray"
	_gsSqueakTemp_a
		at: 15
		put: (Color
				r: 0.75
				g: 0.75
				b: 0.75).
	"6/8 gray"
	_gsSqueakTemp_a
		at: 16
		put: (Color
				r: 0.875
				g: 0.875
				b: 0.875).
	"7/8 gray"
	"additional colors for 8-bit color"
	"24 more shades of gray (1/32 increments but not repeating 1/8
	increments) "
	_gsSqueakTemp_index := 17.
	1
		to: 31
		do: [:v | v \\ 4 = 0
				ifFalse: [_gsSqueakTemp_grayVal := v / 32.0.
					_gsSqueakTemp_a
						at: _gsSqueakTemp_index
						put: (Color
								r: _gsSqueakTemp_grayVal
								g: _gsSqueakTemp_grayVal
								b: _gsSqueakTemp_grayVal).
					_gsSqueakTemp_index := _gsSqueakTemp_index + 1]].
	"The remainder of color table defines a color cube with six steps
	for each primary color. Note that the corners of this cube repeat
	previous colors, but this simplifies the mapping between RGB colors
	and color map indices. This color cube spans indices 40 through 255
	(indices 41-256 in this 1-based array)."
	0
		to: 5
		do: [:r | 0
				to: 5
				do: [:g | 0
						to: 5
						do: [:b | 
							_gsSqueakTemp_index := 41 + (36 * r + (6 * b) + g).
							_gsSqueakTemp_index > 256
								ifTrue: [self error: 'index out of range in color table compuation'].
							_gsSqueakTemp_a
								at: _gsSqueakTemp_index
								put: (Color
										r: r
										g: g
										b: b
										range: 5)]]].
	IndexedColors := _gsSqueakTemp_a