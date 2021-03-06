meta-actions
bringAllSiblingsToMe: evt 
	"bring all siblings of the receiver's player found in the same container
	to the receiver's location."
	| aPlayer aPosition aContainer |
	(aPlayer := self topRendererOrSelf player) belongsToUniClass
		ifFalse: [self error: 'not uniclass'].
	aPosition := self topRendererOrSelf position.
	aContainer := self topRendererOrSelf owner.
	(aPlayer class allInstances copyWithout: aPlayer)
		do: [:each | (aContainer submorphs includes: each costume)
				ifTrue: [each costume position: aPosition]]