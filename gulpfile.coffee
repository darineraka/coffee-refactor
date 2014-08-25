gulp = require 'gulp'
plumber = require 'gulp-plumber'
browserify = require 'gulp-browserify'
replaceExt = require 'gulp-ext-replace'
debug = require 'gulp-debug'

gulp.task 'browserify', ->
  gulp
  .src 'src/ripper.coffee', read: false
  .pipe plumber()
  .pipe browserify
    transform: [ 'coffeeify' ]
    extensions: [ '.coffee' ]
  .pipe replaceExt '.js'
  .pipe gulp.dest 'lib'

# gulp.task 'test', ->

gulp.task 'watch', ->
  gulp.watch 'src/**/*', [ 'browserify' ]
  # gulp.watch files.test, [ 'spec' ]

gulp.task 'default', [
  'browserify'
  # 'test'
  'watch'
]