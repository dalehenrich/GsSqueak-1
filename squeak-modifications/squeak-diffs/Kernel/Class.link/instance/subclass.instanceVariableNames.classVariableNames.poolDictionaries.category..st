subclass creation
subclass: t instanceVariableNames: f classVariableNames: d poolDictionaries: s category: cat 
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class (the receiver)."
	
	| newClass old |
	old := Smalltalk globals _env0 at: (t asSymbol) ifAbsent: [nil].
	newClass := self _env0 subclassInNoDictionary: t instVarNames: (self asArrayParam: f) classVars:  (self asArrayParam: d) classInstVars: (Array new) poolDictionaries: (self asArrayParam: s) category: cat newVersionOf: old description: nil options: (Array new).
	Smalltalk globals _env0 at: (newClass name) put: newClass.
	^ newClass.
	
	
	
