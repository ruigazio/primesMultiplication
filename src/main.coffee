tableGenerator = require "./table.coffee"


renderer = (domTarget, table) ->
	## FUNCTIONS ##
	buildLine = (line) ->
		node = document.createElement 'tr'
		line.forEach (p) ->
			td = document.createElement 'td'
			text = document.createTextNode p
			td.appendChild text
			node.appendChild td
		node


	buildDomTable = () ->
		node = document.createElement 'table'
		table.forEach (line) ->
			node.appendChild buildLine line
		node
	## END FUNCTIONS ##

	domTarget.innerHTML = ''

	console.time 'render'
	$table = buildDomTable table
	console.timeEnd 'render'

	domTarget.appendChild $table

updater = (renderer, n) ->
	mark = performance.now()
	setTimeout () ->
		time = performance.now() - mark
		console.log 'browser', time
	renderer produceTable n

produceTable = (n) ->
	console.info 'starting with N: ' + n
	table = tableGenerator n
	table

document.addEventListener 'DOMContentLoaded', ->
	$table = document.querySelector '#table'
	$input = document.querySelector '#primesLimit'
	render = renderer.bind this, $table
	update = updater.bind this, render
	update 3
	$input.addEventListener 'change', (e) ->
		console.info 'input changed'
		update e.target.value
	, false
, false

