menus
exportAsJPEG
	| fName |
	fName := UIManager default request: 'Please enter the name' translated initialAnswer: self externalName , '.jpeg'.
	fName isEmpty
		ifTrue: [^ self].
	self exportAsJPEGNamed: fName