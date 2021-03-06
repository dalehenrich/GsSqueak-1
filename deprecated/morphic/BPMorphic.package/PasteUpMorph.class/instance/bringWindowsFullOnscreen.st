world menu
bringWindowsFullOnscreen
	"Make ever SystemWindow on the desktop be totally on-screen,
	whenever possible."
	(SystemWindow
		windowsIn: self
		satisfying: [:w | true])
		do: [:aWindow | 
			aWindow
				right: (aWindow right min: bounds right).
			aWindow
				bottom: (aWindow bottom min: bounds bottom).
			aWindow
				left: (aWindow left max: bounds left).
			aWindow
				top: (aWindow top max: bounds top)]