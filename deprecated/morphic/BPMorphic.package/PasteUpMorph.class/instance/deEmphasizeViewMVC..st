world state
deEmphasizeViewMVC: asTwoTone 
	self flag: #arNote.
	"Probably unnecessary"
	worldState
		handsDo: [:h | "free dependents links if any"
			h releaseKeyboardFocus].
	worldState canvas: nil.
	"free model's canvas to save space"
	self fullReleaseCachedState.
	asTwoTone
		ifTrue: ["draw deEmphasized as a two-tone (monochrome) form"
			self displayWorldAsTwoTone]