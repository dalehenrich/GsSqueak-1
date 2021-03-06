image
imageFormatVersionFromFile
	"Answer an integer identifying the type of image on file. The image version number may
	identify the format of the image (e.g. 32 or 64-bit word size) or specific requirements
	of the image (e.g. block closure support required)"

	"Smalltalk image imageFormatVersionFromFile"

	| format |
	format := self imageFormatVersionFromFileAsIs.
	^format <= 16r00FFFFFF
		ifTrue: [  "same endianness as VM"
			format ]
		ifFalse: [ "convert endianness"
			((format bitAnd: 16rFF000000) >> 24)
			+ ((format bitAnd: 16r00FF0000) >> 8)
			+ ((format bitAnd: 16r0000FF00) << 8)
			+ ((format bitAnd: 16r000000FF) << 16)]
