drawing-rectangles
frameAndFillRoundRect: aRectangle radius: cornerRadius fillStyle: fillStyle borderWidth: bw borderColor: bc
	"Draw a rounded rectangle"
	self shadowColor ifNotNil:[
		^self fillRoundRect: aRectangle radius: cornerRadius fillStyle: shadowColor.
	].
	"see if the round rect is degenerate"
	cornerRadius asPoint <= (0@0) 
		ifTrue:[^self frameAndFillRectangle: aRectangle fillColor: fillStyle asColor borderWidth: bw borderColor: bc].
	"Okay it's a rounded rectangle"
	fillStyle isTransparent ifFalse:["fill interior"
		| innerRect radius |
		innerRect := aRectangle.
		radius := cornerRadius.
		bw isZero ifFalse:[
			innerRect := innerRect insetBy: bw.
			radius := radius - bw.
		].
		self fillRoundRect: innerRect radius: radius fillStyle: fillStyle.
	].
	self frameRoundRect: aRectangle radius: cornerRadius width: bw color: bc
