object access primitives
primitiveArrayBecome
	"We must flush the method cache here, to eliminate stale references
	to mutated classes and/or selectors."

	| arg rcvr |
	arg := self stackTop.
	rcvr := self stackValue: 1.
	self success: (objectMemory become: rcvr with: arg twoWay: true copyHash: true).
	self successful ifTrue: [ self pop: 1 ].