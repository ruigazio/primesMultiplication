knownPrimes = require "./knownPrimes.js"
genPrimes = require "../src/prime.coffee"

test = (name, n) ->
	matchWithKnown = (a) ->
		i = 0
		while i < a.length && a[i] == firstMillion[i]
			i++
		return i == a.length

	if n > knownPrimes.length
		console.log 'over the limit'
		return n

	firstMillion = knownPrimes.firstMillion
	method = eval 'genPrimes' + '.' + name
	console.time name
	result = method n
	console.timeEnd name
	if matchWithKnown result
		console.log 'OK'
	else
		console.log 'FAIL'

test 'divisor', 1000000
#test 'eratosthenes', knownPrimes.upperBound
