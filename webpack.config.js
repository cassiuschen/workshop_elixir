//var ExtractTextPlugin = require("extract-text-webpack-plugin");
var path = require('path');
var webpack = require("webpack");
module.exports = {
  entry: "./web/static/js/app.js",
  output: {
    path: "./priv/static/js",
    filename: "app.js"
  },
  resolve: {
    root: [path.join(__dirname, "bower_components")]
  },
  module: {
    loaders: [
      { test: /\.js$/, loaders: ["uglify-loader", "babel-loader"] },
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.(jpg|png)$/, loader: "url?limit=8192"},
      { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" },
      {
        test: /\.scss$/,
        loaders: ["style", "css", "autoprefixer?browsers=last 5 versions", "sass??outputStyle=expanded&" +
          "includePaths[]=" +
            encodeURIComponent(path.resolve(__dirname, "./web/static/css"))]
      }
    ]
  },
  plugins: [
    //new webpack.optimize.CommonsChunkPlugin('common.js'),
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin("bower.json", ["main"])
    )
    //new ExtractTextPlugin("[name].css")
  ]
};