writing
writeCollectionContents: aCollection separator: separator iterationMessage: op 
	| _gsSqueakTemp_first |
	_gsSqueakTemp_first := true.
	aCollection
		perform: op
		with: [:each | 
			_gsSqueakTemp_first
				ifFalse: [self writeObject: separator].
			self write: each.
			_gsSqueakTemp_first := false]