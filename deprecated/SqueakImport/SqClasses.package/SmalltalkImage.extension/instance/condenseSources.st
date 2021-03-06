*SqClasses-*SqClasses-*SqClasses-housekeeping
condenseSources
	"Move all the changes onto a compacted sources file."
	"Smalltalk condenseSources"

	| newSourcesFile defaultDirectory newVersion currentVersion |
	Utilities fixUpProblemsWithAllCategory.
	"The above removes any concrete, spurious '-- all --' categories, which mess up the process."
	defaultDirectory := FileDirectory default.
	currentVersion := self sourceFileVersionString.
	newVersion := UIManager default 
		request: 'Please designate the version\for the new source code file...' withCRs
		initialAnswer: currentVersion.
	newVersion ifEmpty: [ ^ self ].
	newVersion = currentVersion ifTrue: [ ^ self error: 'The new source file must not be the same as the old.' ].
	self sourceFileVersionString: newVersion.

	"Write all sources with fileIndex 1"
	newSourcesFile := defaultDirectory newFileNamed: (defaultDirectory localNameFor: self sourcesName).
	newSourcesFile ifNil: [ ^ self error: 'Couldn''t create source code file in\' withCRs,  defaultDirectory name].
	newSourcesFile
		header;
		timeStamp.
	'Condensing Sources File...' 
		displayProgressFrom: 0
		to: self classNames size + self traitNames size
		during: 
			[ :bar | 
			| count |
			count := 0.
			Smalltalk allClassesAndTraitsDo: 
				[ :classOrTrait | 
				bar value: (count := count + 1).
				classOrTrait 
					fileOutOn: newSourcesFile
					moveSource: #historically
					toFile: 1 ] ].
	newSourcesFile
		trailer;
		close.
		
	"Make a new empty changes file"
	self closeSourceFiles.
	defaultDirectory 
		rename: self changesName
		toBe: self changesName , '.old'.
	(FileStream newFileNamed: self changesName)
		header;
		timeStamp;
		close.
	self lastQuitLogPosition: 0.
	self setMacFileInfoOn: self changesName.
	self setMacFileInfoOn: newSourcesFile name.
	self openSourceFiles.
	self inform: 'Source files have been rewritten to\' withCRs, newSourcesFile name, '\Check that all is well,\and then save/quit.' withCRs
