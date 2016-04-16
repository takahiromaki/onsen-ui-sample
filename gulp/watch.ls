module.exports = (gulp)->
  gulp.task \watch, (cb)->
    gulp.watch \./assets/scripts/**/*.ls, <[livescript]>
    gulp.watch \./assets/jade/**/*.jade, <[jade]>
    gulp.watch \./assets/stylus/**/*.styl, <[stylus]>

