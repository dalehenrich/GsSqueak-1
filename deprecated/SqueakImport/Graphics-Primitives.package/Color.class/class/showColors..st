examples
showColors: colorList
	"Display the given collection of colors across the top of the Display."

	| w r |
	w := Display width // colorList size.
	r := 0@0 extent: w@((w min: 30) max: 10).
	colorList do: [:c |
		Display fill: r fillColor: c.
		r := r translateBy: w@0].
