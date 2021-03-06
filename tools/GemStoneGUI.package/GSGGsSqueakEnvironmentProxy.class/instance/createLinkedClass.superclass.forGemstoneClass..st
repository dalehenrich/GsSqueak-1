interface 2
createLinkedClass: linkedClassName superclass: superclassName forGemstoneClass: aGsClass
	
	| query superclassSetter |
	superclassSetter := superclassName 
							ifNil: ['']
							ifNotNil: [
								'| environment makeSuperclassesSpecial |
								environment := {1}.
								{2} superclassForEnv: {3} put: (environment classNamed: {4}).
								{2} class superclassForEnv: {3} put: (environment classNamed: {4}) class.
								Behavior _clearLookupCaches: 0.
								Behavior _clearLookupCaches: {3}.'
									format: {
										self codeReferencingMe.
										aGsClass.
										self environmentId.
										superclassName storeString}].
	query := '
	{1} at: {2} put: ({3}).
	[{4}] value.
	{3}
	' format: {
		self codeReferencingMe.
		linkedClassName asSymbol storeString.
		aGsClass.
		superclassSetter
	}.
	^ self fetchClass: query.