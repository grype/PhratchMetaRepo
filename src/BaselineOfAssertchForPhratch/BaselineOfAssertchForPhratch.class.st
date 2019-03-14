Class {
	#name : #BaselineOfAssertchForPhratch,
	#superclass : #BaselineOf,
	#category : #BaselineOfAssertchForPhratch
}

{ #category : #baselines }
BaselineOfAssertchForPhratch >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'http://smalltalkhub.com/mc/tomooda/Assertch/main'.
			spec package: 'Assertch-Core'.
			spec
				package: 'Assertch-Extra'
				with: [ spec requires: #('Assertch-Core') ] ]
]
