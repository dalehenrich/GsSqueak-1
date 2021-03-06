misc
prepareToBeSaved
	"Prepare for export via the ReferenceStream mechanism"
	| exportDict soundKeyList players |
	super prepareToBeSaved.
	turtlePen := nil.
	self isWorldMorph
		ifTrue: [self removeProperty: #scriptsToResume.
			soundKeyList := Set new.
			(players := self presenter allExtantPlayers)
				do: [:aPlayer | aPlayer slotInfo
						associationsDo: [:assoc | assoc value type == #Sound
								ifTrue: [soundKeyList
										add: (aPlayer instVarNamed: assoc key)]]].
			players
				do: [:p | p allScriptEditors
						do: [:e | (e allMorphs
								select: [:m | m isSoundTile])
								do: [:aTile | soundKeyList add: aTile literal]]].
			(self allMorphs
				select: [:m | m isSoundTile])
				do: [:aTile | soundKeyList add: aTile literal].
			soundKeyList removeAllFoundIn: SampledSound universalSoundKeys.
			soundKeyList
				removeAllSuchThat: [:aKey | (SampledSound soundLibrary includesKey: aKey) not].
			soundKeyList isEmpty
				ifFalse: [exportDict := Dictionary new.
					soundKeyList
						do: [:aKey | exportDict
								add: (SampledSound soundLibrary associationAt: aKey)].
					self setProperty: #soundAdditions toValue: exportDict]]