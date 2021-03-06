private
setPaintColor: aColor 
	"Install a new color used for filling."
	| _gsSqueakTemp_paintColor _gsSqueakTemp_screen _gsSqueakTemp_patternWord |
	_gsSqueakTemp_paintColor := self shadowColor
				ifNil: [aColor].
	_gsSqueakTemp_paintColor
		ifNil: [_gsSqueakTemp_paintColor := Color transparent].
	_gsSqueakTemp_paintColor isColor
		ifFalse: [(_gsSqueakTemp_paintColor isKindOf: InfiniteForm)
				ifFalse: [^ self error: 'Cannot install color'].
			^ port fillPattern: _gsSqueakTemp_paintColor;
				 combinationRule: Form paint].
	"Okay, so paintColor really *is* a color"
	port sourceForm: nil.
	_gsSqueakTemp_paintColor isTranslucent
		ifFalse: [port fillPattern: _gsSqueakTemp_paintColor.
			port combinationRule: Form paint.
			self depth = 8
				ifTrue: [port
						fillColor: (form balancedPatternFor: _gsSqueakTemp_paintColor)].
			^ self].
	"paintColor is translucent color"
	self depth > 8
		ifTrue: ["BitBlt setup for alpha mapped transfer"
			port fillPattern: _gsSqueakTemp_paintColor.
			self depth = 16
				ifTrue: [port alphaBits: _gsSqueakTemp_paintColor privateAlpha;
						 combinationRule: 31]
				ifFalse: [port combinationRule: Form blend].
			^ self].
	"Can't represent actual transparency -- use stipple pattern"
	_gsSqueakTemp_screen := Color translucentMaskFor: _gsSqueakTemp_paintColor alpha depth: self depth.
	_gsSqueakTemp_patternWord := form pixelWordFor: _gsSqueakTemp_paintColor.
	port
		fillPattern: (_gsSqueakTemp_screen
				collect: [:maskWord | maskWord bitAnd: _gsSqueakTemp_patternWord]).
	port combinationRule: Form paint