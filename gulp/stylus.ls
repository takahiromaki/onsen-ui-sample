require! \gulp-stylus

module.exports = (gulp)->
  gulp.task \stylus, (cb)->
    gulp
      .src \./assets/stylus/**/*.styl
      .pipe gulp-stylus do
          compress: no
      .pipe gulp.dest \./public/css/
