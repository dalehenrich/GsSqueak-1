internal interpreter access
popStack
	"In the StackInterpreter stacks grow down."
	| top |
	<inline: true>
	top := stackPages longAt: stackPointer.
	stackPointer := stackPointer + objectMemory bytesPerWord.
	^top