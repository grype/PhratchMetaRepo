Class {
	#name : #BaselineOfArduinoForPhratch,
	#superclass : #BaselineOf,
	#category : #BaselineOfArduinoForPhratch
}

{ #category : #baselines }
BaselineOfArduinoForPhratch >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'http://smalltalkhub.com/mc/JLaval/Arduino/main'.
			spec
				project: 'FFI'
				with: [ spec
						className: 'ConfigurationOfFFI';
						file: 'ConfigurationOfFFI';
						version: #stable;
						repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main' ].
			spec
				project: 'OSProcess'
				with: [ spec
						className: 'ConfigurationOfProcessWrapper';
						version: #stable;
						repository: 'http://www.smalltalkhub.com/mc/hernan/ProcessWrapper/main' ].
			spec
				package: 'CTranslator'
				with: [ spec requires: #('FFI' 'OSProcess') ].
			spec
				package: 'Arduino-Core'
				with: [ spec requires: #('CTranslator') ].
			spec
				package: 'Arduino-Compiler'
				with: [ spec requires: #('Arduino-Core') ].
			spec
				package: 'PhratchArduino'
				with: [ spec requires: #('Arduino-Core') ] ]
]
