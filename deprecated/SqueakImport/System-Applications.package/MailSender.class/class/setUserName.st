settings
setUserName
	"Change the user's email name for use in composing messages."

	(UIManager default
			request: 'What is your email address?\(This is the address other people will reply to you)' withCRs
			initialAnswer: (UserName ifNil: [UserName := '']))
		ifNotNil: [:answer | UserName := answer]