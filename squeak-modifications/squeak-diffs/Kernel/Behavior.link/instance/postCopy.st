copying
postCopy
	super postCopy.
	self methodDict: self methodDict copy
