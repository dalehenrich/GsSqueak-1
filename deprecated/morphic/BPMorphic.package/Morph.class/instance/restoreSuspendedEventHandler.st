event handling
restoreSuspendedEventHandler
	(self valueOfProperty: #suspendedEventHandler)
		ifNotNil: [:savedHandler | self eventHandler: savedHandler].
	submorphs
		do: [:m | m restoreSuspendedEventHandler]