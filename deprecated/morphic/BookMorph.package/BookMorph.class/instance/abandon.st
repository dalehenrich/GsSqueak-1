submorphs-add/remove
abandon
  "Like delete, but we really intend not to use this morph again. Make
	the page cache release the page object."

  self delete.
  self pages
    do: [ :aPage | 
      aPage sqkPage
        ifNotNil: [ :pg | 
          pg contentsMorph == aPage
            ifTrue: [ pg contentsMorph: nil ] ] ]