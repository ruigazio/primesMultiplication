gutil = require 'gutil'
gulp = require 'gulp'
coffee = require 'gulp-coffee'
replace = require 'gulp-replace'

gulp.task 'coffee', ->
	gulp.src './src/*.coffee'
	.pipe(coffee({bare: true}).on('error', gutil.log))
	.pipe replace '.coffee', '.js'
	.pipe gulp.dest './build/'

gulp.task 'js', ->
	gulp.src './src/*.js'
	.pipe gulp.dest './build/'

gulp.task 'tests', ['default'], ->
	gulp.src './test/*.coffee'
	.pipe(coffee({bare: true}).on('error', gutil.log))
	.pipe replace '.coffee', '.js'
	.pipe gulp.dest './test/build/'

	gulp.src './test/*.js'
	.pipe gulp.dest './test/build/'

gulp.task 'default', ['coffee','js']
