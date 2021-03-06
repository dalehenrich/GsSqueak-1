initialization
becomeActiveDuring: aBlock
	"Make the receiver the ActiveWorld during the evaluation of aBlock."

	| priorWorld |
	priorWorld := ActiveWorld.
	ActiveWorld := self.
	^ aBlock ensure: [
		"check to support project switching."
		ActiveWorld == self ifTrue: [ActiveWorld := priorWorld]].