knownPrimes = require "./knownPrimes.js"
primeGenerator = require "../src/prime.coffee"

compareUsing = (name, n) ->
	matchWithKnown = (a) ->
		i = 0
		while i < a.length && a[i] == firstMillion[i]
			i++
		return i == a.length

	firstMillion = knownPrimes.firstMillion
	method = eval 'primeGenerator' + '.' + name
	console.time name
	result = method n
	console.timeEnd name
	matchWithKnown result

test = (args) ->
	if args.length > 1
		n = args[1]
		if n > knownPrimes.upperIndex + 1
			console.log 'over the limit'
			return n
		ok = compareUsing 'divisor', n
	else
		console.log 'testing the first million'
		ok = compareUsing 'divisor', 1000000

	console.log if ok then 'OK' else 'FAIL'

module.exports = test
