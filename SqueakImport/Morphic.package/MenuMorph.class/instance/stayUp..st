accessing
stayUp: aBoolean

	stayUp := aBoolean.
	aBoolean ifTrue: [ self removeStayUpBox ].
	originalFocusHolder := nil. "Not needed anymore."