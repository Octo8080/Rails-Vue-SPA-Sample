module.exports = {
  configureWebpack: {
    output: {

      filename: '../../public/js/[name].js',
      chunkFilename: '../../public/js/[name].js'
    }
  },
  css: {
    extract: {
      filename: '../../public/css/[name].css',
      chunkFilename: '../../public/css/[name].css'    },
  },
  chainWebpack: config => {
    config.module.rules.delete('eslint');
  }
}
