clock
eventMillisecondClock
	"In order to make certain event handling code work (cf MouseEvent>asMouseMove) we need access
	to the tick kept by ioMSecs() "
	"Time eventMillisecondClock"
	^ (self utcMicrosecondClock // 1000) bitAnd: 16r1FFFFFFF
