debugging
debug: context title: title full: bool
	"Open debugger on self with context shown on top"

	| topCtxt |
	topCtxt := self isActiveProcess ifTrue: [thisContext] ifFalse: [self suspendedContext].
	(topCtxt hasContext: context) ifFalse: [^ self error: 'context not in process'].
	ToolSet debug: self context: context label: title contents: nil fullView: bool.
