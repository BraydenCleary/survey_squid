$(document).ready(function(){
  
  
  var create_entries = function(num, type){
  
  // var responseNum = num;
  var node = "";
  var displayCount = num  

  // for(varCount=0;varCount<responseNum;varCount++){
  //     var displayCount = varCount+1;
  //     node += '<p><label for="'+type+displayCount+'">'+type+displayCount+': </label><input type="text" name="'+type+displayCount+'" id="'+type+displayCount+'">';
  // }
  // $('form.create_'+type.toLowerCase()).append(node)
  // //remove a textfield    

  $('#add_'+type.toLowerCase()).on('click', function(){
    displayCount++;
    node = '<p><label for="'+type+displayCount+'">'+type+displayCount+': </label><input type="text" name="'+type+displayCount+'" id="'+type+displayCount+'">';
    $('form').append(node);
  });
  }


  create_entries(2, 'Response')

  create_entries(2, 'Question')

});





  // <div id='response1'>
  //   <label for="response1">Response 1:</label>
  //   <input type='text' name='response1' placeholder='Response' />
  // </div>
