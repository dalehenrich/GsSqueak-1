fileIn/Out
writeJPEGfileNamed: fileName progressive: aBoolean 
	"Write a JPEG file to the given filename using default settings. Make it
	progressive or not, depending on the boolean argument"
	JPEGReadWriter2
		putForm: self
		quality: -1
		progressiveJPEG: aBoolean
		onFileNamed: fileName
	"default"
	"
	Display writeJPEGfileNamed: 'display.jpeg' progressive: false.
	Form fromUser writeJPEGfileNamed: 'yourPatch.jpeg' progressive: tru
	"