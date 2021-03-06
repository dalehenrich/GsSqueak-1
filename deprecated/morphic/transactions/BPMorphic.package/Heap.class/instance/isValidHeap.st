testing
isValidHeap
	"Check the size first."
	(tally between: 0 and: array size)
		ifFalse: [^ false].
	"Check the sort order between parent and child nodes."
	1
		to: (tally bitShift: -1)
		do: [:index | 
			| childIndex |
			childIndex := 2 * index.
			sortBlock
				ifNil: [(array at: index)
							<= (array at: childIndex)
						ifFalse: [^ false]]
				ifNotNil: [(sortBlock
							value: (array at: index)
							value: (array at: childIndex))
						ifFalse: [^ false]].
			childIndex < tally
				ifTrue: [childIndex := childIndex + 1.
					sortBlock
						ifNil: [(array at: index)
									<= (array at: childIndex)
								ifFalse: [^ false]]
						ifNotNil: [(sortBlock
									value: (array at: index)
									value: (array at: childIndex))
								ifFalse: [^ false]]]].
	"Check for elements left in array after tally."
	tally + 1
		to: array size
		do: [:index | (array at: index)
				ifNotNil: [^ false]].
	^ true