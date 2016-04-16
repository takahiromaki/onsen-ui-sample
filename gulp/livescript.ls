require! <[gulp-livescript gulp-concat]>

module.exports = (gulp)->
  gulp.task \livescript, (cb)->
    gulp
      .src \./assets/scripts/**/*.ls
      .pipe gulp-livescript bare: yes
      .pipe gulp-concat \app.js
      .pipe gulp.dest \./public/js/
