Class {
	#name : #BaselineOfBlockEditor,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlockEditor
}

{ #category : #baselines }
BaselineOfBlockEditor >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'github://grype/phratch:import'.
			spec package: 'PhratchBlockeditor' ]
]
