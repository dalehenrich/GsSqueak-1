combination rules
alphaBlend: sourceWord with: destinationWord 
	"Blend sourceWord with destinationWord, assuming both are 32-bit
	pixels. The source is assumed to have 255*alpha in the high 8 bits of
	each pixel,
	while the high 8 bits of the destinationWord will be ignored.
	The blend produced is alpha*source + (1-alpha)*dest, with
	the computation being performed independently on each color
	component. The high byte of the result will be 0."
	| _gsSqueakTemp_alpha _gsSqueakTemp_unAlpha _gsSqueakTemp_result _gsSqueakTemp_blendRB _gsSqueakTemp_blendAG |
	<inline: false>
	<return: 'unsigned int'>
	<var: #sourceWord type: 'unsigned int'>
	<var: #destinationWord type: 'unsigned int'>
	<var: #blendRB type: 'unsigned int'>
	<var: #blendAG type: 'unsigned int'>
	<var: #result type: 'unsigned int'>
	<var: #alpha type: 'unsigned int'>
	<var: #unAlpha type: 'unsigned int'>
	_gsSqueakTemp_alpha := sourceWord >> 24.
	"High 8 bits of source pixel"
	_gsSqueakTemp_alpha = 0
		ifTrue: [^ destinationWord].
	_gsSqueakTemp_alpha = 255
		ifTrue: [^ sourceWord].
	_gsSqueakTemp_unAlpha := 255 - _gsSqueakTemp_alpha.
	_gsSqueakTemp_blendRB := (sourceWord bitAnd: 16711935)
				* _gsSqueakTemp_alpha + ((destinationWord bitAnd: 16711935)
					* _gsSqueakTemp_unAlpha) + 16711935.
	"blend red and blue"
	_gsSqueakTemp_blendAG := ((sourceWord >> 8 bitOr: 16711680)
				bitAnd: 16711935)
				* _gsSqueakTemp_alpha + ((destinationWord >> 8 bitAnd: 16711935)
					* _gsSqueakTemp_unAlpha) + 16711935.
	"blend alpha and green"
	_gsSqueakTemp_blendRB := _gsSqueakTemp_blendRB
				+ (_gsSqueakTemp_blendRB - 65537 >> 8 bitAnd: 16711935) >> 8 bitAnd: 16711935.
	"divide by 255"
	_gsSqueakTemp_blendAG := _gsSqueakTemp_blendAG
				+ (_gsSqueakTemp_blendAG - 65537 >> 8 bitAnd: 16711935) >> 8 bitAnd: 16711935.
	_gsSqueakTemp_result := _gsSqueakTemp_blendRB bitOr: _gsSqueakTemp_blendAG << 8.
	^ _gsSqueakTemp_result