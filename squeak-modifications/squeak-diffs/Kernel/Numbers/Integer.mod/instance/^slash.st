arithmetic
/ anInteger

<primitive: 261>
anInteger isZero ifTrue: [^(ZeroDivide dividend: self) signal].
anInteger isInteger ifTrue:[
	^ (Fraction numerator: self denominator: anInteger) reduced.].
^ anInteger adaptToInteger: self andSend: #/
