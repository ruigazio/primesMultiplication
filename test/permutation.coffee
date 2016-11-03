permutation = require "../src/permutation.coffee"

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

matchLength = (n) ->
	combs = permNoRep n, 2
	console.log 'combinations', combs
	console.time 'result'
	result = permutation [1..n]
	console.timeEnd 'result'
	result.length == combs 

doTest = (args) ->
	if args.length > 1
		ok = matchLength args[1]
	else
		ok = matchLength 3000
	console.log if ok then 'OK' else 'FAIL'

module.exports = doTest
