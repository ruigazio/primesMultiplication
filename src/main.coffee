tableGenerator = require "./table.coffee"


renderer = (table) ->
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

	console.time 'render'
	tableNode = buildDomTable table
	console.timeEnd 'render'
	tableNode


updater = ($domTarget, $rendering, renderer, n) ->
	$rendering.style.visibility='visible'
	console.info 'starting with N: ' + n
	setTimeout () ->
		tableNode = renderer tableGenerator n
		console.time 'browser'
		setTimeout () ->
			$rendering.style.visibility='hidden'
			console.timeEnd 'browser'

		$domTarget.innerHTML = ''
		$domTarget.appendChild tableNode
	, 15

document.addEventListener 'DOMContentLoaded', ->
	$table = document.querySelector 'div#table'
	$input = document.querySelector 'input#primesLimit'
	$rendering = document.querySelector 'span#rendering'
	update = updater.bind this, $table, $rendering, renderer
	update 3
	$input.addEventListener 'change', (e) ->
		console.info 'input changed'
		update e.target.value
