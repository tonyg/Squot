applying
prepareSave
	| patchBuilder |
	^ self withUnitOfWorkActive:
	[patchBuilder := self workingCopy baseVersion newPatchBuilder.
	loadedPatch diffsDo: [:each | patchBuilder addDiff: each].
	self saveOperation
		patch: patchBuilder buildPatch;
		author: pickedVersion author;
		timestamp: pickedVersion timestamp;
		unitOfWork: self unitOfWork;
		yourself]