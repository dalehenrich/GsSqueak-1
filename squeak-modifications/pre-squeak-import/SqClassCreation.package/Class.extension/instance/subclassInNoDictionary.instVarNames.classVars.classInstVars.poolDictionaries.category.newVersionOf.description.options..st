*SqClassCreation
subclassInNoDictionary: aString instVarNames: anArrayOfStrings classVars: anArrayOfClassVars classInstVars: anArrayOfClassInstVars poolDictionaries: anArrayOfPoolDicts category: aCategoryName newVersionOf: old description: aDescription options: optionsArray
  | cl dict |
  dict := SymbolDictionary new.
  old ifNotNil: [ dict at: old name asSymbol put: old ].
  cl := self
    subclass: aString
    instVarNames: anArrayOfStrings
    classVars: anArrayOfClassVars
    classInstVars: anArrayOfClassInstVars
    poolDictionaries: anArrayOfPoolDicts
    inDictionary: dict
    newVersionOf: old
    description: aDescription
    options: optionsArray.
  cl category: aCategoryName asString.
  ^ cl