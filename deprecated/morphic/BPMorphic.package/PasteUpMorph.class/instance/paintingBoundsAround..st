painting
paintingBoundsAround: aPoint 
	"Return a rectangle for painting centered on the given point. Both the
	argument point and the result rectangle are in world coordinates."
	| paintExtent maxPaintArea myBnds |
	paintExtent := self reasonablePaintingExtent.
	maxPaintArea := paintExtent x * paintExtent y.
	myBnds := self boundsInWorld.
	myBnds area <= maxPaintArea
		ifTrue: [^ myBnds].
	^ (aPoint - (paintExtent // 2) extent: paintExtent)
		intersect: myBnds