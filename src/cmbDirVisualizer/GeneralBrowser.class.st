Class {
	#name : #GeneralBrowser,
	#superclass : #Object,
	#category : #cmbDirVisualizer
}

{ #category : #'as yet unclassified' }
GeneralBrowser >> generalBrowserExample [
	<gtExample>
| browser |
browser := GLMFinder new
	variableSizePanes ;
	title: 'Software-Portfolio'.

browser show: [ :a |
	a list 
		when: #isDirectory;
		display: [ :each | 
			[ each children ]
				on: Exception  
				do: [ Array new ] ] ;
		format: #basenameWithIndicator.
		
	a text 
		when: #isFile ;
		display: [ :entry |
			[ entry readStream contents ]
				on: Exception  
				do: [ 'Can''t display the contents ot this file.' ] ]  ].

browser openOn: 
	'/Users/coen/DownloadsCanvas'  "	FileSystem disk root"
]
