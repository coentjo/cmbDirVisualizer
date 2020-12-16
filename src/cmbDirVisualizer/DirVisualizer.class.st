Class {
	#name : #DirVisualizer,
	#superclass : #Object,
	#instVars : [
		'defaultDir',
		'skipDirectories',
		'fileColors',
		'skipFiles'
	],
	#category : #cmbDirVisualizer
}

{ #category : #'instance creation' }
DirVisualizer class >> startInDirectory: aDirectoryString [
	^ self new
		defaultDir: aDirectoryString 
		"askUserForDirWithDefault: aDirectoryString ; " 
		yourself .

]

{ #category : #config }
DirVisualizer >> askUserForDirWithDefault: aDirectoryOrString [ 
	self defaultDir: 
		((UIManager default 
			chooseDirectory: 'Choose directory' 
			path: aDirectoryOrString ) 
				ifNil: [ aDirectoryOrString  ]). 

]

{ #category : #config }
DirVisualizer >> askUserToBrowse: aAskUser [ 
	aAskUser ifTrue: [ 
		self askUserForDirWithDefault: self defaultDir ]
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_1 [
	<gtExample>
| b c1 c2 |
b := RTSunburstBuilder new.
c2 := Color r: 177 / 255.0 g: 175 / 255.0 b: 134 / 255.0.
c1 := Color r: 98 / 255.0 g: 101 / 255.0 b: 73 / 255.0.
b interaction addInteraction: RTSBFadeInteraction new.
b
	color: c2;
	angularSpacing: 1;
	radialSpacing: 5;
	leafWeight: [ :f | f size sqrt ];
	leafColor: c1;
	explore: TRPlatform current workingDirectory
		nesting: #directories
		leaves: #files.
b view canvas camera scale: 1.5.
^ b
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_2 [
	<gtExample>
	
	"UIManager default chooseDirectory printString"
	| fileReference |
	fileReference := '/Users/coen/OneDrive - Office 365 Fontys/mindjet/cmb2020/cohort202002/S1-Soft/docs/deelproducten_PD01/20200327.submissions' asFileReference  .
	"fileReference :=  TRPlatform current workingDirectory "
	
	^ self branchB_2_sunburstDir: fileReference 
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_2_sunburstDir: aFileRef [

| b c1 c2 |
b := RTSunburstBuilder new.
c2 := Color r: 177 / 255.0 g: 175 / 255.0 b: 134 / 255.0.
c1 := Color r: 98 / 255.0 g: 101 / 255.0 b: 73 / 255.0.
b interaction addInteraction: RTSBFadeInteraction new.
b
	color: c2;
	angularSpacing: 1;
	radialSpacing: 5;
	leafWeight: [ :f | f size sqrt ];
	leafColor: c1;
	explore: aFileRef
		nesting: #directories
		leaves: #files.
b view canvas camera scale: 1.5.
^ b
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_3 [
	<gtExample>
	
	"UIManager default chooseDirectory printString"
	| fileReference defaultDir |
	defaultDir := '/Users/coen/OneDrive - Office 365 Fontys/mindjet/cmb2020/cohort202002/S1-Soft/docs/deelproducten_PD01/20200403.submissions' .
	
	fileReference := UIManager default chooseDirectory: 'Kies portfolio directory' path: defaultDir .
	"fileReference :=  TRPlatform current workingDirectory . "
	
	^ self branchB_3_sunburstDir: fileReference 
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_3_sunburstDir: aFileRef [

| b c1 c2 |
b := RTSunburstBuilder new.
c2 := Color r: 177 / 255.0 g: 175 / 255.0 b: 134 / 255.0.
c1 := Color r: 98 / 255.0 g: 101 / 255.0 b: 73 / 255.0.
b interaction addInteraction: RTSBFadeInteraction new.
b
	color: c2;
	angularSpacing: 1;
	radialSpacing: 5;
	leafWeight: [ :f | f size sqrt ];
	leafColor: [ :model | model whichColor ] ;
	explore: aFileRef
		nesting: #directories
		leaves: #files.
b view canvas camera scale: 1.5.
^ b
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_4 [
	<gtExample>
	
	"UIManager default chooseDirectory printString"
	| fileReference defaultDir |
	defaultDir := '/Users/coen/OneDrive - Office 365 Fontys/mindjet/cmb2020/cohort202002/S1-Soft/docs/deelproducten_PD04/20200407.submissions' .
	
	fileReference := UIManager default chooseDirectory: 'Kies portfolio directory' path: defaultDir .
	"fileReference :=  TRPlatform current workingDirectory "
	"self cleanUpPortfolioDir: fileReference ."
	
	^ self branchB_4_sunburstDir: fileReference 
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_4_sunburstDir: aFileRef [

| b  |
b := RTSunburstBuilder new.
"c2 := Color r: 177 / 255.0 g: 175 / 255.0 b: 134 / 255.0."
b interaction addInteraction: RTSBFadeInteraction new.
b
	color: Color darkGray ;
	angularSpacing: 1;
	radialSpacing: 5;
	leafWeight: [ :f | f size sqrt ];
	leafColor: [ :model | model whichColor ] ;
		explore: aFileRef
		nesting: [ :aTree | 
			| dirs |
			dirs := aTree directories .
			dirs := dirs select: [ :dir | 
				(
					#( '.vs' 'obj' 'bin' 'Properties' 'Resources' 'Images' ) anySatisfy: [ :each | each = dir basename ] 
				) not  ] .
			dirs ] 
		leaves: [ :aFile | aFile files ].
b view canvas camera scale: 1.5.
^ b
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_5 [
	<gtExample>
	
	"UIManager default chooseDirectory printString"
	| fileReference defaultDir |
	defaultDir := '/Users/coen/OneDrive - Office 365 Fontys/mindjet/cmb2020/cohort202002/S1-Soft/docs/deelproducten_PD04/20200407.submissions' .
	
	fileReference := UIManager default chooseDirectory: 'Kies portfolio directory' path: defaultDir .
	"fileReference :=  TRPlatform current workingDirectory "
	"self cleanUpPortfolioDir: fileReference ."
	
	^ self 
		branchB_5_sunburstDir: fileReference 
		skipDirectories: #( '.vs' 'obj' 'bin' 'Properties' 'Resources' 'Images' )
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_5_sunburstDir: aFileRef skipDirectories: skipDirectories [

| b  |
b := RTSunburstBuilder new.
"c2 := Color r: 177 / 255.0 g: 175 / 255.0 b: 134 / 255.0."
b interaction addInteraction: RTSBFadeInteraction new.
b
	color: Color darkGray ;
	angularSpacing: 1;
	radialSpacing: 5;
	leafWeight: [ :f | f size sqrt ];
	leafColor: [ :model | model whichColor ] ;
		explore: aFileRef
		nesting: [ :aTree | 
			| dirs |
			dirs := aTree directories .
			dirs := dirs select: [ :dir | 
				(
					skipDirectories anySatisfy: [ :each | each = dir basename ] 
				) not  ] .
			dirs ] 
		leaves: [ :aFile | aFile files ].
b view canvas camera scale: 1.5.
^ b
]

{ #category : #'as yet unclassified' }
DirVisualizer >> branchB_6 [
	<gtExample>


	"Kies 'basis-directory' en stel in of je nog wilt FileBrowsen: "
^	(DirVisualizer startInDirectory:  
	 '/Users/coen/OneDrive - Office 365 Fontys/mindjet/cmb2020/cohort202002/S1-Soft/docs' asFileReference 
		/ 'deelproducten_PD01'
		/ '20200408.submissions'
	) 
		askUserToBrowse: true ;

	"Welke directories moeten geskipt worden? (let op de puntkomma!)"
	skipDirectories: 'bin' ;
	skipDirectories:  'obj' ;
	skipDirectories:  'debug' ;
	skipDirectories:  'Properties' ;
	skipDirectories:  'Resources' ;
	skipDirectories:  '.vs' ;

	skipFiles: '*.resx' ;		skipFiles: 'App.config' ;	
	skipFiles: '*.png' ;		skipFiles: '*.jpg' ;		skipFiles: '*.jfif' ;
	
	forFiles: '*.Designer.cs' use: Color darkGray   ;
	forFiles: '*.cs' use: Color blue  ;
	forFiles: '*.csproj' use: Color red ;
	forFiles: '*.sln' use: Color yellow ;
	forFiles: '*.vs' use: Color green ;

	reallyDeleteSkippedDirectories: false ;
	visualize 

]

{ #category : #accessing }
DirVisualizer >> branchB_6_visualize [
	| b |
	"b := RTHorizontalTreeLayout new."
	b := RTSunburstBuilder new.
	"c2 := Color r: 177 / 255.0 g: 175 / 255.0 b: 134 / 255.0."
	b interaction addInteraction: RTSBFadeInteraction new.
	b
		color: Color darkGray;
		borderColor: [ :x | Color black ] ;
		angularSpacing: 1;
		radialSpacing: 5;
		leafWeight: [ :f | f size sqrt ];
		leafColor: [ :model | model whichColor: self fileColors ];
		explore: self defaultDir
			nesting: [ :aTree | 
			| dirs |
			dirs := aTree directories.
			dirs := dirs
				reject:
					[ :dir | self skipDirectories anySatisfy: [ :each | each = dir basename ] ].
			dirs sortAscending: [ :file | file ageOfFileInWholeDays   ] ]
			leaves: [ :aDir | 
				aDir files
					reject: [ :file | self skipFiles anySatisfy: [ :each | each match: file basename ] ] ].
	b view canvas camera scale: 1.5.
	^ b
]

{ #category : #config }
DirVisualizer >> defaultDir [
	^ defaultDir
		ifNil: [ defaultDir := TRPlatform current workingDirectory ]
]

{ #category : #config }
DirVisualizer >> defaultDir: aDirStringOrFileRef [ 
	defaultDir := aDirStringOrFileRef asFileReference  .
]

{ #category : #config }
DirVisualizer >> fileColors [
	^ fileColors 
		ifNil: [ fileColors := Dictionary new ]
]

{ #category : #config }
DirVisualizer >> forFiles: aString use: aColor [ 
	self fileColors add: aString -> aColor 
]

{ #category : #cleanup }
DirVisualizer >> reallyDeleteSkippedDirectories: aBoolean [  
	aBoolean ifTrue: 
		[ defaultDir cleanUpPortfolio ]
]

{ #category : #config }
DirVisualizer >> skipDirectories [
	^ skipDirectories ifNil: [ skipDirectories  := OrderedCollection new ]
]

{ #category : #config }
DirVisualizer >> skipDirectories: aDirName [
	self skipDirectories add: aDirName
]

{ #category : #config }
DirVisualizer >> skipFiles [
	^ skipFiles 
		ifNil: [ skipFiles := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
DirVisualizer >> skipFiles: aFilePattern [ 
	self skipFiles add: aFilePattern 
]

{ #category : #action }
DirVisualizer >> visualize [
	"so 'visualize' can be used all the time, 
	while the underlying visualizing method can be changed by changing: "
	^ self branchB_6_visualize 
]

{ #category : #'as yet unclassified' }
DirVisualizer >> visualizerExample [
	<gtExample>

	"self new visualizerExample inspect"

| v shape es allElements |
v := RTView new.
v @ RTDraggableView .
shape := RTCompositeShape new.
shape add: RTLabel new.
shape add: RTBox new.
allElements := RTShape withAllSubclasses.
es := shape elementsOn: allElements  "RTShape withAllSubclasses" .
v addAll: es.
RTEdgeBuilder new
	view: v;
	objects: allElements ;
	shape:
		(RTArrowedLine new
			color: Color black;
			attachPoint:
				(RTShorterDistanceAttachPointAndCompositeShape new
					composedShapeSelection: #second));
	connectFrom: #superclass to: #yourself.
RTNest new
	for: es
	inShape: #second
	add: [ :group :model | 
		group
			addAll: ((RTBox new color: Color blue) elementsOn: model rtmethods).
		RTGridLayout on: group ]. 
RTHorizontalTreeLayout on: es.
es @ RTPopup @ RTDraggable.
^ v
]

{ #category : #'as yet unclassified' }
DirVisualizer >> visualizerExample2 [
	<gtExample>
	"self new visualizerExample inspect"

| v shape es allElements |
v := RTView new.
v @ RTDraggableView .
shape := RTCompositeShape new.
shape add: RTLabel new.
shape add: RTBox new.
allElements := RTShape withAllSubclasses.
es := shape elementsOn: allElements  .
v addAll: es.
RTEdgeBuilder new
	view: v;
	objects: allElements ;
	shape:
		(RTArrowedLine new
			color: Color black;
			attachPoint:
				(RTShorterDistanceAttachPointAndCompositeShape new
					composedShapeSelection: #second));
	connectFrom: #superclass to: #yourself.
RTNest new
	for: es
	inShape: #second
	add: [ :group :model | 
		group
			addAll: ((RTBox new color: Color blue) elementsOn: model rtmethods).
		RTGridLayout on: group ]. 
RTHorizontalTreeLayout on: es.
es @ RTPopup @ RTDraggable.
^ v
]
