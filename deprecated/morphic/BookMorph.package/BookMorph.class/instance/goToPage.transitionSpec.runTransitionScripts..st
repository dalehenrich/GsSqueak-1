navigation
goToPage: pageNumber transitionSpec: transitionSpec runTransitionScripts: aBoolean
  "Go the the given page number; use the transitionSpec supplied, and
	if the boolean parameter is true, run opening and closing scripts as
	appropriate "

  | _gsSqueakTemp_pageMorph |
  self pages isEmpty
    ifTrue: [ ^ self ].
  _gsSqueakTemp_pageMorph := (self hasProperty: #'dontWrapAtEnd')
    ifTrue: [ self pages atPin: pageNumber ]
    ifFalse: [ self pages atWrap: pageNumber ].
  ^ self
    goToPageMorph: _gsSqueakTemp_pageMorph
    transitionSpec: transitionSpec
    runTransitionScripts: aBoolean