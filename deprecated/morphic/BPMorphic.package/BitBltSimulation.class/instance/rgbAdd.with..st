combination rules
rgbAdd: sourceWord with: destinationWord 
	| _gsSqueakTemp_componentMask _gsSqueakTemp_carryOverflowMask |
	<inline: false>
	<var: #sourceWord type: 'unsigned int'>
	<var: #destinationWord type: 'unsigned int'>
	<var: #carryOverflowMask type: 'unsigned int'>
	<var: #componentMask type: 'unsigned int'>
	destDepth < 16
		ifTrue: ["Add each pixel separately"
			_gsSqueakTemp_componentMask := 1 << destDepth - 1.
			_gsSqueakTemp_carryOverflowMask := 4294967295 // _gsSqueakTemp_componentMask << (destDepth - 1).
			^ self
				partitionedAdd: sourceWord
				to: destinationWord
				nBits: destDepth
				componentMask: _gsSqueakTemp_componentMask
				carryOverflowMask: _gsSqueakTemp_carryOverflowMask].
	destDepth = 16
		ifTrue: ["Add RGB components of each pixel separately"
			_gsSqueakTemp_componentMask := 31.
			_gsSqueakTemp_carryOverflowMask := 1108361744.
			^ self
				partitionedAdd: (sourceWord bitAnd: 2147450879)
				to: (destinationWord bitAnd: 2147450879)
				nBits: 5
				componentMask: _gsSqueakTemp_componentMask
				carryOverflowMask: _gsSqueakTemp_carryOverflowMask"make sure that the unused bit is at 0"]
		ifFalse: ["Add RGBA components of the pixel separately"
			_gsSqueakTemp_componentMask := 255.
			_gsSqueakTemp_carryOverflowMask := 2155905152.
			^ self
				partitionedAdd: sourceWord
				to: destinationWord
				nBits: 8
				componentMask: _gsSqueakTemp_componentMask
				carryOverflowMask: _gsSqueakTemp_carryOverflowMask]