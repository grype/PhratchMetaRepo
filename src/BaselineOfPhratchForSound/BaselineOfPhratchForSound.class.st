Class {
	#name : #BaselineOfPhratchForSound,
	#superclass : #BaselineOf,
	#category : #BaselineOfPhratchForSound
}

{ #category : #baselines }
BaselineOfPhratchForSound >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'github://grype/phratch:import'.
			spec
				project: 'Sound'
				with: [ spec
						className: 'ConfigurationOfPharoSound';
						file: 'ConfigurationOfPharoSound';
						version: #stable;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/Sound/main' ].
			spec package: 'PhratchSound' with: [ spec requires: #('Sound') ] ]
]
