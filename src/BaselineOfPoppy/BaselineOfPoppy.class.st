Class {
	#name : #BaselineOfPoppy,
	#superclass : #BaselineOf,
	#category : #BaselineOfPoppy
}

{ #category : #baselines }
BaselineOfPoppy >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				repository: 'http://smalltalkhub.com/mc/poppy/PoppyPhratch/main'.
			spec package: 'PhratchPoppy' ]
]
