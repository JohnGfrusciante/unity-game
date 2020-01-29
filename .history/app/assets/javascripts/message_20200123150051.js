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