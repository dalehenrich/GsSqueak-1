class initialization
initialize

	ByteSymbol superclass: self.

	"Symbol initialize"

	Symbol rehash.
	Smalltalk addToShutDownList: self.
