class initialization
named: newName put: aColor 
	"Add a new color to the list and create an access message and a class
	variable for it. The name should start with a lowercase letter. (The
	class variable will start with an uppercase letter.) (Color colorNames)
	returns a list of all color names. "
	| _gsSqueakTemp_str _gsSqueakTemp_cap _gsSqueakTemp_sym _gsSqueakTemp_accessor _gsSqueakTemp_csym |
	(aColor isKindOf: self)
		ifFalse: [^ self error: 'not a Color'].
	_gsSqueakTemp_str := newName asString.
	_gsSqueakTemp_sym := _gsSqueakTemp_str asSymbol.
	_gsSqueakTemp_cap := _gsSqueakTemp_str capitalized.
	_gsSqueakTemp_csym := _gsSqueakTemp_cap asSymbol.
	(self class canUnderstand: _gsSqueakTemp_sym)
		ifFalse: ["define access message"
			_gsSqueakTemp_accessor := _gsSqueakTemp_str
						, (String with: Character cr with: Character tab) , '^' , _gsSqueakTemp_cap.
			self class compile: _gsSqueakTemp_accessor classified: 'named colors'].
	(self classPool includesKey: _gsSqueakTemp_csym)
		ifFalse: [self addClassVarName: _gsSqueakTemp_cap].
	ColorNames add: _gsSqueakTemp_sym.
	^ self classPool at: _gsSqueakTemp_csym put: aColor