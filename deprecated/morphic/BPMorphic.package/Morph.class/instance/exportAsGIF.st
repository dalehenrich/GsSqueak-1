menus
exportAsGIF
	| fName |
	fName := UIManager default request: 'Please enter the name' translated initialAnswer: self externalName , '.gif'.
	fName isEmpty
		ifTrue: [^ self].
	self exportAsGIFNamed: fName