ui requests
chooseMultipleFrom: labelList values: valueList title: aString 
	"Choose one or more items from the given list. Answer the selected
	items. "
	^ self
		chooseMultipleFrom: labelList
		values: valueList
		lines: #()
		title: aString