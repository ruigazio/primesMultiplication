knownPrimes = require "./knownPrimes.js"
genPrimes = require "../../dist/prime.coffee"

test = (name, n) ->
	arrayEqual = (a,b) ->
		if ! (a.length == b.length)
			return false

		i = 0
		while i < a.length && equal = a[i] == b[i]
			i++
		return equal

	if n > knownPrimes.upperBound
		console.log 'over the limit'
		return n

	console.log name, n
	method = eval 'genPrimes' + '.' + name
	console.time name
	result = method n
	console.timeEnd name
	known = knownPrimes.under n
	console.log arrayEqual result, known

i = Math.floor knownPrimes.upperIndex / 50
l = knownPrimes.firstMillion[i]

test 'divisor', l
test 'eratosthenes', knownPrimes.upperBound
