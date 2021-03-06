dnd requests
requestDropStream: dropIndex
	"Return a read-only stream for some file the user has just dropped onto Squeak."
	| rawName |
	rawName := self class primDropRequestFileName: dropIndex.
	name := rawName vmPathToSqueakPath.
	fileID := self primDropRequestFileHandle: dropIndex.
	fileID == nil ifTrue:[^nil].
	self register.
	rwmode := false.
	buffer1 := String new: 1.
	self enableReadBuffering
