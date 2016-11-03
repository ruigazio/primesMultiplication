table = require "../src/table.coffee"

# testLines [n, expectedBottomRight]
tests = [
	[11, 961]
	, [17, 3481]
	, [50, 52441]
]

all = ->
	tests.forEach ([n, expectedBottomRight]) ->
		matrix = table n

		conditions = [
			matrix.length == n + 1
			, matrix[n].length == n + 1
			, matrix[n][n] == expectedBottomRight
		]

		ok = conditions.every (passed) -> passed
		console.info if ok then 'OK' else 'FAIL'

doTest = (args) ->
	if args.length > 1
		console.log table args[1]
	else
		all()

module.exports = doTest
