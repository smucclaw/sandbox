const path = require('path');

module.exports = {
  mode: 'development',

  entry: {
    plus: './jsrc/plus.js',
    hello: './jsrc/hello.js',
  },
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
};