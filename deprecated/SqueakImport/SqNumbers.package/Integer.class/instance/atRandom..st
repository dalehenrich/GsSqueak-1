truncation and round off
atRandom: aGenerator
	"Answer a random integer from 1 to self picked from aGenerator."

	^ aGenerator nextInt: self