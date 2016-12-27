Class {
	#name : #ConfigurationOfPhratchPoppyErgoJr,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfPhratchPoppyErgoJr
}

{ #category : #'development support' }
ConfigurationOfPhratchPoppyErgoJr class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfPhratchPoppyErgoJr class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfPhratchPoppyErgoJr class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfPhratchPoppyErgoJr class >> ensureMetacelloBaseConfiguration [

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
ConfigurationOfPhratchPoppyErgoJr class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfPhratchPoppyErgoJr class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfPhratchPoppyErgoJr class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfPhratchPoppyErgoJr class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfPhratchPoppyErgoJr class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfPhratchPoppyErgoJr class >> validate [
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
ConfigurationOfPhratchPoppyErgoJr >> baseline10: spec [
	<version:'1.0-baseline'>
	spec for: #common do: [
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/JLaval/PoppyErgoJr/main'.
		
			spec project: 'NeoJSON' with: [
				spec 
					className: 'ConfigurationOfNeoJSON';
					file: 'ConfigurationOfNeoJSON' ;
					version: #stable;
					repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main'.
			].
		
			spec package: 'PoppyErgoJr' with: [ 
				spec requires: #('NeoJSON')
			].
	].
]

{ #category : #accessing }
ConfigurationOfPhratchPoppyErgoJr >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #accessing }
ConfigurationOfPhratchPoppyErgoJr >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #accessing }
ConfigurationOfPhratchPoppyErgoJr >> version10: spec [
	<version:'1.0' imports: #('1.0-baseline' )>
	spec for: #common do: [
			spec repository: 'http://smalltalkhub.com/mc/JLaval/PoppyErgoJr/main'.
			spec
				package: 'PoppyErgoJr'.
			spec
				project: 'NeoJSON' with: #stable.
	]
]
