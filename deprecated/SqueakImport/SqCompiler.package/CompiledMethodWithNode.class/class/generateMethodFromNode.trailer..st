instance creation
generateMethodFromNode: aMethodNode trailer: bytes
	^ self method: (aMethodNode _env0 generate: bytes) node: aMethodNode.
