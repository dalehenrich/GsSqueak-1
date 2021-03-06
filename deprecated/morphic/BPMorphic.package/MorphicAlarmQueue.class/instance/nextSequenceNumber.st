private
nextSequenceNumber
	(sequenceNumber := sequenceNumber + 1) = 1073741823
		ifTrue: ["Sequence number overflow... reassign sequence numbers
			starting at 1."
			heap sort.
			1
				to: heap size
				do: [:index | (heap at: index)
						sequenceNumber: index].
			sequenceNumber := heap size + 1].
	^ sequenceNumber