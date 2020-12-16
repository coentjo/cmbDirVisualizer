Class {
	#name : #DivTooltjes,
	#superclass : #Object,
	#category : #cmbDirVisualizer
}

{ #category : #'as yet unclassified' }
DivTooltjes >> listSplitter [
	<gtExample>

| listNiki listNikiSeparated |
listNiki :=  '2983214

3677958

2521555

3615693

3517098 ' .
listNikiSeparated := [:c| c = ' ' ] split: listNiki .
^ listNikiSeparated
]
