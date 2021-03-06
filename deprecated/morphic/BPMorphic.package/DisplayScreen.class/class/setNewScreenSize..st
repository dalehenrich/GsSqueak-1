display box access
setNewScreenSize: aPoint 
	"Ensure that the Display is set to the given extent."
	self hostWindowExtent: aPoint.
	self checkForNewScreenSize.
	"In the Windows version of the host window plugin, the extent
	currently includes window decorations. Therefore, we need two
	attempts to ensure that the Display extent is aPoint. Note that this is
	a bug in the plugin."
	(Display extent x < aPoint x
			or: [Display extent y < aPoint y])
		ifTrue: [self hostWindowExtent: 2 * aPoint - Display extent.
			self checkForNewScreenSize]