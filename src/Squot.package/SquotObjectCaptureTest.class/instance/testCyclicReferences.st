testing
testCyclicReferences
	| subject shadow |
	subject := Array new: 1.
	subject at: 1 put: subject.
	shadow := capturer captureStandalone: subject.
	self assert: shadow slots size = 1.
	self assert: (shadow slots at: 1) value undecorated == shadow undecorated.