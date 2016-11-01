permutation = require "./permutation.coffee"
prime = require "./prime.coffee"


table = (n) ->
	## FUNCTIONS ##
	fill = (i) ->
		[a,b] = list[0]
		currentLine = matrix[i]
		currentLine.push a*a
		j = i+1
		while j < tableSize
			[a,b] = list.shift()
			m = a * b
			currentLine.push m
			matrix[j].push m
			j++
		null
	## END FUNCTIONS ##

	listPrimes = prime.eratosthenes n
	tableSize = listPrimes.length
	last = tableSize - 1
	lastPrime = listPrimes[last]
	console.log 'tableSize', tableSize
	list = permutation listPrimes

	i=0
	matrix = []

	while i < tableSize
		matrix.push []
		i++

	i=0
	while i < last
		#console.time i
		fill i
		#console.timeEnd i
		i++

	matrix[last].push lastPrime * lastPrime
	#console.log 'matrix', matrix
	#console.log 'perms', perms
	#console.log 'last prime', b
	#console.log 'last factor', matrix[limit][limit]
	matrix
	

console.time 'table'
#OK
#table 3636
#drastic slowdown
#table 3637
console.log table 11
console.timeEnd 'table'

module.exports = table
