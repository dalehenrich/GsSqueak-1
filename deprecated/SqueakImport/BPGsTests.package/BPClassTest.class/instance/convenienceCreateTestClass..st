as yet unclassified
convenienceCreateTestClass: name
  Object
    newMethodFromSqueakString:
      'foo
^ Magnitude subclass: ''' + name
        +
          ''' instanceVariableNames: '''' classVariableNames: ''asdf'' poolDictionaries: '''' category: ''myCat'' '
    inEnv: 7.
^ Object new @env7: foo