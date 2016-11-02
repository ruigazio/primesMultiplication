perm = (list) ->
	## FUNCTIONS ##
	pair = (i, accum, n) ->
		accum.push [i, n]
		return accum
	## END FUNCTIONS ##

	accum = []
	l =  list.slice()

	p = l.shift()
	while l.length
		pairHead = pair.bind this, p
		l.reduce pairHead, accum
		p = l.shift()
	accum
		
module.exports = perm
