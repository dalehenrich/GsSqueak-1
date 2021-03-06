private
setFillColor: aColor 
	"Install a new color used for filling."
	| _gsSqueakTemp_screen _gsSqueakTemp_patternWord _gsSqueakTemp_fillColor |
	_gsSqueakTemp_fillColor := self shadowColor
				ifNil: [aColor].
	_gsSqueakTemp_fillColor
		ifNil: [_gsSqueakTemp_fillColor := Color transparent].
	_gsSqueakTemp_fillColor isColor
		ifFalse: [(_gsSqueakTemp_fillColor isKindOf: InfiniteForm)
				ifFalse: [^ self error: 'Cannot install color'].
			^ port fillPattern: _gsSqueakTemp_fillColor;
				 combinationRule: Form over].
	"Okay, so fillColor really *is* a color"
	port sourceForm: nil.
	_gsSqueakTemp_fillColor isTranslucent
		ifFalse: [port combinationRule: Form over.
			port fillPattern: _gsSqueakTemp_fillColor.
			self depth = 8
				ifTrue: ["In 8 bit depth it's usually a good idea to use a stipple
					pattern "
					port
						fillColor: (form balancedPatternFor: _gsSqueakTemp_fillColor)].
			^ self].
	"fillColor is some translucent color"
	self depth > 8
		ifTrue: ["BitBlt setup for alpha masked transfer"
			port fillPattern: _gsSqueakTemp_fillColor.
			self depth = 16
				ifTrue: [port alphaBits: _gsSqueakTemp_fillColor privateAlpha;
						 combinationRule: 30]
				ifFalse: [port combinationRule: Form blend].
			^ self].
	"Can't represent actual transparency -- use stipple pattern"
	_gsSqueakTemp_screen := Color translucentMaskFor: _gsSqueakTemp_fillColor alpha depth: self depth.
	_gsSqueakTemp_patternWord := form pixelWordFor: _gsSqueakTemp_fillColor.
	port
		fillPattern: (_gsSqueakTemp_screen
				collect: [:maskWord | maskWord bitAnd: _gsSqueakTemp_patternWord]).
	port combinationRule: Form paint