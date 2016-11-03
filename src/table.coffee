prime = require "./prime.coffee"


table = (tableSize) ->
	## FUNCTIONS ##
	fill = (i) ->
		a = listPrimes[i]
		i++

		currentLine = matrix[i]
		currentLine.push a*a

		j = i + 1
		while i < tableSize
			b = listPrimes[i]
			m = a * b
			currentLine.push m
			matrix[j].push m
			i++
			j++
		null
	## END FUNCTIONS ##

	console.time 'divisor'
	listPrimes = prime.divisor tableSize
	console.timeEnd 'divisor'
	lastPrime = listPrimes[tableSize - 1]

	console.time 'table'
	header = [0]
	matrix = [header]
	listPrimes.forEach (p) ->
		header.push p
		matrix.push [p]

	i=0
	while i < tableSize - 1
		fill i
		i++

	matrix[tableSize].push lastPrime * lastPrime
	console.timeEnd 'table'
	matrix
	
module.exports = table
