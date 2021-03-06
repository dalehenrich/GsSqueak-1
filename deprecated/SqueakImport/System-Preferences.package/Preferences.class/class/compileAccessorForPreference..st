private
compileAccessorForPreference: aPreference
	"Compile an accessor method for the given preference"

	self class 
		compileSilently: (
			'{1} ^self valueOfFlag: {2} ifAbsent: [ {3} ]'
				format: {
					aPreference name asString.
					aPreference name asSymbol printString.
					aPreference defaultValue storeString })
		classified: 'standard queries'