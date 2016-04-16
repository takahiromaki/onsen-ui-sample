require! \gulp-jade

module.exports = (gulp)->
  gulp.task \jade, (cb)->
    gulp
      .src \./assets/jade/**/*.jade
      .pipe gulp-jade do
        basedir: \./assets/jade/
        pretty: yes
      .pipe gulp.dest \./public/
