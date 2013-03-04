$(document).ready(function(){
  var counter = 0;
  var recounter = 0;

  $(".add").on("click", "p", function(e){
    console.log($(this).attr("question-id"));
    $(this).append("<br/><input type='text' name='q"+$(this).attr('question-id')+'r'+recounter+"' placeholder='response'>");
    recounter++;
    return false;
  });

  $(".add").on("click", "input", function(e){
    return false;
  });

  $(".add").click(function(e){
    $(this).append("<br/>Question<br/><input type='text' name='q" + counter+"'' placeholder='question'><p question-id="+counter+">responses</p>");
    counter++;
  });
});
