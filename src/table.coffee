prime = require "./prime.coffee"

table = (tableSize) ->
	## FUNCTIONS ##
	fill = (i) ->
		a = listPrimes[i++]
		colIdx = i
		currentLine = matrix[i]
		currentLine[i] = a*a

		while i < tableSize
			b = listPrimes[i++]
			m = a * b
			currentLine[i] = m
			matrix[i][colIdx] = m
		null
	## END FUNCTIONS ##

	console.time 'divisor'
	listPrimes = prime.divisor tableSize
	console.timeEnd 'divisor'

	console.time 'table'
	lineSize = tableSize + 1
	matrix = new Array lineSize
	matrix[0] = new Array lineSize
	header = matrix[0]
	header[0] = ' '
	i=0
	while i < tableSize
		p = listPrimes[i++]
		header[i] = p
		matrix[i] = new Array lineSize
		matrix[i][0] = p

	i=0
	while i < tableSize - 1
		fill i++

	lastPrime = listPrimes[tableSize - 1]
	matrix[tableSize][tableSize] = lastPrime * lastPrime
	console.timeEnd 'table'
	matrix
	
module.exports = table
