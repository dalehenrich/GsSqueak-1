accessing
color: aColor
  "Set the receiver's color. Directly set the color if appropriate, else go by
	way of fillStyle"

  (aColor isColor or: [ aColor isKindOf: InfiniteForm ])
    ifFalse: [ ^ self fillStyle: aColor ].
  color = aColor
    ifFalse: [ 
      self removeProperty: #'fillStyle'.
      color := aColor.
      self changed ]