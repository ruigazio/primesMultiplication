permutation = require "./permutation.coffee"
prime = require "./prime.coffee"


table = (n) ->
	## FUNCTIONS ##
	fill = (i) ->
		[a,b] = list[0]
		currentLine = matrix[i]
		currentLine.push a*a
		j = i+1
		while j <= tableSize
			[a,b] = list.shift()
			m = a * b
			currentLine.push m
			matrix[j].push m
			j++
		null
	## END FUNCTIONS ##

	console.time 'eratosthenes '
	listPrimes = prime.eratosthenes n
	console.timeEnd 'eratosthenes '
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
	while i < tableSize
		#console.time i
		fill i
		#console.timeEnd i
		i++

	matrix[tableSize].push lastPrime * lastPrime
	console.timeEnd 'table'
	matrix
	

#OK
#table 3636
#drastic slowdown
#table 3637
#console.log table 11

module.exports = table
