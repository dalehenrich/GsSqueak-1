private
installStrikeFont: aStrikeFont foregroundColor: foregroundColor backgroundColor: backgroundColor 
	| lastSourceDepth targetColor |
	sourceForm
		ifNotNil: [lastSourceDepth := sourceForm depth].
	sourceForm := aStrikeFont glyphs.
	"Ignore any halftone pattern since we use a color map approach here"
	halftoneForm := nil.
	sourceY := 0.
	height := aStrikeFont height.
	sourceForm depth = 1
		ifTrue: [self combinationRule: Form paint.
			(colorMap notNil
					and: [lastSourceDepth = sourceForm depth])
				ifFalse: ["Set up color map for a different source depth (color
					font) "
					"Uses caching for reasonable efficiency"
					colorMap := self cachedFontColormapFrom: sourceForm depth to: destForm depth.
					colorMap
						at: 1
						put: (destForm pixelValueFor: backgroundColor)].
			colorMap
				at: 2
				put: (destForm pixelValueFor: foregroundColor)]
		ifFalse: [(self class subPixelRenderFonts
					and: [foregroundColor = Color black
							or: ["Only use rgbMul with opaque colors as
								alpha values get lost for translucent
								colors. "
								self class subPixelRenderColorFonts
									and: [foregroundColor isOpaque]]])
				ifTrue: [destForm depth > 8
						ifTrue: ["rgbMul is equivalent to component alpha
							blend if text is black (only faster, hehe)"
							self combinationRule: Form rgbMul.
							colorMap := (destForm depth = 32
											or: [(foregroundColor = Color black) not])
										ifTrue: ["rgbMul / rgbAdd IS
											component alpha blend for
											any color of text (neat trick,
											eh!) "
											"This colorMap is to be used on
											the second pass with rule 20
											(rgbAdd) See
											#displayString:from:to:at:strikeFont:kern: "
											"Note: In 32bpp we always
											need the second pass, as the
											source could have transparent
											pixels, and we need to add to
											the alpha channel"
											self
												colorConvertingMap: foregroundColor
												from: sourceForm depth
												to: destForm depth
												keepSubPixelAA: true]]
						ifFalse: [self combinationRule: Form paint.
							targetColor := foregroundColor = Color black
										ifFalse: [foregroundColor].
							colorMap := self
										colorConvertingMap: targetColor
										from: sourceForm depth
										to: destForm depth
										keepSubPixelAA: true]]
				ifFalse: ["Do not use rule 34 for 16bpp display. TTCFont uses it,
					but it builds a glyphs cache for each color used!"
					self
						combinationRule: (destForm depth = 32
								ifTrue: [Form blendAlphaScaled]
								ifFalse: [Form paint]).
					colorMap := self
								colorConvertingMap: foregroundColor
								from: sourceForm depth
								to: destForm depth
								keepSubPixelAA: false]]