conversions
asHTMLColor
	| _gsSqueakTemp_s |
	_gsSqueakTemp_s := '#000000' copy.
	_gsSqueakTemp_s
		at: 2
		put: (Character
				digitValue: ((rgb bitShift: -6 - RedShift)
						bitAnd: 15)).
	_gsSqueakTemp_s
		at: 3
		put: (Character
				digitValue: ((rgb bitShift: -2 - RedShift)
						bitAnd: 15)).
	_gsSqueakTemp_s
		at: 4
		put: (Character
				digitValue: ((rgb bitShift: -6 - GreenShift)
						bitAnd: 15)).
	_gsSqueakTemp_s
		at: 5
		put: (Character
				digitValue: ((rgb bitShift: -2 - GreenShift)
						bitAnd: 15)).
	_gsSqueakTemp_s
		at: 6
		put: (Character
				digitValue: ((rgb bitShift: -6 - BlueShift)
						bitAnd: 15)).
	_gsSqueakTemp_s
		at: 7
		put: (Character
				digitValue: ((rgb bitShift: -2 - BlueShift)
						bitAnd: 15)).
	^ _gsSqueakTemp_s