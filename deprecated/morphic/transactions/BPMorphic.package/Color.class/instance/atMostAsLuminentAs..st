transformations
atMostAsLuminentAs: aFloat 
	| _gsSqueakTemp_revisedColor |
	_gsSqueakTemp_revisedColor := self.
	[_gsSqueakTemp_revisedColor luminance > aFloat]
		whileTrue: [_gsSqueakTemp_revisedColor := _gsSqueakTemp_revisedColor slightlyDarker].
	^ _gsSqueakTemp_revisedColor