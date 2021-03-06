beziers-wide
adjustWideBezierLeft: bezier width: lineWidth offset: lineOffset endX: endX 
	"Adjust the wide bezier curve (dx < 0) to start/end at the right point"
	| _gsSqueakTemp_lastX _gsSqueakTemp_lastY |
	(self bezierUpdateDataOf: bezier)
		at: GBUpdateX
		put: ((self bezierUpdateDataOf: bezier)
				at: GBUpdateX)
				- (lineOffset * 256).
	"Set the lastX/Y value of the second curve lineWidth pixels right/down"
	_gsSqueakTemp_lastX := (self wideBezierUpdateDataOf: bezier)
				at: GBUpdateX.
	(self wideBezierUpdateDataOf: bezier)
		at: GBUpdateX
		put: _gsSqueakTemp_lastX + (lineWidth - lineOffset * 256).
	"Set lineWidth pixels down"
	_gsSqueakTemp_lastY := (self wideBezierUpdateDataOf: bezier)
				at: GBUpdateY.
	(self wideBezierUpdateDataOf: bezier)
		at: GBUpdateY
		put: _gsSqueakTemp_lastY + (lineWidth * 256).
	"Record the last X value"
	self bezierFinalXOf: bezier put: endX - lineOffset