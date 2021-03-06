accessing
sortBlock: aBlock

	| oldIndexUpdateBlock |
	sortBlock := aBlock.
	"Restore the heap invariant."
	tally <= 1 ifTrue: [ ^self ].
	oldIndexUpdateBlock := indexUpdateBlock.
	indexUpdateBlock := nil.
	(tally bitShift: -1) to: 1 by: -1 do: [ :index | self downHeap: index ].
	indexUpdateBlock := oldIndexUpdateBlock ifNil: [ ^self ].
	1 to: tally do: [ :index |
		indexUpdateBlock value: (array at: index) value: index ]
	
