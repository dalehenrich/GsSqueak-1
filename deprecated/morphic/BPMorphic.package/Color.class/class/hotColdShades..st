examples
hotColdShades: thisMany 
	"An array of thisMany colors showing temperature from blue to red to
	white hot. (Later improve this by swinging in hue.) "
	"Color showColors: (Color hotColdShades: 25)"
	| _gsSqueakTemp_n _gsSqueakTemp_s1 _gsSqueakTemp_s2 _gsSqueakTemp_s3 _gsSqueakTemp_s4 _gsSqueakTemp_s5 |
	thisMany < 5
		ifTrue: [^ self error: 'must be at least 5 shades'].
	_gsSqueakTemp_n := thisMany // 5.
	_gsSqueakTemp_s1 := self white mix: self yellow shades: thisMany - (_gsSqueakTemp_n * 4).
	_gsSqueakTemp_s2 := self yellow mix: self red shades: _gsSqueakTemp_n + 1.
	_gsSqueakTemp_s2 := _gsSqueakTemp_s2 copyFrom: 2 to: _gsSqueakTemp_n + 1.
	_gsSqueakTemp_s3 := self red mix: self green darker shades: _gsSqueakTemp_n + 1.
	_gsSqueakTemp_s3 := _gsSqueakTemp_s3 copyFrom: 2 to: _gsSqueakTemp_n + 1.
	_gsSqueakTemp_s4 := self green darker mix: self blue shades: _gsSqueakTemp_n + 1.
	_gsSqueakTemp_s4 := _gsSqueakTemp_s4 copyFrom: 2 to: _gsSqueakTemp_n + 1.
	_gsSqueakTemp_s5 := self blue mix: self black shades: _gsSqueakTemp_n + 1.
	_gsSqueakTemp_s5 := _gsSqueakTemp_s5 copyFrom: 2 to: _gsSqueakTemp_n + 1.
	^ _gsSqueakTemp_s1 , _gsSqueakTemp_s2 , _gsSqueakTemp_s3 , _gsSqueakTemp_s4 , _gsSqueakTemp_s5