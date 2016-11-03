table = require '../src/table.coffee'
FileSystem = require 'fs'
StringBuilder = require 'string-builder'


writeFile = (fileName, buf) ->
	FileSystem.writeFile fileName, buf, (err) =>
		err && throw err
		console.log 'File saved'

toStringBuffer = (matrix) ->
	line = (l) ->
		sb.append '' + l[0]
		i=1
		while i < tableSize
			sb.append ',' + l[i]
			i++

		sb.append '\n'

	sb = new StringBuilder()
	i=0
	tableSize = matrix.length
	console.time 'string buffer'
	while i < tableSize
		line matrix[i]
		i++
	console.timeEnd  'string buffer'
	sb
	
toCsv = (n) ->
	b = toStringBuffer table n

	console.time 'write file'
	writeFile 'table.csv', b
	console.timeEnd  'write file'

module.exports = toCsv
