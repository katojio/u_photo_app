# README

```
$ git clone git@github.com:katojio/u_photo_app.git
$ cd u_photo_app
$ bundle install
$ bin/rails db:migrate
$ bin/rails webpacker:install

$ bin/rails c
> User.create(login_id: 'xxx', password: 'yyy')

$ vim config/master.key
# お渡ししたmaster.keyを書き込んで保存

$ bin/rails s

# 以下へアクセスしてログイン
# http://localhost:3000/login
```
