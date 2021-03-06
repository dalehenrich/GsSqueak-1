accessing method dictionary
commentsIn: sourceString
	"Return the comments as a collection of strings in sourceString. This method along with #nextQuotePosIn:startingFrom: is wrong, because it assumes that all double quote characters are comment delimiters, but even this method has a double quote which is not part of any method comment. Also this method has nothing to do with the Behavior itself. Probably CompiledMethod is the best place for this."
	
	| commentStart nextQuotePos someComments aPos |
	(sourceString includes: $") ifFalse: [^#()].
	someComments:= OrderedCollection new.
	aPos:=1.
	nextQuotePos:= 0.
	[commentStart := sourceString findString: '"' startingAt: aPos.
	nextQuotePos:= self nextQuotePosIn: sourceString startingFrom: commentStart.
	(commentStart ~= 0 and: [nextQuotePos >commentStart])] whileTrue: [
		commentStart ~= nextQuotePos ifTrue: [
			someComments add: ((sourceString copyFrom: commentStart + 1 to: nextQuotePos - 1) copyReplaceAll: '""' with: '"').].
	aPos := nextQuotePos+1].
	^someComments
