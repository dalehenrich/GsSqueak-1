events-filtering
removeFilter: anObject from: aFilterGroup 
	"Remove anObject from the given listener group. Return the new
	group. "
	| filters |
	aFilterGroup
		ifNil: [^ nil].
	filters := aFilterGroup.
	filters := filters copyWithout: anObject.
	filters := filters copyWithout: nil.
	"obsolete entries"
	filters isEmpty
		ifTrue: [filters := nil].
	^ filters