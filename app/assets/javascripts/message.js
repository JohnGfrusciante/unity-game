$(function(){
  function buildHTML(post){
    var html = `
                <li class="messagePost">
                <div class="messagePost__userName">
                ${post.user_name}
                </div>
                <div class="messagePost__date">
                ${post.created_at}
                </div>
                <div class="messagePost__message">
                ${post.text}
                </div>
                <div class="messagePost__likeCount">
                いいね件数 : 0
                </div>
                <div class="messagePost__lower">
                <div class="messagePost__lower__edit">
                <a data-method="get" href="/messages/${post.message_id}/edit">編集</a>
                </div>
                <div class="messagePost__lower__delete">
                <a rel="nofollow" data-method="delete" href="/messages/${post.message_id}">削除</a>
                </div>
                </div>
                </li>
                `
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messageList').prepend(html);
      $('.form').val('');
      $('.sendButton').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})