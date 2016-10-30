perm = (list) ->
	f = (i, accum, n) ->
		accum.push [i, n]
		return accum

	accum = []
	i = list.shift()
	while list.length
		g = f.bind this, i
		list.reduce g, accum
		i = list.shift()
	accum
		
module.exports = perm
