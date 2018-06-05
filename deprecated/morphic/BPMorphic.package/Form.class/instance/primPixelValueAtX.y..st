pixel access
primPixelValueAtX: x y: y
  "Return the raw pixel value at the given point. This pixel value
	depends on the receiver's depth. Typical clients use colorAt: to get a
	Color. Make sure the colorMap is nil for ColorForms"

  ^ bits at: y * width + x + 1	" self halt.
  ^ (BitBlt bitPeekerFromForm: self)
    colorMap: nil;
    pixelAt: x @ y"