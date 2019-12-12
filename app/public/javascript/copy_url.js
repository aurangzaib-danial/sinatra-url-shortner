$(document).ready(function() {
  $('.copy_link').click(function() {
    
      $(this).html('Copied!')

      const link = $(this).siblings('.short_link')

      const temp = $("<input>")

      $("body").append(temp)

      temp.val($(link).attr('href')).select()

      document.execCommand("copy")
      
      temp.remove()
      
      const selected = this

      setTimeout(function(){ $(selected).html('Copy') }, 3000);
  });
});