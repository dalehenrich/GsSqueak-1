*SqNumbers-private
setFraction: fractionIn scale: scaleIn 
	"Private - Set the mantissa to fractionIn and the total number of digits 
	used to represent the fraction part of the receiver, including trailing 
	zeroes, to the Integer scaleIn."
	mantissa := fractionIn.
	scale := scaleIn
