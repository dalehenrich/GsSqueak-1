initialization
initializePrimitiveTable
	"This table generates a C function address table used in
	slowPrimitiveResponse along with dispatchFunctionPointerOn:in:"
	"self initializePrimitiveTable"
	"NOTE: The real limit here is 2047 because of the old method header
	layout but there is no point in going over the needed size"
	MaxPrimitiveIndex := 575.
	MaxQuickPrimitiveIndex := 519.
	PrimNumberExternalCall := 117.
	PrimNumberDoPrimitive := 118.
	PrimNumberFFICall := 120.
	PrimNumberDoExternalCall := 218.
	PrimitiveTable := Array new: MaxPrimitiveIndex + 1.
	self primitivesClass table: PrimitiveTable from: #(#(0 0) #(1 #primitiveAdd) #(2 #primitiveSubtract) #(3 #primitiveLessThan) #(4 #primitiveGreaterThan) #(5 #primitiveLessOrEqual) #(6 #primitiveGreaterOrEqual) #(7 #primitiveEqual) #(8 #primitiveNotEqual) #(9 #primitiveMultiply) #(10 #primitiveDivide) #(11 #primitiveMod) #(12 #primitiveDiv) #(13 #primitiveQuo) #(14 #primitiveBitAnd) #(15 #primitiveBitOr) #(16 #primitiveBitXor) #(17 #primitiveBitShift) #(18 #primitiveMakePoint) #(19 #primitiveFail) #(20 #primitiveRemLargeIntegers) #(21 #primitiveAddLargeIntegers) #(22 #primitiveSubtractLargeIntegers) #(23 #primitiveLessThanLargeIntegers) #(24 #primitiveGreaterThanLargeIntegers) #(25 #primitiveLessOrEqualLargeIntegers) #(26 #primitiveGreaterOrEqualLargeIntegers) #(27 #primitiveEqualLargeIntegers) #(28 #primitiveNotEqualLargeIntegers) #(29 #primitiveMultiplyLargeIntegers) #(30 #primitiveDivideLargeIntegers) #(31 #primitiveModLargeIntegers) #(32 #primitiveDivLargeIntegers) #(33 #primitiveQuoLargeIntegers) #(34 #primitiveBitAndLargeIntegers) #(35 #primitiveBitOrLargeIntegers) #(36 #primitiveBitXorLargeIntegers) #(37 #primitiveBitShiftLargeIntegers) #(38 #primitiveFloatAt) #(39 #primitiveFloatAtPut) #(40 #primitiveAsFloat) #(41 #primitiveFloatAdd) #(42 #primitiveFloatSubtract) #(43 #primitiveFloatLessThan) #(44 #primitiveFloatGreaterThan) #(45 #primitiveFloatLessOrEqual) #(46 #primitiveFloatGreaterOrEqual) #(47 #primitiveFloatEqual) #(48 #primitiveFloatNotEqual) #(49 #primitiveFloatMultiply) #(50 #primitiveFloatDivide) #(51 #primitiveTruncated) #(52 #primitiveFractionalPart) #(53 #primitiveExponent) #(54 #primitiveTimesTwoPower) #(55 #primitiveSquareRoot) #(56 #primitiveSine) #(57 #primitiveArctan) #(58 #primitiveLogN) #(59 #primitiveExp) #(60 #primitiveAt) #(61 #primitiveAtPut) #(62 #primitiveSize) #(63 #primitiveStringAt) #(64 #primitiveStringAtPut) #(65 0) #(66 0) #(67 0) #(68 #primitiveObjectAt) #(69 #primitiveObjectAtPut) #(70 #primitiveNew) #(71 #primitiveNewWithArg) #(72 #primitiveArrayBecomeOneWay) #(73 #primitiveInstVarAt) #(74 #primitiveInstVarAtPut) #(75 #primitiveIdentityHash) #(76 #primitiveStoreStackp) #(77 #primitiveSomeInstance) #(78 #primitiveNextInstance) #(79 #primitiveNewMethod) #(80 #primitiveFail) #(81 #primitiveFail) #(82 #primitiveFail) #(83 #primitivePerform) #(84 #primitivePerformWithArgs) #(85 #primitiveSignal) #(86 #primitiveWait) #(87 #primitiveResume) #(88 #primitiveSuspend) #(89 #primitiveFlushCache) #(90 #primitiveMousePoint) #(91 #primitiveTestDisplayDepth) #(92 #primitiveSetDisplayMode) #(93 #primitiveInputSemaphore) #(94 #primitiveGetNextEvent) #(95 #primitiveInputWord) #(96 #primitiveFail) #(97 #primitiveSnapshot) #(98 #primitiveStoreImageSegment) #(99 #primitiveLoadImageSegment) #(100 #primitivePerformInSuperclass) #(101 #primitiveBeCursor) #(102 #primitiveBeDisplay) #(103 #primitiveScanCharacters) #(104 #primitiveFail) #(105 #primitiveStringReplace) #(106 #primitiveScreenSize) #(107 #primitiveMouseButtons) #(108 #primitiveKbdNext) #(109 #primitiveKbdPeek) #(110 #primitiveIdentical) #(111 #primitiveClass) #(112 #primitiveBytesLeft) #(113 #primitiveQuit) #(114 #primitiveExitToDebugger) #(115 #primitiveChangeClass) #(116 #primitiveFlushCacheByMethod) #(117 #primitiveExternalCall) #(118 #primitiveDoPrimitiveWithArgs) #(119 #primitiveFlushCacheBySelector) #(120 #primitiveCalloutToFFI) #(121 #primitiveImageName) #(122 #primitiveNoop) #(123 #primitiveFail) #(124 #primitiveLowSpaceSemaphore) #(125 #primitiveSignalAtBytesLeft) #(126 #primitiveDeferDisplayUpdates) #(127 #primitiveShowDisplayRect) #(128 #primitiveArrayBecome) #(129 #primitiveSpecialObjectsOop) #(130 #primitiveFullGC) #(131 #primitiveIncrementalGC) #(132 #primitiveObjectPointsTo) #(133 #primitiveSetInterruptKey) #(134 #primitiveInterruptSemaphore) #(135 #primitiveMillisecondClock) #(136 #primitiveSignalAtMilliseconds) #(137 #primitiveSecondsClock) #(138 #primitiveSomeObject) #(139 #primitiveNextObject) #(140 #primitiveBeep) #(141 #primitiveClipboardText) #(142 #primitiveVMPath) #(143 #primitiveShortAt) #(144 #primitiveShortAtPut) #(145 #primitiveConstantFill) #(146 #primitiveFail) #(147 #primitiveFail) #(148 #primitiveClone) #(149 #primitiveGetAttribute) #(150 158 #primitiveFail) #(159 #primitiveHashMultiply) #(160 #primitiveAdoptInstance) #(161 #primitiveSetOrHasIdentityHash) #(162 #primitiveFail) #(163 #primitiveGetImmutability) #(164 #primitiveSetImmutability) #(165 #primitiveIntegerAt) #(166 #primitiveIntegerAtPut) #(167 #primitiveYield) #(168 #primitiveCopyObject) #(169 #primitiveNotIdentical) #(170 #primitiveAsCharacter) #(171 #primitiveImmediateAsInteger) #(172 #primitiveFetchNextMourner) #(173 #primitiveSlotAt) #(174 #primitiveSlotAtPut) #(175 #primitiveBehaviorHash) #(176 #primitiveMaxIdentityHash) #(177 #primitiveAllInstances) #(178 #primitiveAllObjects) #(179 #primitiveFail) #(180 #primitiveGrowMemoryByAtLeast) #(181 #primitiveSizeInBytesOfInstance) #(182 #primitiveSizeInBytes) #(183 #primitiveIsPinned) #(184 #primitivePin) #(185 #primitiveExitCriticalSection) #(186 #primitiveEnterCriticalSection) #(187 #primitiveTestAndSetOwnershipOfCriticalSection) #(188 #primitiveExecuteMethodArgsArray) #(189 #primitiveExecuteMethod) #(190 194 #primitiveFail) #(195 #primitiveFindNextUnwindContext) #(196 #primitiveTerminateTo) #(197 #primitiveFindHandlerContext) #(198 0) #(199 0) #(200 #primitiveClosureCopyWithCopiedValues) #(201 #primitiveClosureValue) #(202 #primitiveClosureValue) #(203 #primitiveClosureValue) #(204 #primitiveClosureValue) #(205 #primitiveClosureValue) #(206 #primitiveClosureValueWithArgs) #(207 #primitiveFullClosureValue) #(208 #primitiveFullClosureValueWithArgs) #(209 #primitiveFullClosureValueNoContextSwitch) #(210 #primitiveContextAt) #(211 #primitiveContextAtPut) #(212 #primitiveContextSize) #(213 #primitiveContextXray) #(214 #primitiveVoidVMState) #(215 #primitiveFlushCacheByMethod) #(216 217 #primitiveFail) #(218 #primitiveDoNamedPrimitiveWithArgs) #(219 #primitiveFail) #(220 #primitiveFail) #(221 #primitiveClosureValueNoContextSwitch) #(222 #primitiveClosureValueNoContextSwitch) #(223 229 #primitiveFail) #(230 #primitiveRelinquishProcessor) #(231 #primitiveForceDisplayUpdate) #(232 #primitiveFormPrint) #(233 #primitiveSetFullScreen) #(234 #primitiveFail) #(235 #primitiveFail) #(236 #primitiveFail) #(237 #primitiveFail) #(238 239 #primitiveFail) #(240 #primitiveUTCMicrosecondClock) #(241 #primitiveLocalMicrosecondClock) #(242 #primitiveSignalAtUTCMicroseconds) #(243 #primitiveUpdateTimezone) #(244 #primitiveUtcAndTimezoneOffset) #(245 #primitiveCoarseUTCMicrosecondClock) #(246 #primitiveCoarseLocalMicrosecondClock) #(247 #primitiveSnapshotEmbedded) #(248 #primitiveArrayBecomeOneWayNoCopyHash) #(249 #primitiveArrayBecomeOneWayCopyHash) #(250 #primitiveClearVMProfile) #(251 #primitiveControlVMProfiling) #(252 #primitiveVMProfileSamplesInto) #(253 #primitiveFail) #(254 #primitiveVMParameter) #(255 #primitiveFail) #(256 nil) #(257 nil) #(258 nil) #(259 nil) #(260 nil) #(261 nil) #(262 nil) #(263 nil) #(264 519 nil) #(520 #primitiveFail) #(521 529 #primitiveFail) #(530 539 #primitiveFail) #(540 #primitiveFail) #(541 #primitiveSmallFloatAdd) #(542 #primitiveSmallFloatSubtract) #(543 #primitiveSmallFloatLessThan) #(544 #primitiveSmallFloatGreaterThan) #(545 #primitiveSmallFloatLessOrEqual) #(546 #primitiveSmallFloatGreaterOrEqual) #(547 #primitiveSmallFloatEqual) #(548 #primitiveSmallFloatNotEqual) #(549 #primitiveSmallFloatMultiply) #(550 #primitiveSmallFloatDivide) #(551 #primitiveSmallFloatTruncated) #(552 #primitiveSmallFloatFractionalPart) #(553 #primitiveSmallFloatExponent) #(554 #primitiveSmallFloatTimesTwoPower) #(555 #primitiveSmallFloatSquareRoot) #(556 #primitiveSmallFloatSine) #(557 #primitiveSmallFloatArctan) #(558 #primitiveSmallFloatLogN) #(559 #primitiveSmallFloatExp) #(560 569 #primitiveFail) #(570 #primitiveFlushExternalPrimitives) #(571 #primitiveUnloadModule) #(572 #primitiveListBuiltinModule) #(573 #primitiveListExternalModule) #(574 #primitiveFail) #(575 #primitiveFail))
	"Integer Primitives (0-19)"
	"a.k.a. primitiveFail but faster because primitiveFail won't even be
	called "
	"Guard primitive for simulation -- *must* fail"
	"LargeInteger Primitives (20-37)"
	"Float Primitives (38-59)"
	"Subscript and Stream Primitives (60-67)"
	"The stream primitives no longer pay their way; normal Smalltalk code
	is faster."
	"a.k.a. primitiveFail but faster because primitiveFail won't even be
	called "
	"was primitiveNext"
	"a.k.a. primitiveFail but faster because primitiveFail won't even be
	called "
	"was primitiveNextPut"
	"a.k.a. primitiveFail but faster because primitiveFail won't even be
	called "
	"was primitiveAtEnd"
	"StorageManagement Primitives (68-79)"
	"Blue Book: primitiveBecome"
	"Blue Book: primitiveAsObject"
	"Control Primitives (80-89)"
	"Blue Book: primitiveBlockCopy"
	"Blue Book: primitiveValue"
	"Blue Book: primitiveValueWithArgs"
	"Input/Output Primitives (90-109)"
	"Blue Book: primitiveCursorLocPut"
	"Blue Book: primitiveCursorLink"
	"Blue Book: primitiveSampleInterval"
	"primitiveCopyBits"
	"Blue Book: primitiveSignalAtTick"
	"primitiveDrawLoop"
	"System Primitives (110-119)"
	"Blue Book: primitiveOopsLeft"
	"Squeak 2.2 and earlier use 119. Squeak 2.3 and later use 116.
	Both are supported for backward compatibility."
	"Miscellaneous Primitives (120-127)"
	"Blue Book: primitiveImageVolume"
	"was primitiveValueUninterruptably"
	"Squeak Primitives Start Here"
	"Squeak Miscellaneous Primitives (128-149)"
	"NOTE: When removing the obsolete indexed primitives,
	the following two should go become #primitiveIntegerAt / atPut"
	"primitiveReadJoystick"
	"primitiveWarpBits"
	"Were File Primitives (150-169) - NO LONGER INDEXED"
	"reserved for immutablity primitives"
	"hacked in here for now"
	"SpurMemoryManager primitives"
	"c.f. (73 primitiveInstVarAt)"
	"c.f. (74 primitiveInstVarAtPut)"
	"reserved for primitiveAllInstancesOfAny"
	"CriticalSection primitives"
	"similar to signal hence index = signal + 100"
	"similar to wait hence index = wait + 100. was primitiveClosureValue"
	"was primitiveClosureValueWithArgs"
	"Perform method directly"
	"Sound Primitives (continued) - NO LONGER INDEXED"
	"Unwind primitives"
	"a.k.a. primitiveMarkUnwindMethod"
	"a.k.a. primitiveMarkHandlerMethod"
	"new closure primitives (were Networking primitives)"
	"value"
	"value:"
	"value:value:"
	"value:value:value:"
	"value:value:value:value:"
	"valueWithArguments:"
	"value[:value:value:value:] et al"
	"valueWithArguments:"
	"valueNoContextSwitch[:value:] et al"
	"primitiveVoidVMStateForMethod in the CoInterpreter"
	"reserved for Cog primitives"
	"reserved for Cog primitives"
	"reserved for Cog primitives"
	"valueNoContextSwitch"
	"valueNoContextSwitch:"
	"reserved for Cog primitives (see 228 & 229 in CoInterpreterMT"
	"primBitmapdecompressfromByteArrayat"
	"primStringcomparewithcollated"
	"primSampledSoundconvert8bitSignedFromto16Bit"
	"primBitmapcompresstoByteArray"
	"serial port primitives"
	"was serial port primitive"
	"was serial port primitive"
	"primStringtranslatefromtotable"
	"primStringindexOfAsciiinStringstartingAt"
	"primStringfindSubstringinstartingAtmatchTable"
	"was primitiveInvokeObjectAsMethod"
	"VM Implementor Primitives (250-255)"
	"primitiveStartVMProfiling"
	"primitiveStopVMProfiling"
	"N.B. primitiveCollectCogCodeConstituents in CoInterpreter below"
	"RESERVED FOR THE R/Squeak VM. Was
	primitiveInstVarsPutFromStack. Never used except in Disney tests."
	"Quick Push Const Methods"
	"primitivePushSelf"
	"primitivePushTrue"
	"primitivePushFalse"
	"primitivePushNil"
	"primitivePushMinusOne"
	"primitivePushZero"
	"primitivePushOne"
	"primitivePushTwo"
	"Quick Push Inst Var Methods"
	"primitiveLoadInstVar"
	"Reserved for Spur primitives"
	"External primitive support primitives"
	"reserved for addl. external support prims"
	"Unassigned Primitives"