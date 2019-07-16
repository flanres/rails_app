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
//    .done(function(data){ 
//      console.log(data)
//      $('#page').find('li').remove(); 
//      $(data).each(function(i, user){ 
//        $('#page').append('<%= gravatar_for user, size: 50 %>') 
//        $('#page').html('<%= render :partial => "user" %>')
//        $("#page").html("<%= j(render partial: "user", :collection => @users ) %>");
//        $("#page").html("<%= j(render partial: "user", :collection => @users ) %>");
//        $("#page").html("<%= escape_javascript(render partial: 'users/_user.html.erb' @users) %>")
//      });
//    })
  });
});
