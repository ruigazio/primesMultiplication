table = require "../../dist/table.js"

# testLines [n, expectedSize, expectedBottomRight]
tests = [
	[11, 6, 121]
	, [17, 8, 289]
	, [50, 16, 2209]
]

tests.forEach ([n, expectedSize, expectedBottomRight]) ->
	matrix = table n

	tableSize = matrix.length
	lastIdx = tableSize - 1

	conditions = [ tableSize == expectedSize
		, matrix[lastIdx].length == expectedSize
		, matrix[lastIdx][lastIdx] == expectedBottomRight
	]

	all = conditions.every (passed) -> passed
	if all
		console.info 'OK'
	else
		console.info 'FAIL'
