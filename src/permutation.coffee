perm = (list) ->
	## FUNCTIONS ##
	pair = (p, i) ->
		while i < size
			a = list[i]
			accum.push [p, a]
			i++
	## END FUNCTIONS ##

	accum = []
	size = list.length

	i = 1
	j = 0
	while i < size
		p = list[j]
		pair p, i
		i++
		j++
	accum

module.exports = perm
