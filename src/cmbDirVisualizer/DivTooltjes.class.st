Class {
	#name : #DivTooltjes,
	#superclass : #Object,
	#category : #cmbDirVisualizer
}

{ #category : #'as yet unclassified' }
DivTooltjes >> listSplitter [
	<gtExample>

| listNiki listNikiSeparated |
listNiki :=  '3214 

7958

1555

5693

7098 ' .
listNikiSeparated := [:c| c = ' ' ] split: listNiki .
^ listNikiSeparated
]
