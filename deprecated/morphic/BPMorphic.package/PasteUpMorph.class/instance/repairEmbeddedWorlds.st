world state
repairEmbeddedWorlds
	| toDoList |
	toDoList := OrderedCollection new.
	self
		allMorphsDo: [:each | | transform eWorld | (each isKindOf: EmbeddedWorldBorderMorph)
				ifTrue: [transform := each submorphs
								at: 1
								ifAbsent: [].
					transform
						ifNotNil: [eWorld := transform submorphs
										at: 1
										ifAbsent: [].
							eWorld
								ifNotNil: [toDoList add: {transform. eWorld}]]]].
	toDoList
		do: [:each | each first addMorph: each second]