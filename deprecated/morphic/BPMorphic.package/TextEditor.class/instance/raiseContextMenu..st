nonediting/nontyping keys
raiseContextMenu: aKeyboardEvent 
	(morph respondsTo: #editView)
		ifTrue: [morph editView yellowButtonActivity: false].
	^ true