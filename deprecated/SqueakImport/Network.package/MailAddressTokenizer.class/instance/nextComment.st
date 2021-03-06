tokenizing
nextComment
	| start nestLevel paren |
	start := pos.
	pos := pos + 1.
	nestLevel := 1.

	[ nestLevel > 0 ] whileTrue: [
		pos := text indexOfAnyOf: self class parenthesesSet startingAt: pos.
		pos = 0 ifTrue: [ 
			self error: 'unterminated comment.  ie, more (''s than )''s' ].

		paren := self nextChar.
		paren = $( ifTrue: [ nestLevel := nestLevel + 1 ] ifFalse: [ nestLevel := nestLevel - 1 ]].
	^ MailAddressToken type: #Comment
		text: (text copyFrom: start to: pos - 1)