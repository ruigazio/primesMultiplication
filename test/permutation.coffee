permutation = require "../../build/permutation.js"

factorial = (n) ->
	if n == 1
		return 1
	if n == 2
		return 2
	[3..n].reduce (total, i) ->
		total*i
	, 2

factorialx = (n, p) ->
	if p < 2
		return Number.NaN

	c = n-p+1
	if c < 2
		return Number.NaN

	d = c+1
	[d..n].reduce (total, i) ->
		total*i
	, c

permNoRep = (n,p) ->
	if n == 2
		return 1
	(factorialx n, p) / (factorial p)

test = (n) ->
	combs = permNoRep n, 2
	console.log 'combinations', combs
	console.time 'result'
	result = permutation [1..n]
	console.timeEnd 'result'
	console.log result.length == combs

test 5000
