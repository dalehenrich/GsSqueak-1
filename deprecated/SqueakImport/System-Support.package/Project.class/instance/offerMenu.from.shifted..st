utilities
offerMenu: menuSelector from: aModel shifted: aBoolean
	"Pop up a menu whose target is aModel and whose contents are provided
	by sending the menuSelector to the model. The menuSelector takes two
	arguments: a menu, and a boolean representing the shift state."

	self subclassResponsibility