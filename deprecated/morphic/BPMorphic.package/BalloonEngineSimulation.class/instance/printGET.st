debug support
printGET
	| _gsSqueakTemp_edge |
	Transcript cr; show: '************* GlobalEdgeTable **************'.
	0
		to: self getUsedGet - 1
		do: [:i | 
			_gsSqueakTemp_edge := getBuffer at: i.
			Transcript cr; print: i; space; nextPutAll: 'edge #'; print: _gsSqueakTemp_edge; space; nextPutAll: 'x: ';
				print: (self edgeXValueOf: _gsSqueakTemp_edge); space; nextPutAll: 'y: ';
				print: (self edgeYValueOf: _gsSqueakTemp_edge); space; nextPutAll: 'z: ';
				print: (self edgeZValueOf: _gsSqueakTemp_edge); space; nextPutAll: 'fill0: ';
				print: (self edgeLeftFillOf: _gsSqueakTemp_edge); space; nextPutAll: 'fill1: ';
				print: (self edgeRightFillOf: _gsSqueakTemp_edge); space; nextPutAll: 'lines: ';
				print: (self edgeNumLinesOf: _gsSqueakTemp_edge); space.
			(self areEdgeFillsValid: _gsSqueakTemp_edge)
				ifFalse: [Transcript nextPutAll: ' disabled'].
			Transcript endEntry]