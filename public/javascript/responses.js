$(document).ready(function(){
  
  
  var create_entries = function(){
  
  var node = "";
  var displayCount = 0
    

  $('#add_question').on('click', function(){
    displayCount++;
    node = '<div class="question"><p><label for="Question'+displayCount+'">Question '+displayCount+' : </label><input type="text" name="Question'+displayCount+'[question]" id="Question'+displayCount+'"><br><span class="add" id="add_response'+displayCount+'">Add Response</span></div>';
    $('form').append(node);
    var Count = 0
    
    $('#add_response'+displayCount).on('click', function(){
    Count++;
    var questionNum = $(this).attr('id').substr(12,14)
    node2 = '<p><label class="responses" for="Response'+Count+'">Response '+Count+' : </label><input type="text" name="Question'+questionNum+'[Response'+Count+']" id="Response'+Count+'">';
    $(this).parent().append(node2);
  });


  });
  }
  create_entries();
});


// $(document).ready(function(){
//   var counter = 0;
//   var recounter = 0;

//   $(".add").on("click", "p", function(e){
//     $(this).append("<br/><input type='text' name='q"+$(this).attr('question-id')+'r'+recounter+"' placeholder='response'>");
//     recounter++;
//     return false;
//   });

//   $(".add").on("click", "input", function(e){
//     return false;
//   });

//   $(".add").click(function(e){
//     $(this).append("<br/>Question<br/><input type='text' name='q" + counter+"'' placeholder='question'><p question-id="+counter+">responses</p>");
//     counter++;
//   });
// });
