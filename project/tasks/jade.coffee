gulp = require("gulp")
config = require("../config")
connect = require("gulp-connect")
jade = require("gulp-jade")

gulp.task "jade", ->
  gulp.src(config.src + "jade/**/*.jade")
    .pipe(jade(
      pretty: config.debug
    ))
    .pipe(gulp.dest(config.dest))
    .pipe(connect.reload())
