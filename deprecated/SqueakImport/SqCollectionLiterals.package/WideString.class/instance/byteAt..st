accessing
byteAt: index

	| d r bytes |
	bytes := self charSize.
	d := (index + bytes - 1) // bytes.
	r := (index - 1) \\ bytes + 1.
	^ (self wordAt: d) digitAt: ((bytes - r) + 1).
