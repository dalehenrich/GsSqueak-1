*SqCharacter-converting
asUnicode
  | val |
  val := self asciiValue.
  self leadingChar == 0
    ifTrue: [ ^ val ].
  ^ self charCode
