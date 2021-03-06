tests
testResolveArtifactConflictWithIncomingRemoval
	| left right path artifact merge conflictNode |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: (left := SquotArtifactContentMock new).
	left diffBlock: [:otherMock | SquotArtifactContentDiffMock new].
	merge := SquotMerge
		into: (SquotSnapshot builder
				add: (artifact copy content: (right := SquotArtifactContentMock new));
				buildSnapshot)
		merge: (SquotSnapshot empty)
		basedOn: (SquotSnapshot builder
					add: artifact;
					buildSnapshot).
	self openToolAndTestOn: merge.
	self assert: tool rootNodes size = 1.
	(conflictNode := tool rootNodes anyOne) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool activateSelectedNode].
	self assert: (self resultDiffAt: path) isRemoval.