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
		do: [ spec repository: 'github://janniklaval/phratch'.
			spec package: 'PhratchObjStream' ]
]
