json.text  @post.text
json.message_id  @post.id
json.created_at  @post.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.user_id  @post.user.id
json.user_name  @post.user.name