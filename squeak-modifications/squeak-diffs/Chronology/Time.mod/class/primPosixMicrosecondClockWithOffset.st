private
primPosixMicrosecondClockWithOffset
	"Answer an array with UTC microseconds since the Posix epoch and the
	current seconds offset from GMT in the local time zone."

	<messageSendsInEnv: 0>
	| processor |
	self _env7 flag: #goodEnoughForNow.
	processor := GemstoneSmalltalk at: #Processor.
	^{ processor _scheduler _now * 1000 . 0}
