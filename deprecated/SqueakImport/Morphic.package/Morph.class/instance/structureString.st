printing
structureString
	"Return a string that showing this morph and all its submorphs in an indented list that reflects its structure."

	| s |
	s := WriteStream on: (String new: 1000).
	self printStructureOn: s indent: 0.
	^ s contents
