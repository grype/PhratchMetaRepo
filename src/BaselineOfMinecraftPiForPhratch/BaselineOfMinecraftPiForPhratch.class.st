Class {
	#name : #BaselineOfMinecraftPiForPhratch,
	#superclass : #BaselineOf,
	#category : #BaselineOfMinecraftPiForPhratch
}

{ #category : #baselines }
BaselineOfMinecraftPiForPhratch >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'http://ss3.gemstone.com/ss/minecraft'.
			spec package: 'Minecraft-Pi-Base'.
			spec
				package: 'Minecraft-Pi-Demo'
				with: [ spec requires: #('Minecraft-Pi-Base') ].
			spec repository: 'github://grype/phratch:import'.
			spec
				package: 'MinecraftPhratch'
				with: [ spec requires: #('Minecraft-Pi-Base') ] ]
]
