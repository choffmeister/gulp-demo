gulp = require("gulp")
config = require("../config")
bower = require("gulp-bower-files")

gulp.task "vendor", ->
  bower()
    .pipe(gulp.dest(config.dest + "vendor"))
