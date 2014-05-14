gulp = require("gulp")
config = require("../config")
connect = require("gulp-connect")
less = require("gulp-less")

gulp.task "less", ->
  gulp.src(config.src + "less/main.less")
    .pipe(less(
      compress: not config.debug
    ))
    .pipe(gulp.dest(config.dest))
    .pipe(connect.reload())
