process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

 //初回読み込み、リロード、ページ切り替えで動く。
 $(document).on('turbolinks:load', function() { });

 //初回読み込み、ページ切り替えで動く。リロードは動かない
 $(document).on('turbolinks:render', function() {　});
 
 //ページ遷移前に行いたい処理用。ページ切り替えでもリロードでも動かない
 $(document).on('turbolinks:request-start', function() {　});