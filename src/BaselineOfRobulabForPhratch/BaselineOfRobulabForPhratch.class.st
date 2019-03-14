Class {
	#name : #BaselineOfRobulabForPhratch,
	#superclass : #BaselineOf,
	#category : #BaselineOfRobulabForPhratch
}

{ #category : #baselines }
BaselineOfRobulabForPhratch >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'github://grype/phratch:import'.
			spec
				project: 'Robulab'
				with: [ spec
						className: 'ConfigurationOfPureNG';
						file: 'ConfigurationOfPureNG';
						version: #bleedingEdge;
						repository: 'http://smalltalkhub.com/mc/CAR/Robulab/main' ].
			spec package: 'PhratchPure' with: [ spec requires: #('Robulab') ] ]
]
