var fcounter = 0;


function changeunion(){
	var h = $("#unionvalue").attr("value");
	console.log(h);
	if(h=="0"){
			$("#unionvalue").attr("value", "1");
			$("#union").css("background-color", "#009900");
			$("#union").text("∩");
	}
	else{
			$("#unionvalue").attr("value", "0");
			$("#union").css("background-color", "royalblue");
			$("#union").text("∪");
	}

}





function makecontent(){
		
		var search_el = `
	<input list="ffields" name="search_by` + fcounter +`" id="myin` + fcounter + `" placeholder="Изберете критерий..." class="search_by">
	<datalist id="ffields">
	<option value="Битка">
	<option value="Държава">
	<option value="Място на битка">
	<option value="Име на човек">
	<option value="Орден">
	</datalist>
	<input type="text" placeholder="Задайте ключови думи..." name="search_ff` + fcounter + `" id="mystxt` + fcounter +`" value="" class="search_ff"><button type="button" id="close` + fcounter + `" class="closebut" onclick="removefield(this.id)">x</button>
	</div>`;
	fcounter = fcounter + 1;
	return search_el;
	/*<option value="Жертви"> was removed
	<label for="myin" id="lbl` + fcounter + `"><b><i>Тип:</i></b></label> was placed before list=ffields 
	<label for="mytxt" id="lbll`+ fcounter +`"><b><i>Ключови думи: </i></b></label>
	*/
}
function insertcontent(){

		$("#field" + (fcounter-1)).after("<div class='afield' id='field"+fcounter+ "'>" + makecontent());
		console.log($("#myin" + fcounter).length);
	}


function removefield(myid){
	
	if(fcounter<=1){
		console.log("help");
		window.alert("Не може да се премахнат повече полета!");
		return;
	}
	else{
	var newid = myid.replace('close','');
	var newidnum = parseInt(newid);
	console.log("pep " +newidnum);
	/*$('#lbl' + newidnum).remove();
	$('#myin' + newidnum).remove();
	$("#ffields" + newidnum).remove()
	$('#lbll' + newidnum).remove();
	$('#mystxt' + newidnum).remove();
	$('#close' + newidnum).remove();*/
	$("#field" + newidnum).remove();

	for(var p=newidnum+1;p<fcounter;p++)
	{
		$("#field" + p).attr('id', "field"+(p-1));
		$('#lbl' + p).attr('id', "lbl"+(p-1));
	$('#myin' + p).attr('id', "myin"+(p-1));
	//$("#ffields" + p).attr('id', "ffields"+(p-1));
	$('#lbll' + p).attr('id', "lbll"+(p-1));;
	$('#mystxt' + p).attr('id', "mystxt"+(p-1));
	$('#close' + p).attr('id', "close"+(p-1));
	}
	fcounter=fcounter-1;
	}

}
$(document).ready(function(){

	


	
	

	/*var sbase = `
	<form action="{% url 'search:detail' jpcn011237 %}" method="post" id="myform">{% csrf_token %}`+"<div class='afield' id='field"+fcounter+"'>"+ makecontent() + '<input type="submit" value="Търси"><button type="button" id="addbutton" onclick="insertcontent()">+</button></form>';
	*/
	var sbases = "<div class='afield' id='field"+fcounter+"'>"+ makecontent() + '<input type="submit" id="searchit" value="Търси"><button type="button" class="addbutton" onclick="insertcontent()">+</button><input type="hidden" id="unionvalue" name="union_state" value="0"><button type="button" class="union" onclick="changeunion()">∪</button><button type="button" class="sortbutton" onclick="showsort()">≡</button><button type="button" class="info" onclick="showmodal()">?</button>';
	//$("#sfield").prepend(sbase);
	$("#myform").append(sbases);

	/*$("#myform").append('<input type="submit" value="Търси">');
	$("#myform").append('<button type="button" id="addbutton" onclick="insertcontent()">+</button>');*/
	

	




});

//<button value="Търси" id="searchit">Search</button>