initialization
inAScrollPane
	"Answer a scroll pane that allows the user to scroll the receiver in
	either direction. It will have permanent scroll bars unless you take
	some special action."
	| widget |
	widget := ScrollPane new.
	widget extent: (self width min: 300 max: 100)
			@ (self height min: 150 max: 100);
		 borderWidth: 0.
	widget scroller addMorph: self.
	widget setScrollDeltas.
	widget color: self color darker darker.
	^ widget