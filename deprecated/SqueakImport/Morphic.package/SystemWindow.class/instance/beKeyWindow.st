top window
beKeyWindow
	"Let me be the most important window on the screen. I am at the top and I can have a shadow to get more attention by the user. I am the window that is responsible for window keyboard shortcuts. Also see #isKeyWindow, #activate, and #lookFocused."

	| oldKeyWindow |
	self isKeyWindow ifTrue: [^ self].

	oldKeyWindow := TopWindow.
	TopWindow := self.

	self
		unlockWindowDecorations; "here, because all windows might be active anyway"
		activate; "if not already active, activate now"
		comeToFront. "key windows are on top"

	"Change appearance to get noticed."
	self hasDropShadow: Preferences menuAppearance3d.
	(self valueOfProperty: #borderWidthWhenActive)
		ifNotNil: [:bw | self acquireBorderWidth: bw].

	oldKeyWindow ifNotNil: [:wnd |
		wnd passivateIfNeeded.
		
		"Change appearance to not look prettier than the new key window."
		wnd hasDropShadow: false.
		(wnd valueOfProperty: #borderWidthWhenInactive)
			ifNotNil: [:bw | wnd acquireBorderWidth: bw]].

	"Synchronize focus look with position of current hand because any call could have made this window the new key window."
	self updateFocusLookAtHand.