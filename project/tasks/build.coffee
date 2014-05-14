gulp = require("gulp")
config = require("../config")

gulp.task "build", ["coffee", "less", "jade"]
gulp.task "default", ["build", "connect", "watch"]
