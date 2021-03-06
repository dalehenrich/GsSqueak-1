message category list
recategorizeMethodSelector: sel 
	"Categorize method named sel by looking in parent classes for a 
	method category. 
	Answer true if recategorized."
	self selectedClassOrMetaClass allSuperclasses
		do: [:ea | 
			| thisCat |
			thisCat := ea organization categoryOfElement: sel.
			(thisCat ~= ClassOrganizer default
					and: [thisCat notNil])
				ifTrue: [self classOrMetaClassOrganizer classify: sel under: thisCat logged: true.
					self changed: #messageCategoryList.
					^ true]].
	^ false