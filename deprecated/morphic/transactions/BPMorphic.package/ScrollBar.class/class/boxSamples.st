images - samples
boxSamples
	"create a set of box with different sizes and colors"
	"
	ScrollBar boxSamples. 
	"
	| _gsSqueakTemp_column |
	_gsSqueakTemp_column := AlignmentMorph newColumn vResizing: #shrinkWrap;
				 hResizing: #shrinkWrap;
				 layoutInset: 1;
				 borderColor: Color black;
				 borderWidth: 0;
				 wrapCentering: #center;
				 cellPositioning: #center;
				 color: Color white;
				 yourself.
	""
	self sampleSizes
		do: [:size | 
			| row |
			row := AlignmentMorph newRow color: Color transparent;
						 vResizing: #shrinkWrap;
						 cellInset: 2 @ 0 yourself.
			""
			self sampleColors
				do: [:color | row addMorphBack: (ScrollBar boxOfSize: size color: color) asMorph].
			""
			_gsSqueakTemp_column addMorphBack: row].
	""
	""
	_gsSqueakTemp_column openInHand