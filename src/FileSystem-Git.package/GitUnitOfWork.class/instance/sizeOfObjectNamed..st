objects
sizeOfObjectNamed: aHash
	^ (self headerOfObjectNamed: aHash asHexHash) objectSize