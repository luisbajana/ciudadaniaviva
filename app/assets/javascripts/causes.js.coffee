
jQuery ->
  $( "#support_date" ).datepicker({ minDate: 0, maxDate: "+1M" },"yy-mm-d");

 

  $('#steptwo').click ->
   $('#step2Container').hide()
   $('#steps').html('Step 3 - Upload a photo')
   $('#step3Container').show()


  $('#step2Container').hide()
  $('#step3Container').hide()


  $('#step1').click ->

  	cause_name = $('#cause_name_dummy').val()
  	cause_category = $('#directorycategory_dummy').val()

  	$("#cause_title").val($('#cause_name_dummy').val())
  	
  	$("#cause_goal").val($('#cause_participants').val())
  	$("#cause_custom_url").val("test")

  	$("#cause_description").val($('#cause_description_dummy').val())
  


  	$.ajax(url: "/directories/create_directory?name="+cause_name+"&category="+cause_category).done (html) ->
 
	  	

	  	$('#step1Container').hide()

	  	$('#steps').html('Step 2 - Where participants can help')
	  	$('#step2Container').show()


	  	$('#addanaddress').click ->
	  		description = $('#place_name_dummy').val()
	  		address = $('#location_address_dummy').val()
	  		

	  		$("#cause_dataset").val(html[0].id)
	  		$("#cause_city").val($('#causecity').val())

	  		$.ajax(url: "/locations/create_location?description="+description+"&address="+address+"&directory_id="+html[0].id).done (html) ->
	  			console.log('done')
	        	
	          

  