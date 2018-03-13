module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-simple-mocha');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.initConfig({
    simplemocha: { dev: {
      src: 'spec/electron_cookies_spec.js',
      options: {
        reporter: 'spec',
        slow: 200,
        timeout: 1000
      }
    }
  },
    watch: { all: {
      files: [
        'src/*.js',
        'spec/*.js'
      ],
      tasks: [
        'test'
      ]
    }
  }});
  grunt.registerTask('test', 'simplemocha:dev');
  grunt.registerTask('default', [
    'test',
    'watch:all'
  ]);
};
