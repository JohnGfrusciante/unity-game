# README

## App URL
[https://vast-waters-76269.herokuapp.com/](https://vast-waters-76269.herokuapp.com/ "https://vast-waters-76269.herokuapp.com/")  
【ログイン用テストアカウント】  
- user1
email：a@gmail.com  
password：111111  
- user2
email：b@gmail.com  
password：111111

## Overview
サイト内で掲載しているゲーム(Unity玉転がしゲーム)への感想を投稿できるアプリケーションです。  
※ログイン後に投稿ができるようになります。

## Development environment
- Ruby on Rails
- jQuery (コメント投稿時のajax通信)
- View file：haml, scss
- Database：MySQL2
- Deploy：Heroku
- Editor：VS Code

***
# *establish database*

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|integer|null: false|
|name|string|null: false|

### Association
- has_many :messages
- has_many :likes
- has_many :liked_messages, through: :likes, source: :message


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :likes
- has_many :liked_users, through: :likes, source: :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|message_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :message
