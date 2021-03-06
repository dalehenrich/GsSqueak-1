drawing-support
transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize 
	"Note: This method has been originally copied from
	TransformationMorph. "
	| _gsSqueakTemp_innerRect _gsSqueakTemp_patchRect _gsSqueakTemp_sourceQuad _gsSqueakTemp_warp _gsSqueakTemp_start _gsSqueakTemp_subCanvas |
	aDisplayTransform isPureTranslation
		ifTrue: [^ aBlock
				value: (self copyOffset: aDisplayTransform offset negated truncated clipRect: aClipRect)].
	"Prepare an appropriate warp from patch to innerRect"
	_gsSqueakTemp_innerRect := aClipRect.
	_gsSqueakTemp_patchRect := (aDisplayTransform globalBoundsToLocal: _gsSqueakTemp_innerRect) truncated.
	_gsSqueakTemp_sourceQuad := (aDisplayTransform sourceQuadFor: _gsSqueakTemp_innerRect)
				collect: [:p | p - _gsSqueakTemp_patchRect topLeft].
	_gsSqueakTemp_warp := self warpFrom: _gsSqueakTemp_sourceQuad toRect: _gsSqueakTemp_innerRect.
	"Render the submorphs visible in the clipping rectangle, as patchForm"
	_gsSqueakTemp_start := (self depth = 1
					and: [self isShadowDrawing not])
				ifTrue: ["If this is true B&W, then we need a first pass for
					erasure. "
					1]
				ifFalse: [2].
	_gsSqueakTemp_start
		to: 2
		do: [:i | 
			"If i=1 we first make a shadow and erase it for opaque whites
			in B&W"
			_gsSqueakTemp_subCanvas := self class extent: _gsSqueakTemp_patchRect extent depth: self depth.
			i = 1
				ifTrue: [_gsSqueakTemp_subCanvas shadowColor: Color black.
					_gsSqueakTemp_warp combinationRule: Form erase]
				ifFalse: [self isShadowDrawing
						ifTrue: [_gsSqueakTemp_subCanvas shadowColor: self shadowColor].
					_gsSqueakTemp_warp
						combinationRule: (self depth = 32
								ifTrue: [Form blendAlphaScaled]
								ifFalse: [Form paint])].
			_gsSqueakTemp_subCanvas translateBy: _gsSqueakTemp_patchRect topLeft negated during: aBlock.
			_gsSqueakTemp_warp sourceForm: _gsSqueakTemp_subCanvas form;
				 cellSize: cellSize;
				 warpBits.
			_gsSqueakTemp_warp sourceForm: nil.
			_gsSqueakTemp_subCanvas := nil
			"release space for next loop"]