*VMMaker-interpreter simulator
hex8
	"Print the receiver in base 16 with prefixed base, using at least 8 digits.
	 DO NOT CHANGE THIS!  The Cog VMMaker depends on this.
	 Consider using storeStringBase: 16 length: 11 padded: true instead."
	  "16r3333 hex8"
	| hex |
	hex := self hex.  "16rNNN"
	^hex size < 11
		ifTrue: [hex copyReplaceFrom: 4 to: 3
						 with: ('00000000' copyFrom: 1 to: 11-hex size)]
		ifFalse: [hex]