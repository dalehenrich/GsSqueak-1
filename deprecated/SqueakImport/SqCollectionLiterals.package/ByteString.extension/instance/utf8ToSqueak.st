*SqCollectionLiterals-*SqCollectionLiterals-converting
utf8ToSqueak
	"Convert the given string (self) from UTF-8 to Squeak's internal representation."
	
	^UTF8TextConverter decodeByteString: self
