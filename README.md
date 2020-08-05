## Vue.js 実装ワーク
ruby 2.4.0  
rails 5.2.4

## How to Setup
step1: check your ruby version
```
rbenv versions
```
Install 2.4.0 if you don't have it
```
rbenv install 2.4.0
```

step2: check your rails version
```
gem list rails
```
Install 5.2.4 if you don't have it
```
gem install rails -v 5.2.4
```
5.2.4系であれば、パッチは問わない。

step3: Create new app  
1. rails newに--webpack=vueオプションを付けて、プロジェクトの作成時にVue.jsもインストールする方法
2. rails newに--webpackオプションを付けて、プロジェクト作成時にwebpackもインストールし、Vue.jsを後からインストールする方法
3. rails newして、その後にWebpackerとVue.jsをインストールする方法
3種類の方法がありますが、ワークでは、3の方法で行いましょう。  
-d postgresqlオプションは不要です。
```
rails _5.2.4_ new rails-vue
```
5.2.4系であれば、パッチは問わない。

step4: Install gem webpaker  
`Gemfile`
```
gem 'webpacker', github: 'rails/webpacker'
```
On Terminal  
```
bundle install
```

step5: Install webpacker
```
bin/rails webpacker:install
```

step6: Install Vue.js
```
rails webpacker:install:vue
```

step7: To be able to use webpack  
`layouts/application.html.erb`
```
<body>
  <%= yield %>
  <%= javascript_pack_tag 'hello_vue' %>  <!-- 追加 -->
</body>
```

step8: Create top page
```
rails g controller Home index
```

step9: Implement route
`route.rb`
```
root to: 'home#index'  <!-- 追加 -->
get "home/index"  <!-- 削除 -->
```

## Copy 4 files on your files
- [app/javascript/packs/hello_vue.js](https://github.com/diveintocode-corp/rails_vuejs/blob/master/app/javascript/packs/hello_vue.js)
- [app/views/home/index.html.erb](https://github.com/diveintocode-corp/rails_vuejs/blob/master/app/views/home/index.html.erb)
- [app/assets/stylesheets/home.scss](https://github.com/diveintocode-corp/rails_vuejs/blob/master/app/assets/stylesheets/home.scss)
- [app/javascript/app.vue](https://github.com/diveintocode-corp/rails_vuejs/blob/master/app/javascript/app.vue)

## Today's Goal
1. コードをカスタマイズし、タスク管理アプリにする
例：
  - 表示内容の変更（ex. Name⇨タスク名）
  - タスクの追加ができる
  - タスクの削除ができる

2. webpack-dev-serverを有効にし、railsサーバーを立ち上げると自動コンパイルができる
参考記事
[webpack-dev-serverを有効にする
](https://qiita.com/jnchito/items/30ab14ebf29b945559f6#webpack-dev-server%E3%82%92%E6%9C%89%E5%8A%B9%E3%81%AB%E3%81%99%E3%82%8B)

3. Herokuにデプロイする
Herokuでは、データベースはpostgresqlを推奨しています。
利用するデータベースを変更し、デプロイしましょう。
参考記事
[Herokuへのデプロイ](https://qiita.com/jnchito/items/30ab14ebf29b945559f6#heroku%E3%81%B8%E3%81%AE%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4)