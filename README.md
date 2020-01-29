# README

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