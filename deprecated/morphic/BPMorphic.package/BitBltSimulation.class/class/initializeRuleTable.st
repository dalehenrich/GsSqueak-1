initialization
initializeRuleTable
	"BitBltSimulation initializeRuleTable"
	"**WARNING** You MUST change initBBOpTable if you change this"
	OpTable := #(#clearWord:with: #bitAnd:with: #bitAndInvert:with: #sourceWord:with: #bitInvertAnd:with: #destinationWord:with: #bitXor:with: #bitOr:with: #bitInvertAndInvert:with: #bitInvertXor:with: #bitInvertDestination:with: #bitOrInvert:with: #bitInvertSource:with: #bitInvertOr:with: #bitInvertOrInvert:with: #destinationWord:with: #destinationWord:with: #destinationWord:with: #addWord:with: #subWord:with: #rgbAdd:with: #rgbSub:with: #OLDrgbDiff:with: #OLDtallyIntoMap:with: #alphaBlend:with: #pixPaint:with: #pixMask:with: #rgbMax:with: #rgbMin:with: #rgbMinInvert:with: #alphaBlendConst:with: #alphaPaintConst:with: #rgbDiff:with: #tallyIntoMap:with: #alphaBlendScaled:with: #alphaBlendScaled:with: #alphaBlendScaled:with: #rgbMul:with: #pixSwap:with: #pixClear:with: #fixAlpha:with: #rgbComponentAlpha:with: ).
	"0"
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
	"10"
	"11"
	"12"
	"13"
	"14"
	"15"
	"16"
	"unused - was old paint"
	"17"
	"unused - was old mask"
	"18"
	"19"
	"20"
	"21"
	"22"
	"23"
	"24"
	"25"
	"26"
	"27"
	"28"
	"29"
	"30"
	"31"
	"32"
	"33"
	"34"
	"35"
	"unused here - only used by FXBlt"
	"36"
	"unused here - only used by FXBlt"
	"37"
	"38"
	"39"
	"40"
	"41"
	OpTableSize := OpTable size + 1