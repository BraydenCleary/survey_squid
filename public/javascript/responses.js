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
    node2 = '<p><label class="responses" for="Response'+Count+'">Response '+Count+' : </label><input type="text" name="Question'+displayCount+'[Response'+Count+']" id="Response'+Count+'">';
    $(this).parent().append(node2);
  });


  });
  }
  create_entries();
});
