private
doScale: evt with: scaleHandle
	"Update the scale of my target if it is scalable."
	| newHandlePos colorToUse |
	evt hand obtainHalo: self.
	newHandlePos := evt cursorPoint - (scaleHandle extent // 2).
	target scaleToMatch: newHandlePos.
	colorToUse := target scale = 1.0
						ifTrue: [Color yellow]
						ifFalse: [Color orange].
	self setColor: colorToUse toHandle: scaleHandle.
	scaleHandle
		submorphsDo: [:m | m color: colorToUse makeForegroundColor].
	scaleHandle position: newHandlePos.
	self layoutChanged.

	(self valueOfProperty: #commandInProgress) ifNotNil:[:cmd |
		"Update the final extent"
		cmd redoTarget: target renderedMorph selector: #setFlexExtentFromHalo: argument: target extent
	].
