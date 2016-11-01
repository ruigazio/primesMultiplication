tableGenerator = require "./table.coffee"


buildLine = (line) ->
	node = document.createElement 'tr'
	line.forEach (p) ->
		td = document.createElement 'td'
		text = document.createTextNode p
		td.appendChild text
		node.appendChild td
	node


buildTable = (table) ->
	node = document.createElement 'table'
	table.forEach (line) ->
		node.appendChild buildLine line
	node

document.addEventListener 'DOMContentLoaded', ->
	document.body.appendChild buildTable tableGenerator 71
, false
