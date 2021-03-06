world state
addMorphsAndModel: aMorphOrList 
	"Dump in submorphs, model, and stepList from aMorphOrList. Used to
	bring a world, paste-up, or other morph in from an object file."
	aMorphOrList isMorph
		ifTrue: [aMorphOrList isWorldMorph
				ifTrue: [model isNil
						ifTrue: [self setModel: aMorphOrList modelOrNil]
						ifFalse: [aMorphOrList modelOrNil
								ifNotNil: [aMorphOrList modelOrNil privateOwner: nil.
									self addMorph: aMorphOrList modelOrNil]].
					aMorphOrList privateSubmorphs
						reverseDo: [:m | 
							m privateOwner: nil.
							self addMorph: m.
							m changed].
					(aMorphOrList instVarNamed: 'stepList')
						do: [:entry | entry first startSteppingIn: self]]
				ifFalse: ["one morph, put on hand"
					"aMorphOrList installModelIn: self. a chance to install
					model pointers"
					aMorphOrList privateOwner: nil.
					self firstHand attachMorph: aMorphOrList.
					self startSteppingSubmorphsOf: aMorphOrList]]
		ifFalse: ["list, add them all"
			aMorphOrList
				reverseDo: [:m | 
					m privateOwner: nil.
					self addMorph: m.
					self startSteppingSubmorphsOf: m.
					"It may not want this!"
					m changed]]