browse
browseMethodsWithLiteral: aString
	"Launch a browser on all methods that contain string literals with aString as a substring. Make the search case-sensitive or insensitive as dictated by the caseSensitive boolean parameter"

	self browseAllSelect:
			[:method |
				method hasLiteralSuchThat: [:lit |
					(lit isString and: [lit isSymbol not]) and:
					[lit = aString]]]
		name:  'Methods with string ', aString printString
		autoSelect: aString.
