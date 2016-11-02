permutation = require "./permutation.coffee"
prime = require "./prime.coffee"


table = (n) ->
	## FUNCTIONS ##
	fill = (i, p) ->
		[a,b] = list[p]
		currentLine = matrix[i]
		currentLine.push a*a
		j = i+1
		while j <= tableSize
			[a,b] = list[p]
			m = a * b
			currentLine.push m
			matrix[j].push m
			j++
			p++
		p
	## END FUNCTIONS ##

	console.time 'divisor'
	listPrimes = prime.divisor n
	console.timeEnd 'divisor'
	tableSize = listPrimes.length
	console.log 'tableSize', tableSize
	lastPrime = listPrimes[tableSize - 1]

	console.time 'permutations '
	list = permutation listPrimes
	console.timeEnd 'permutations '

	console.time 'table'
	header = [0]
	matrix = [header]
	listPrimes.forEach (p) ->
		header.push p
		matrix.push [p]

	i=1
	p = 0
	while i < tableSize
		p = fill i, p
		i++

	matrix[tableSize].push lastPrime * lastPrime
	console.timeEnd 'table'
	matrix
	

#OK
#  table 3636
#  table 3406
#drastic slowdown
#  table 3637
#  table 3407

module.exports = table
