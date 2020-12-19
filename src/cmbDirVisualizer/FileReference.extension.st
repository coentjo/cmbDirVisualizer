Extension { #name : #FileReference }

{ #category : #'*cmbDirVisualizer' }
FileReference >> ageOfFile [
	^ (Timespan
		starting: self fileTimestampForVisualizer 
		ending: DateAndTime now)asDuration )
]

{ #category : #'*cmbDirVisualizer' }
FileReference >> ageOfFileAsString [
	| when howLong |
	when := self fileTimestampForVisualizer asDate asString .
	howLong := self ageOfFileInWholeDays asString .
	^ '', howLong ,'d - ', when, ' - '
]

{ #category : #'*cmbDirVisualizer' }
FileReference >> ageOfFileInWholeDays [
	^ self ageOfFile asDays truncated
]

{ #category : #'*cmbDirVisualizer' }
FileReference >> cleanUpPortfolio [
	self ifTrue: [ 
		(self basename = '.vs' ) 
			ifTrue: [ 	
				Transcript crShow: ' - ', self basename  .
				self halt   ]
			ifFalse: [ 
				self allDirectories do: [ :subdir |
					Transcript crShow: subdir basename  .
					subdir cleanUpPortfolio ]  ]  ] 
]

{ #category : #'*cmbDirVisualizer' }
FileReference >> fileTimestampForVisualizer [
	^ self isDirectory 
		ifTrue:  [ self dirVisualizerTime ]
		ifFalse: [ self modificationTime ] 
]

{ #category : #'*cmbDirVisualizer' }
FileReference >> gtInspectorActionVisualizeReadme [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :composite | 
			| result |
			result := self grapherVisualizationFromFileName: self fullName.
			composite selection: result 
			 ];
		icon: GLMUIThemeExtraIcons glamorousGreenCircle;
		condition: [ self isFile and: [ self extension = 'txt' ] ];
		title: 'Visualize data'
]

{ #category : #'*cmbDirVisualizer' }
FileReference >> printOn: aStream [
	
	filesystem forReferencePrintOn: aStream.
	"filesystem printPath: path on: aStream"
	aStream 
		nextPutAll: self ageOfFileAsString ;
		nextPutAll: self basename
]

{ #category : #'*cmbDirVisualizer' }
FileReference >> whichColor [
	| dict | 
	dict := Dictionary 
		with: '*.cs' -> Color blue  
		with: '*.sln' -> Color red
		with: '*.csproj' -> Color yellow  
		with: '*.vs' -> Color green   .
	dict keysAndValuesDo: [ :key :value |
		( key match: self basename ) 
			ifTrue: [ ^ value  ] ] .
	^ Color r: 98 / 255.0 g: 101 / 255.0 b: 73 / 255.0 .
]

{ #category : #'*cmbDirVisualizer' }
FileReference >> whichColor: aDictionary [
	| baseColor |
	"First set the default: " 
	baseColor := Color r: 98 / 255.0 g: 101 / 255.0 b: 73 / 255.0 .
	aDictionary keysAndValuesDo: [ :key :value |
		( key match: self basename ) 
			ifTrue: [ baseColor := value  ] ] .
	^ baseColor adjustedForAge: self ageOfFileInWholeDays .
]
