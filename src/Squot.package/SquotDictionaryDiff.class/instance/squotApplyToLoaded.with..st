patching
squotApplyToLoaded: anObject with: aMetaobjectPatcher
	"Modify anObject such that it matches what I model"
	self shouldBeImplemented.
	changedInstVars keysAndValuesDo: [:instVarName :diff |
		anObject
			instVarNamed: instVarName
			put: (diff squotApplyToLoaded: (anObject instVarNamed: instVarName))].
	^ anObject