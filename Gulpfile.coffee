gutil            = require 'gutil'
gulp             = require 'gulp'
coffee           = require 'gulp-coffee'
replace          = require 'gulp-replace'
concat           = require 'gulp-concat'
webpack          = require 'webpack'
webpackDevServer = require "webpack-dev-server"

gulp.task 'coffee', ->
	gulp.src './src/*.coffee'
	.pipe(coffee({bare: true}).on('error', gutil.log))
	.pipe replace '.coffee', '.js'
	.pipe gulp.dest './dist/'

gulp.task 'js', ->
	gulp.src './src/*.js'
	.pipe gulp.dest './dist/'

gulp.task 'html', ->
	gulp.src 'src/*.html'
		.pipe gulp.dest 'dist/'

gulp.task 'css', ->
	gulp.src 'src/*.css'
		.pipe concat "bundle.css"
		.pipe gulp.dest 'dist/'

gulp.task "dev", ['coffee','js', 'html', 'css']

gulp.task 'webpack-dev-server', ['dev'], ->
	myConfig = require './webpack.config.coffee'
	gulp.watch ["src/**/*.css"], ['css']
	gulp.watch ["src/**/*.html"], ['html']
	console.log myConfig
	new webpackDevServer webpack(myConfig),
		watch: true
		publicPath: "/" # + myConfig.output.publicPath,
		contentBase: "dist" # + myConfig.output.publicPath,
		stats:
			colors: true
	.listen 8003, "localhost", (err) ->
		if err then throw new gutil.PluginError "webpack-dev-server", err
		gutil.log "[webpack-dev-server]", "http://localhost:8003/webpack-dev-server/index.html"

gulp.task 'default', ['webpack-dev-server']
