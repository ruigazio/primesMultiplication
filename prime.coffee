(knownPrimes = require "./knownPrimes.js") && 0


divisor = (n) ->
	## FUNCTIONS ##
	isPrime = (n) ->
		pList = allLowerPrimes.slice()
		nextPrime = pList.shift()
		prime = true
		sqRooted = Math.sqrt n
		while pList.length && nextPrime <= sqRooted
			if !( n % nextPrime)
				prime = false
				break
			nextPrime = pList.shift()
		return prime

	## END FUNCTIONS ##

	allLowerPrimes = [2]
	i = 3
	while i <= n
		if isPrime i, allLowerPrimes
			allLowerPrimes.push i
		i++

	return allLowerPrimes
divisor.name = 'divisor'

eratosthenes = (n) ->
	## FUNCTIONS ##
	markMultiples = (m) ->
		i = m
		while (i <= n)
			notPrimes[i] = true
			i += m

	## END FUNCTIONS ##
	notPrimes = new Array n
	primes = []

	i = 2
	while i<= n
		if notPrimes[i] != true
			primes.push i
			markMultiples i
		i++
	
	return primes

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
	method = eval name
	console.time name
	result = method n
	console.timeEnd name
	known = knownPrimes.under n
	console.log arrayEqual result, known

# test 'eratosthenes', knownPrimes.upperBound

i = Math.floor knownPrimes.upperIndex / 50
l = knownPrimes.firstMillion[i]
test 'divisor', l
test 'eratosthenes', knownPrimes.upperBound

###
module.exports =
	divisor: divisor
	eratosthenes: eratosthenes
	knownPrimes: knownPrimes
	test: test

###
