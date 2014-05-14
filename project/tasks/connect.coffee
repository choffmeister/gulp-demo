gulp = require("gulp")
config = require("../config")
connect = require("gulp-connect")

gulp.task "connect", ->
  connect.server
    root: config.dest
    livereload: true
