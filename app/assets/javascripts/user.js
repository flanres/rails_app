$(document).on('turbolinks:load', function(){
    $(document).on('keyup', '#input_name', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: '/users/search',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){ 
      $('#result').find('li').remove(); 
      $('#page').find('li').remove(); 
      $(data).each(function(i, user){ 
//        $('#result').append('<%= gravatar_for user, size: 50 %>') 
//        $('#result').append('<%= render @users %>')
//        $("#result").html("<%= escape_javascript(render partial: 'users/_user.html.erb') %>")
//        $("#result").html("<%= escape_javascript(render partial: 'users/_user.html.erb' @users) %>")
      });
    })
  });
});