*SqCharacter-testing
tokenish
	"Answer whether the receiver is a valid token-character--letter, digit, or colon."

	self == $_ ifTrue: [ ^Scanner prefAllowUnderscoreSelectors ].
	^self == $: or: [ self isAlphaNumeric ]
