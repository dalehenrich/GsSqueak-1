new-morph participation
partName: aName categories: aList documentation: aDoc sampleImageForm: aForm
	"Answer a DescriptionForPartsBin which will represent a launch of a new instance of my class via the #newStandAlone protocol sent to my class. Use the category-list and documentation provided.  This variant allows an overriding image form to be provided, useful in cases where we don't want to launch a sample instance just to get the form"

	| descr |
	descr := DescriptionForPartsBin new
		formalName: aName
		categoryList: aList
		documentation: aDoc
		globalReceiverSymbol: self name
		nativitySelector: #newStandAlone.
	descr sampleImageForm: aForm.
	^ descr
