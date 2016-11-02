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

#console.time 'eratosthenes'
#eratosthenes 1000000
#divisor 100000
#console.timeEnd 'eratosthenes'

module.exports =
	divisor: divisor
	eratosthenes: eratosthenes
