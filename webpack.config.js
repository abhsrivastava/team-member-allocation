const path = require('path')
const outputDir = path.join(__dirname, "./build")
const HtmlWebpackPlugin = require('html-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')

module.exports = {
  mode: "development",
  watch: true,
  entry: './src/Index.bs.js',
  output: {
    path: outputDir,
    filename: "Index.js"
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/Index.html',
      inject: false
    }),
    new CopyWebpackPlugin({
      patterns: [
        {from: './src/images', to: 'images'}
      ]
    })
  ],
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: [
          'style-loader', 
          'css-loader'
        ]
      }
    ]
  },
  devServer: {
    historyApiFallback: true,
    static: {
      directory: outputDir
    },
    compress: true, 
    port: 8000
  }
}