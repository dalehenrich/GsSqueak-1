platform independent access
unsignedLong64At: index bigEndian: bigEndian
	"Return a 64-bit unsigned integer quantity starting from the given byte index. Use #normalize where necessary to ensure compatibility with non-30-bit SmallIntegers."

	| byte |
	SmallInteger maxVal >  1073741823 ifTrue:
		[bigEndian
			ifTrue: "64-bit SmallIntegers have a 3 bit tag and a sign bit, so the most positive value has 16rF as its top byte."
				[(byte := self at: index) <= 16rF ifTrue:
					[^((((((((byte bitShift: 8) + (self at: index + 1) bitShift: 8) + (self at: index + 2) bitShift: 8) + (self at: index + 3)) bitShift: 8)
						+ (self at: index + 4) bitShift: 8) + (self at: index + 5) bitShift: 8) + (self at: index + 6) bitShift: 8) + (self at: index + 7)]]
			ifFalse:
				[(byte := self at: index + 7) <= 16rF ifTrue:
					[^((((((((byte bitShift: 8) + (self at: index + 6) bitShift: 8) + (self at: index + 5) bitShift: 8) + (self at: index + 4)) bitShift: 8)
						+ (self at: index + 3) bitShift: 8) + (self at: index + 2) bitShift: 8) + (self at: index + 1) bitShift: 8) + (self at: index)]]].
	bigEndian ifFalse: [
		(byte := self at: index + 7) = 0 ifFalse: [
			^(LargePositiveInteger new: 8)
				replaceFrom: 1 to: 8 with: self startingAt: index;
				normalize ].
		(byte := self at: index + 6) = 0 ifFalse: [
			^(LargePositiveInteger new: 7)
				replaceFrom: 1 to: 7 with: self startingAt: index;
				normalize ].
		(byte := self at: index + 5) = 0 ifFalse: [
			^(LargePositiveInteger new: 6)
				replaceFrom: 1 to: 6 with: self startingAt: index;
				normalize ].
		(byte := self at: index + 4) = 0 ifFalse: [
			^(LargePositiveInteger new: 5)
				replaceFrom: 1 to: 5 with: self startingAt: index;
				normalize ].
		(byte := self at: index + 3) <= 16r3F ifFalse: [
			^(LargePositiveInteger new: 4)
				replaceFrom: 1 to: 4 with: self startingAt: index;
				normalize ].
		^(((byte bitShift: 8) + (self at: index + 2) bitShift: 8) + (self at: index + 1) bitShift: 8) + (self at: index) ].
	(byte := self at: index) = 0 ifFalse: [
		^(LargePositiveInteger new: 8)
			digitAt: 1 put: (self at: index + 7);
			digitAt: 2 put: (self at: index + 6);
			digitAt: 3 put: (self at: index + 5);
			digitAt: 4 put: (self at: index + 4);
			digitAt: 5 put: (self at: index + 3);
			digitAt: 6 put: (self at: index + 2);
			digitAt: 7 put: (self at: index + 1);
			digitAt: 8 put: byte;
			normalize ].
	(byte := self at: index + 1) = 0 ifFalse: [	
		^(LargePositiveInteger new: 7)
			digitAt: 1 put: (self at: index + 7);
			digitAt: 2 put: (self at: index + 6);
			digitAt: 3 put: (self at: index + 5);
			digitAt: 4 put: (self at: index + 4);
			digitAt: 5 put: (self at: index + 3);
			digitAt: 6 put: (self at: index + 2);
			digitAt: 7 put: byte;
			normalize ].
	(byte := self at: index + 2) = 0 ifFalse: [	
		^(LargePositiveInteger new: 6)
			digitAt: 1 put: (self at: index + 7);
			digitAt: 2 put: (self at: index + 6);
			digitAt: 3 put: (self at: index + 5);
			digitAt: 4 put: (self at: index + 4);
			digitAt: 5 put: (self at: index + 3);
			digitAt: 6 put: byte;
			normalize ].
	(byte := self at: index + 3) = 0 ifFalse: [	
		^(LargePositiveInteger new: 5)
			digitAt: 1 put: (self at: index + 7);
			digitAt: 2 put: (self at: index + 6);
			digitAt: 3 put: (self at: index + 5);
			digitAt: 4 put: (self at: index + 4);
			digitAt: 5 put: byte;
			normalize ].		
	(byte := self at: index + 4) <= 16r3F ifFalse: [
		^(LargePositiveInteger new: 4)
			digitAt: 1 put: (self at: index + 7);
			digitAt: 2 put: (self at: index + 6);
			digitAt: 3 put: (self at: index + 5);
			digitAt: 4 put: byte;
			normalize ].
	^(((byte bitShift: 8) + (self at: index + 5) bitShift: 8) + (self at: index + 6) bitShift: 8) + (self at: index + 7)
