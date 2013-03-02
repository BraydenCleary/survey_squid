$(document).ready(function(){
  
  
  var create_entries = function(){
  
  var node = "";
  var displayCount = 0  

  $('#add_question').on('click', function(){
    displayCount++;
    node = '<p><label for="Question'+displayCount+'">Question'+displayCount+': </label><input type="text" name="Question'+displayCount+'[question]" id="Question'+displayCount+'"><br><span id="add_response'+displayCount+'">Add Response</span>';
    $('form').append(node);
    var Count = 0

    $('#add_response'+displayCount).on('click', function(){
    Count++;
    node2 = '<p><label for="Response'+Count+'">Response'+Count+': </label><input type="text" name="Question'+displayCount+'[Response'+Count+']" id="Response'+Count+'">';
    $(this).parent().append(node2);
  });


  });
  }
  


  create_entries()

  

});





  // <div id='response1'>
  //   <label for="response1">Response 1:</label>
  //   <input type='text' name='response1' placeholder='Response' />
  // </div>
