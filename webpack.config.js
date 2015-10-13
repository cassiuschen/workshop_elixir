module.exports = {
  entry: "./web/static/js/app.js",
  output: {
    path: "./priv/static/js",
    filename: "app.js"
  },
  module: {
    loaders: [
      { test: /\.js$/, loader: "babel-loader" },
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" },
      {
        test: /\.scss$/,
        loaders: ["style", "css", "sass"]
      },{
        test: /.*\/app\/.*\.js$/,
        exclude: /.spec.js/, // excluding .spec files
        loader: "uglify"
      }
    ]
  }
};