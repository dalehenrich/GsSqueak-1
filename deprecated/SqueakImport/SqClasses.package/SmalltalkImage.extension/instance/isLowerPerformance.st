*SqClasses-*SqClasses-*SqClasses-system attributes
isLowerPerformance
	"Some operations - TestCases for example - need an idea of the typical performance of the system on which they are being performed. For now we will simply assert that running on an ARM cpu or as a SqueakJS instance is enough of a discriminator. Options for the future might also involve whether the vm is a full Cog or Sisata system, even actually measuring the performance at some point to be sure"
	^ false "(self platformSubtype beginsWith: 'arm')" "Raspberry PI for example"
		"or: [self platformName = 'Web']" "SqueakJS"
