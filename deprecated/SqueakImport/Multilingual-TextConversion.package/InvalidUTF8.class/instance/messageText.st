private
messageText
	"Return a textual description of the exception."
	^messageText ifNil: [string
		ifNil: ['Invalid UTF8']
		ifNotNil: ['Invalid utf8: ', string]]