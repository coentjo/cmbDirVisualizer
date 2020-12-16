Extension { #name : #Color }

{ #category : #'*cmbDirVisualizer' }
Color >> adjustedForAge: aAge [
	| r g b |
	"inspi came from >>darker"
	r := self red .
	g := self green .
	b := self blue .
	(aAge // 7) truncated timesRepeat: [
		r := r * 2 / 3 .
		g := g * 2 / 3 .
		b := b * 2 / 3 ] .
	^ Color r: r g: g b: b 
	
"	clr := self .
	^ clr adjustBrightness: ((aAge / 7 ) * -0.10 )"
]
