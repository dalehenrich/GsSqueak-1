examples
exampleChangeLabel
	"SystemProgressMorph exampleChangeLabel"
	| classes |
	classes := Smalltalk allClasses copyFrom: 1 to: 100.
	'InitialLabel' 
		displayProgressFrom: 0 to: classes size
		during: [:bar | 1 to: classes size do: [:i |
				bar value: i.
				bar value: i printString, '/', classes size printString, ' ', (classes at: i) printString.
				(Delay forMilliseconds: 100) wait]]
