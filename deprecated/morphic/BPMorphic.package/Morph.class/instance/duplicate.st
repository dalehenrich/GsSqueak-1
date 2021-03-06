copying
duplicate
  "Make and return a duplicate of the receiver"

  | newMorph aName aPlayer topRend |
  (topRend := self topRendererOrSelf) ~~ self
    ifTrue: [ ^ topRend duplicate ].
  self okayToDuplicate
    ifFalse: [ ^ self ].
  aName := self world ifNotNil: [ :w | w nameForCopyIfAlreadyNamed: self ].
  newMorph := self verryDeepCopy.	"HACK TODO"
  aName ifNotNil: [ newMorph setNameTo: aName ].
  newMorph arrangeToStartStepping.
  newMorph privateOwner: nil.	"no longer in world"
  newMorph isPartsDonor: false.	"no longer parts donor"
  (aPlayer := newMorph player) belongsToUniClass
    ifTrue: [ aPlayer class bringScriptsUpToDate ].
  aPlayer
    ifNotNil: [ (SessionTemps current at: #'ActiveWorld') presenter flushPlayerListCache ].
  ^ newMorph