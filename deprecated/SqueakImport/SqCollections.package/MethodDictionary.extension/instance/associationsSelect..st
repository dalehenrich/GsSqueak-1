*SqCollections-enumerating
associationsSelect: aBlock 
	"Evaluate aBlock with each of my associations as the argument. Collect
	into a new dictionary, only those associations for which aBlock evaluates
	to true."

	| newCollection |
	newCollection := self copyEmpty.
	self associationsDo: [ :each | 
		(aBlock value: each) ifTrue: [ newCollection add: each ] ].
	^newCollection
