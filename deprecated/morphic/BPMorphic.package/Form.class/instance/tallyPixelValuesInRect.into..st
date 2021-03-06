analyzing
tallyPixelValuesInRect: destRect into: valueTable 
	"Tally the selected pixels of this Form into valueTable, a Bitmap of
	depth 2^depth similar to a color map. Answer valueTable."
	(BitBlt toForm: self) sourceForm: self;
		 sourceOrigin: 0 @ 0;
		 tallyMap: valueTable;
		 combinationRule: 33;
		 destRect: destRect;
		 copyBits.
	"src must be given for color map ops"
	^ valueTable"
	Move a little rectangle around the screen and print its tallies...
	| r tallies nonZero |
	Cursor blank showWhile: [
	[Sensor anyButtonPressed] whileFalse:
	[r := Sensor cursorPoint extent: 10@10.
	Display border: (r expandBy: 2) width: 2 rule: Form reverse fillColor:
	nil. tallies := (Display copy: r) tallyPixelValues.
	nonZero := (1 to: tallies size) select: [:i | (tallies at: i) > 0]
	thenCollect: [:i | (tallies at: i) -> (i-1)].
	nonZero printString , ' ' displayAt: 0@0.
	Display border: (r expandBy: 2) width: 2 rule: Form reverse fillColor:
	nil]] "