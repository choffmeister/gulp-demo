# dependencies
gulp = require("gulp")
conditional = require("gulp-if")
rename = require("gulp-rename")
connect = require("gulp-connect")
browserify = require("gulp-browserify")
uglify = require("gulp-uglify")
less = require("gulp-less")
jade = require("gulp-jade")

# arguments
argv = require("yargs").argv

# shim
shim =
  jquery:
    path: "bower_components/jquery/dist/jquery.js"
    exports: null

# config
config =
  debug: not argv.dist
  src: "src/"
  dest: "target/"

# compilation tasks
gulp.task "coffee", ->
  gulp.src(config.src + "coffee/main.coffee", { read: false })
    .pipe(browserify(
      debug: config.debug
      transform: ['coffeeify']
      extensions: [".coffee"]
      shim: shim
    ))
    .pipe(conditional(not config.debug, uglify()))
    .pipe(rename("main.js"))
    .pipe(gulp.dest(config.dest))
    .pipe(connect.reload())

gulp.task "less", ->
  gulp.src(config.src + "less/main.less")
    .pipe(less(
      compress: not config.debug
    ))
    .pipe(gulp.dest(config.dest))
    .pipe(connect.reload())

gulp.task "jade", ->
  gulp.src(config.src + "jade/**/*.jade")
    .pipe(jade(
      pretty: config.debug
    ))
    .pipe(gulp.dest(config.dest))
    .pipe(connect.reload())

# development server tasks
gulp.task "connect", ->
  connect.server
    root: config.dest
    livereload: true

gulp.task "watch", ->
  gulp.watch config.src + "coffee/**/*.coffee", ["coffee"]
  gulp.watch config.src + "less/**/*.less", ["less"]
  gulp.watch config.src + "jade/**/*.jade", ["jade"]

# meta tasks
gulp.task "build", ["coffee", "less", "jade"]
gulp.task "default", ["build", "connect", "watch"]
