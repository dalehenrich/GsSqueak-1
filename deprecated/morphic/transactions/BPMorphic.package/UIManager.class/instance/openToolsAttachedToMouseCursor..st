accessing
openToolsAttachedToMouseCursor: aBoolean 
	self flag: #todo.
	"mt: Let each instances of ui manager have its own setting."
	self class openToolsAttachedToMouseCursor: aBoolean