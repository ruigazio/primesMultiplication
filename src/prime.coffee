divisor = (n) ->
	## FUNCTIONS ##
	isPrime = (c) ->
		i=0
		nextPrime = allLowerPrimes[i]
		prime = true
		sqRooted = Math.sqrt c
		while nextPrime <= sqRooted
			if !( c % nextPrime)
				prime = false
				break
			nextPrime = allLowerPrimes[++i]
		return prime

	## END FUNCTIONS ##

	allLowerPrimes = [2]
	i = 3
	primeCount = 1
	while primeCount < n
		if isPrime i
			allLowerPrimes.push i
			primeCount++
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
