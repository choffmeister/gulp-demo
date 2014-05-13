# dependencies
gulp = require("gulp")
conditional = require("gulp-if")
rename = require("gulp-rename")
browserify = require("gulp-browserify")
coffeeify = require("coffeeify")
uglify = require("gulp-uglify")
less = require("gulp-less")
jade = require("gulp-jade")

# config
mode = "development"
sourceDir = "src"
targetDir = "target/" + mode

# tasks
gulp.task "coffee", -> gulp
  .src(sourceDir + "/coffee/main.coffee")
  .pipe(browserify(
    debug: true
    transform: [coffeeify]
    extensions: [".coffee"]
  ))
  .pipe(conditional(mode is "production", uglify()))
  .pipe(rename("main.js"))
  .pipe(gulp.dest(targetDir))

gulp.task "less", -> gulp
  .src(sourceDir + "/less/main.less")
  .pipe(less())
  .pipe(gulp.dest(targetDir))

gulp.task "jade", -> gulp
  .src(sourceDir + "/jade/**/*.jade")
  .pipe(jade())
  .pipe(gulp.dest(targetDir))

gulp.task "watch", ->
  gulp.watch sourceDir + "/coffee/**/*.coffee", ["coffee"]
  gulp.watch sourceDir + "/less/**/*.less", ["less"]
  gulp.watch sourceDir + "/jade/**/*.jade", ["jade"]
  return

# meta tasks
gulp.task "default", ["coffee", "less", "jade", "watch"]
