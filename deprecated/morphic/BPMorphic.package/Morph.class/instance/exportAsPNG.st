menus
exportAsPNG
	| fName |
	fName := UIManager default request: 'Please enter the name' translated initialAnswer: self externalName , '.png'.
	fName isEmpty
		ifTrue: [^ self].
	self exportAsPNGNamed: fName