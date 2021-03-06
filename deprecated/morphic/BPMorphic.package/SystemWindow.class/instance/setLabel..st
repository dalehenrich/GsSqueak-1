label
setLabel: aString 
	| _gsSqueakTemp_frame |
	labelString := aString.
	label
		ifNil: [^ self].
	label
		contents: (aString
				ifNil: ['']).
	self labelWidgetAllowance.
	"Sets it if not already"
	self isCollapsed
		ifTrue: [self extent: label width + labelWidgetAllowance @ (self labelHeight + 2)]
		ifFalse: [label fitContents;
				setWidth: (label width min: bounds width - labelWidgetAllowance).
			label align: label bounds topCenter with: bounds topCenter + (0 @ borderWidth).
			collapsedFrame
				ifNotNil: [collapsedFrame := collapsedFrame withWidth: label width + labelWidgetAllowance]].
	_gsSqueakTemp_frame := LayoutFrame new.
	_gsSqueakTemp_frame leftFraction: 0.5;
		 topFraction: 0.5;
		 leftOffset: label width negated // 2;
		 topOffset: label height negated // 2.
	label layoutFrame: _gsSqueakTemp_frame