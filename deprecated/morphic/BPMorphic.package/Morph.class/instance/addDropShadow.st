drop shadows
addDropShadow
	self hasDropShadow: true;
		
		shadowOffset: (self useSoftDropShadow
				ifTrue: [self userInterfaceTheme softShadowOffset
						ifNil: [10 @ 8 corner: 10 @ 12]]
				ifFalse: [self userInterfaceTheme hardShadowOffset
						ifNil: [1 @ 1]]);
		
		shadowColor: (self useSoftDropShadow
				ifTrue: [self userInterfaceTheme softShadowColor
						ifNil: [Color black alpha: 0.01]]
				ifFalse: [self userInterfaceTheme hardShadowColor
						ifNil: [Color black alpha: 0.5]])