initialize-release
classListFrame: bottomFraction fromTop: topFraction fromLeft: leftFraction width: rightFraction
	^LayoutFrame new
		leftFraction: leftFraction offset: 0;
		topFraction: topFraction offset: 0;
		rightFraction: (leftFraction + rightFraction) offset: 0;
		bottomFraction: bottomFraction offset: self buttonHeight negated