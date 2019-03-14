Class {
	#name : #BaselineOfEducationalTable,
	#superclass : #BaselineOf,
	#category : #BaselineOfEducationalTable
}

{ #category : #baselines }
BaselineOfEducationalTable >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'github://grype/phratch:import'.
			spec package: 'PhratchEducationalBureau' ]
]
