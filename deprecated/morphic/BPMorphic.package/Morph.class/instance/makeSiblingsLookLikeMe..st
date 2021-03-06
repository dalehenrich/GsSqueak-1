meta-actions
makeSiblingsLookLikeMe: evt 
	"Make all my siblings wear the same costume that I am wearing."
	| aPlayer |
	(aPlayer := self topRendererOrSelf player) belongsToUniClass
		ifFalse: [self error: 'not uniclass'].
	aPlayer class
		allInstancesDo: [:anInstance | anInstance == aPlayer
				ifFalse: [anInstance wearCostumeOf: aPlayer]]