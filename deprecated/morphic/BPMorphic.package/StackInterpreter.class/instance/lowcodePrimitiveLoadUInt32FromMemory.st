inline primitive generated code
lowcodePrimitiveLoadUInt32FromMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_value |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_value := self uint32AtPointer: _gsSqueakTemp_pointer.
	self internalPushInt32: _gsSqueakTemp_value