const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  publicPath: '/',
  transpileDependencies: true,
  devServer: {
    host: '0.0.0.0', // Allow connections from your phone
    port: 8080, // Optional: change if needed
    allowedHosts: 'all'
  }
})
