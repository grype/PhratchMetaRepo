Class {
	#name : #BaselineOfScratchLoader,
	#superclass : #BaselineOf,
	#category : #BaselineOfScratchLoader
}

{ #category : #baselines }
BaselineOfScratchLoader >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'github://grype/phratch:import'.
			spec package: 'PhratchObjStream' ]
]
