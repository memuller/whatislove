const gulp =    require('gulp')
const gutil =   require('gulp-util')
const spawn =   require('child_process').spawn

var love_runner = null

gulp.task('run', () => {
  if(! love_runner){
    love_runner = spawn('love', ['.'])
  }
})

gulp.task('kill', () => {
  if(love_runner){
    love_runner.kill()
    love_runner = null
  }
})

gulp.task('watch', () => {
  gulp.watch(['./lib/*.lua', '*.lua'], ['kill', 'run'])
})
