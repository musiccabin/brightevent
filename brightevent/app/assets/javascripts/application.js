// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require_tree .


$('body').on('click', '[data-go-to-page]', function(){
    var input_text = '<input type="text" name="go_to_page" size="4">';
    var span = $(this).find('span');
    span.html(input_text);
    $("[name='go_to_page']").focus();
  });
  
  $('body').on('keypress', 'input[name="go_to_page"]', function (e) {
    new_page = $(this).val();
    var charCode = (e.which) ? e.which : e.keyCode;
    if (charCode == 13 && new_page > 0) {
        $.ajax({
            dataType: "script",
            url: window.location.href,
            data: {page: new_page}
        });
        $(this).parent().html('&hellip;');
    }
  });

  $(document).ready(()=>{
    
    $('.carousel').carousel({
      interval: 2000
    })
    $(".flash" ).fadeOut(5000);

});

  
     

  