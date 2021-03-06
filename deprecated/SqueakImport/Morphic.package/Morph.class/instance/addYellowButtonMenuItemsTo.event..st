menu
addYellowButtonMenuItemsTo: aMenu event: evt 
	"Populate aMenu with appropriate menu items for a  
	yellow-button (context menu) click."
	aMenu defaultTarget: self.
	""
	Preferences noviceMode
		ifFalse: [aMenu addStayUpItem].
	""
	self addModelYellowButtonItemsTo: aMenu event: evt.
	""
	Preferences generalizedYellowButtonMenu
		ifFalse: [^ self].
	""
	Preferences cmdGesturesEnabled
		ifTrue: [""
			aMenu addLine.
			aMenu add: 'inspect' translated action: #inspect].
	""
	aMenu addLine.
	self world selectedObject == self
		ifTrue: [aMenu add: 'deselect' translated action: #removeHalo]
		ifFalse: [aMenu add: 'select' translated action: #addHalo].
	""
	(self isWorldMorph
			or: [self mustBeBackmost
			or: [self wantsToBeTopmost]])
		ifFalse: [""
			aMenu addLine.
			aMenu add: 'send to back' translated action: #goBehind.
			aMenu add: 'bring to front' translated action: #comeToFront.
			self addEmbeddingMenuItemsTo: aMenu hand: evt hand].
	""
	self isWorldMorph
		ifFalse: [""
	Smalltalk
		at: #NCAAConnectorMorph
		ifPresent: [:connectorClass | 
			aMenu addLine.
			aMenu add: 'connect to' translated action: #startWiring.
			aMenu addLine].
	""

			self isFullOnScreen
				ifFalse: [aMenu add: 'move onscreen' translated action: #goHome]].
	""
	Preferences noviceMode
		ifFalse: [""
			self addLayoutMenuItems: aMenu hand: evt hand.
			(owner notNil
					and: [owner isTextMorph])
				ifTrue: [self addTextAnchorMenuItems: aMenu hand: evt hand]].
	""
	self isWorldMorph
		ifFalse: [""
			aMenu addLine.
			self addToggleItemsToHaloMenu: aMenu].
	""
	aMenu addLine.
	self isWorldMorph
		ifFalse: [aMenu add: 'copy to paste buffer' translated action: #copyToPasteBuffer:].
	(self allStringsAfter: nil) isEmpty
		ifFalse: [aMenu add: 'copy text' translated action: #clipText].
	""
	self addExportMenuItems: aMenu hand: evt hand.
	""
	(Preferences noviceMode not
			and: [self isWorldMorph not])
		ifTrue: [""
			aMenu addLine.
			aMenu add: 'adhere to edge...' translated action: #adhereToEdge].
	""
	self addCustomMenuItems: aMenu hand: evt hand