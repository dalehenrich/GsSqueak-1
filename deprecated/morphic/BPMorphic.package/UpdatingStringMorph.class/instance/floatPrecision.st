accessing
floatPrecision
	"Answer the floatPrecision to use:
	1.0 ->	show whole number
	0.1	->	show one digit of precision
	.01 ->	show two digits of precision
	etc.
	Initialize the floatPrecision to 1 if it is not already defined"
	floatPrecision isNumber
		ifFalse: [self target: target].
	"Fixes up errant cases from earlier bug"
	^ floatPrecision