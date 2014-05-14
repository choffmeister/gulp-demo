gulp = require("gulp")
config = require("../config")
connect = require("gulp-connect")
conditional = require("gulp-if")
rename = require("gulp-rename")
browserify = require("gulp-browserify")
uglify = require("gulp-uglify")

shim =
  jquery:
    path: "bower_components/jquery/dist/jquery.js"
    exports: null

gulp.task "coffee", ->
  gulp.src(config.src + "coffee/main.coffee", { read: false })
    .pipe(browserify(
      debug: config.debug
      extensions: [".coffee"]
      shim: shim
    ))
    .pipe(conditional(not config.debug, uglify()))
    .pipe(rename("main.js"))
    .pipe(gulp.dest(config.dest))
    .pipe(connect.reload())
