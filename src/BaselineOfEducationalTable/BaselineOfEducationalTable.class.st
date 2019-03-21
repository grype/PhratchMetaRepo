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
		do: [ spec repository: 'github://janniklaval/phratch'.
			spec package: 'PhratchEducationalBureau' ]
]
