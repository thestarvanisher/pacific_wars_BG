var myurl;
function formLoader(url) {
	
	myurl = url;
	console.log(myurl);
}




$("#myform").submit(function(e){
		
		console.log('inside');
		console.log($("#email").val());


		$.ajax({
			type: 'POST',
			url: myurl,

			data: {
				'person_name': $("#pname").val(),
				'email': $("#email").val(),
				'subject': $("#subject").val(),
				'description': $("#description").val(),
				'captcha': grecaptcha.getResponse()

			},
			headers: {
				'X-CSRFToken': $("input[name='csrfmiddlewaretoken']").attr('value')
			},
			dataType: 'json',
			success: function(data){

				if(data.successful==1){
					document.getElementById('myform').reset();
					grecaptcha.reset();
					document.getElementById("warningcontent").innerHTML = 'Вашето съобщение беше доставено успешно!';
					$("#systemmessage").show();
				}
				else if(data.successful==2){
					document.getElementById("warningcontent").innerHTML = 'Вашето съобщение не беше доставено поради предишни нарушения!';
					$("#systemmessage").show();
				}
				else if(data.successful==3){
					document.getElementById("warningcontent").innerHTML = 'reCAPTCHA не е попълнена!';
					$("#systemmessage").show();
				}
			},
			error: function(data){
				document.getElementById("warningcontent").innerHTML = 'Вашето съобщение не беше доставено! Моля, опитайте отново по-късно!';
				$("#systemmessage").show();
				
			}




		});


e.preventDefault();



});

$("#closebutton").click(function(){
	$("#systemmessage").hide();


});
