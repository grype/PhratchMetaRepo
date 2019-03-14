Class {
	#name : #BaselineOfPhratchPoppyErgoJr,
	#superclass : #BaselineOf,
	#category : #BaselineOfPhratchPoppyErgoJr
}

{ #category : #baselines }
BaselineOfPhratchPoppyErgoJr >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				repository: 'http://smalltalkhub.com/mc/JLaval/PoppyErgoJr/main'.
			spec
				baseline: 'NeoJSON'
				with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
			spec package: 'PoppyErgoJr' with: [ spec requires: #('NeoJSON') ] ]
]
