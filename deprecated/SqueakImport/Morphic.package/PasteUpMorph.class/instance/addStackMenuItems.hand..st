menu & halo
addStackMenuItems: menu hand: aHandMorph
	"Add appropriate stack-related items to the given menu"

	self isStackBackground
		ifTrue:
			[menu add: 'card & stack...' target: self action: #presentCardAndStackMenu]