t = [1..100]


f = (i, accum, n) ->
	accum.push [i, n]
	return accum

perm2 = (list) ->
	h = Math.floor (list.length - 1) / 2
	i = 0
	accum = []
	while i <= h
		g = f.bind this, list[i]
		list.reduce g, accum
		i++
	accum
		
perm = (list) ->
	accum = []
	i = list.shift()
	while list.length
		g = f.bind this, i
		list.reduce g, accum
		i = list.shift()
	accum
		
factorial = (n) ->
	if n == 1
		return 1
	if n == 2
		return 2
	[3..n].reduce (total, i) ->
		total*i
	, 2

permNoRep = (n,p) ->
	(factorial n) / (factorial n-p) / (factorial p)

console.log permNoRep 4, 2

console.time 'result'
result = perm [1..4]
console.timeEnd 'result'
console.log result.length

