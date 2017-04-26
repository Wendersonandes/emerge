module.exports = {
  entry: './src/index.jsx',
  output: {
    filename: "./app/assets/javascripts/bundle.js",
  },
  resolve: {
    extensions: ['.js', '.json', '.jsx', '.css']
  },
  module: {
    loaders: [
      {
        loader: 'babel-loader',
<<<<<<< HEAD
=======
        test: /\.(png|jpg)$/,
>>>>>>> 6994ff6f1422d2c923e04ee309b097f09ef708df
        query: {
          presets: ['react', 'es2015', 'stage-1']
        },
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/
      }
    ]
  },
  devtool: 'cheap-module-eval-source-map'
};

