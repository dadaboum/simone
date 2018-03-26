function ready() {
  $('input[type=checkbox]').click(function () {
    if ($(this).parent().hasClass('active')) {
      $(this).parent().removeClass('active');
    }
    else
    { $(this).parent().addClass('active'); }
  });
}

export { ready };
