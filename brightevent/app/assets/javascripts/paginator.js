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