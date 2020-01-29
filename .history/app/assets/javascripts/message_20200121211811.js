$(function(){
  function buildHTML(post){
    var html = `<p>
                  <strong>
                    <a href=/users/${post.user_id}>${post.user_name}</a>
                    ：
                  </strong>
                  ${post.text}
                </p>
                
                
                <li>
<div class="userName">
${post.user_name}
</div>
<div class="date">
2020年01月21日 21時14分
</div>
<div class="message">
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
      $('.new_message').append(html);
      $('.form').val('');
      $('.sendButton').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})