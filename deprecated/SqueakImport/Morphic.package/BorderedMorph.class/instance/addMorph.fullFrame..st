resize handling
addMorph: aMorph fullFrame: aLayoutFrame
	"Add aMorph according to aLayoutFrame."

	self cellInset > 0 ifTrue: [
		| left right bottom top spacing |

		spacing := self cellInset.
		left := aLayoutFrame leftOffset ifNil: [0].
		right := aLayoutFrame rightOffset ifNil: [0].

		bottom := aLayoutFrame bottomOffset ifNil: [0].
		top := aLayoutFrame topOffset ifNil: [0].
		
		"Add a spacing to the frame if it is not top or leftmost."
		aLayoutFrame leftFraction = 0
			ifFalse: [left := left + spacing]
			ifTrue: [
				"Expect another, resizable widget besides me if I have a fixed width."
				aLayoutFrame hasFixedWidth ifTrue: [right := right - spacing]].
		aLayoutFrame topFraction = 0
			ifFalse: [top := top + spacing]
			ifTrue: [
				"Expect another, resizable widget besides me if I have a fixed height."
				aLayoutFrame hasFixedHeight ifTrue: [bottom := bottom - spacing]].
			
		aLayoutFrame
			topOffset: top;
			bottomOffset: bottom;
			leftOffset: left;
			rightOffset: right].
	
	super addMorph: aMorph fullFrame: aLayoutFrame.
	
	self wantsPaneSplitters ifTrue: [self addPaneSplitters].