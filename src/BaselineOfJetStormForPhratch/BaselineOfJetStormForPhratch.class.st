Class {
	#name : #BaselineOfJetStormForPhratch,
	#superclass : #BaselineOf,
	#category : #BaselineOfJetStormForPhratch
}

{ #category : #baselines }
BaselineOfJetStormForPhratch >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'http://smalltalkhub.com/mc/JLaval/JetStorm/main'.
			spec
				project: 'JetStorm'
				with: [ spec
						className: 'ConfigurationOfJetStorm';
						file: 'ConfigurationOfJetStorm';
						version: #bleedingEdge;
						repository: 'http://smalltalkhub.com/mc/JLaval/JetStorm/main' ].
			spec package: 'EV3Phratch' with: [ spec requires: #('JetStorm') ] ]
]
