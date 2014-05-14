gulp = require("gulp")
config = require("../config")

gulp.task "watch", ->
  gulp.watch config.src + "coffee/**/*.coffee", ["coffee"]
  gulp.watch config.src + "less/**/*.less", ["less"]
  gulp.watch config.src + "jade/**/*.jade", ["jade"]
  return null
