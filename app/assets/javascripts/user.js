$(document).on('turbolinks:load', function(){
    $(document).on('keyup', '#input_name', function(e){
    e.preventDefault();
    console.log(this);
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
      $(data).each(function(i, user){ 
        $('#result').append('<li class="users">' + user.name + '</li>') 
      });
    })
  });
});