combination rules
merge: sourceWord with: destinationWord 
	"Sender warpLoop is too big to include this in-line"
	| _gsSqueakTemp_mergeFnwith |
	<var: #mergeFnwith declareC: 'sqInt (*mergeFnwith)(sqInt, sqInt)'>
	_gsSqueakTemp_mergeFnwith := self
				cCoerce: (opTable at: combinationRule + 1)
				to: 'sqInt (*)(sqInt, sqInt)'.
	_gsSqueakTemp_mergeFnwith.
	"null ref for compiler"
	^ self mergeFn: sourceWord with: destinationWord