naming
updateAllScriptingElements
	"A sledge-hammer sweep from the world down to make sure that all
	live scripting elements are up to date. Presently in eclipse, not sent at
	the moment."
	self topPasteUp
		ifNotNil: [:aPasteUp | aPasteUp allTileScriptingElements
				do: [:m | m bringUpToDate]]