meta-actions
resizeFromMenu
  "Commence an interaction that will resize the receiver"

  self resizeMorph: (SessionTemps current at: #'ActiveEvent')