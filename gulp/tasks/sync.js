var sync = require('browser-sync');
var gulp = require('gulp');

gulp.task('sync', ['template:development', 'build:js', 'build:css', 'build:images'], function() {
  sync.init(['build/**'], {
    server: {
      baseDir: 'build'
    }
  });
});
