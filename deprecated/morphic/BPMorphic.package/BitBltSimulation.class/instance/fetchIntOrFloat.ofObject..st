interpreter interface
fetchIntOrFloat: fieldIndex ofObject: objectPointer 
	"Return the integer value of the given field of the given object. If the
	field contains a Float, truncate it and return its integral part. Fail if the
	given field does not contain a small integer or Float, or if the
	truncated Float is out of the range of small integers."
	| _gsSqueakTemp_fieldOop _gsSqueakTemp_floatValue |
	<var: #floatValue type: 'double '>
	_gsSqueakTemp_fieldOop := interpreterProxy fetchPointer: fieldIndex ofObject: objectPointer.
	(interpreterProxy isIntegerObject: _gsSqueakTemp_fieldOop)
		ifTrue: [^ interpreterProxy integerValueOf: _gsSqueakTemp_fieldOop].
	_gsSqueakTemp_floatValue := interpreterProxy floatValueOf: _gsSqueakTemp_fieldOop.
	(-2.147483648e9 <= _gsSqueakTemp_floatValue
			and: [_gsSqueakTemp_floatValue <= 2.147483647e9])
		ifFalse: [interpreterProxy primitiveFail.
			^ 0].
	^ _gsSqueakTemp_floatValue asInteger