*BPToolsTode
shouldClassBeLoaded: aClassName
  (Smalltalk includesKey: aClassName asSymbol)
    ifTrue: [ 
      (GsConfirmInteraction prompt: 'Class already exists' confirm: 'Overwrite')
        signal
        ifFalse: [ 
          Transcript show: 'asdf'.
          ^ false ] ].
  ^ true