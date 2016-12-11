Class {
	#name : #ConfigurationOfArduinoForPhratch,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfArduinoForPhratch
}

{ #category : #'development support' }
ConfigurationOfArduinoForPhratch class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfArduinoForPhratch class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfArduinoForPhratch class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfArduinoForPhratch class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfArduinoForPhratch class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfArduinoForPhratch class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfArduinoForPhratch class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfArduinoForPhratch class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfArduinoForPhratch class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfArduinoForPhratch class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #accessing }
ConfigurationOfArduinoForPhratch >> baseline10: spec [
	<version:'1.0-baseline'>
	spec for: #common do: [
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/JLaval/Arduino/main'.
			
			spec project: 'FFI' with: [
				spec 
					className: 'ConfigurationOfFFI';
					file: 'ConfigurationOfFFI' ;
					version: #stable;
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main'.
			].
		
			spec project: 'OSProcess' with: [
				spec 
					className: 'ConfigurationOfProcessWrapper';
					version: #stable;
					repository: 'http://www.smalltalkhub.com/mc/hernan/ProcessWrapper/main'.
			].

			spec package: 'CTranslator' with: [ 
				spec requires: #('FFI' 'OSProcess')
			].
		
			spec package: 'Arduino-Core' with: [ 
				spec requires: #('CTranslator')
			].
		
			spec package: 'Arduino-Compiler' with: [ 
				spec requires: #('Arduino-Core')
			].
		
			spec package: 'PhratchArduino' with: [ 
				spec requires: #('Arduino-Core')
			].
	].
]

{ #category : #accessing }
ConfigurationOfArduinoForPhratch >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #accessing }
ConfigurationOfArduinoForPhratch >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #accessing }
ConfigurationOfArduinoForPhratch >> version10: spec [
	<version:'1.0' imports: #('1.0-baseline' )>
	spec for: #common do: [
			spec repository: 'http://smalltalkhub.com/mc/JLaval/Arduino/main'.
			spec
				package: 'CTranslator';
				package: 'Arduino-Core';
				package: 'Arduino-Compiler';
				package: 'PhratchArduino'.
			spec
				project: 'FFI' with: '1.4-baseline';
				project: 'OSProcess' with: #stable.
	]
]
