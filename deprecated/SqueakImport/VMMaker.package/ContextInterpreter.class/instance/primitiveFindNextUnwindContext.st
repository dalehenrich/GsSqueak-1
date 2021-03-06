control primitives
primitiveFindNextUnwindContext
	"Primitive. Search up the context stack for the next method context marked for unwind handling from the receiver up to but not including the argument. Return nil if none found."
	| thisCntx nilOop aContext unwindMarked |
	aContext := self popStack.
	thisCntx := objectMemory fetchPointer: SenderIndex ofObject: self popStack.
	nilOop := objectMemory getNilObj.

	[(thisCntx = aContext) or: [thisCntx = nilOop]] whileFalse: [
		unwindMarked := self isUnwindMarked: thisCntx.
		unwindMarked ifTrue:[
			self push: thisCntx.
			^nil].
		thisCntx := objectMemory fetchPointer: SenderIndex ofObject: thisCntx].

	^self push: nilOop