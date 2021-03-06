image
imageFormatVersion
	"Answer an integer identifying the type of image in memory. The image version number may
	identify the format of the image (e.g. 32 or 64-bit word size) or specific requirements
	of the image (e.g. block closure support required). This invokes an optional primitive
	that may not be available on all virtual machines."

	"Smalltalk image imageFormatVersion"

	

	"Cog provides a VM parameter"
	^[Smalltalk vm vmParameterAt: 41]
		on: Error
		do: [self notify: 'This virtual machine does not support the optional ',
				'primitive #primitiveImageFormatVersion' translated.
			nil]
