$(function(){
  function buildHTML(post){
    var html = `
                  ${post.user_name}
                  ${post.text}
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