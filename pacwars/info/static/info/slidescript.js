
function changePhotoSize(){
		if($(window).height()<$(window).width()){
			console.log("opt1");

			$("#centralphoto").css("height", String(0.8*$(window).height()));
			$("#centralphoto").css("width", "auto");
			if($("#centralphoto").width()>$("#photoblock").width()){
				$("#centralphoto").css("height", "auto");
				$("#centralphoto").css("width", "100%");
			}

		}
		else{
			console.log("opt2");
			$("#centralphoto").css("height", "");
			$("#centralphoto").css("width", "");
		}
	}


$(document).ready(function(){



	
	
	



	if(matchMedia("screen and (orientation: landscape)").matches){
		$("#centralphoto").css("height", String(0.8*$(window).height()));
		$("#centralphoto").css("width", "auto");
	}
	var timer;
	var printmode=1;
	function bringnormal(){
		$("#arrowhead").show('slide', {direction: "up"}, 400);
		$("#buttons").hide('slide', {direction: "down"}, 400);
	}
	function changePrintMode(settings){
		var temp = window.matchMedia("screen and (max-width: 870px)");
		if(settings==1){
			$("#rightside").css("display", "none");
			$("#leftside").css("width", "calc(100% - 20px)");
			$("#myblock").css("border", "none");
			//if(temp.matches){
				//$("#photoblock").css("display", "none");

			//}

		}
		if(settings==0){
			console.log(temp.matches);
			
			$("#photoblock").css("display", "");
			//$("#myblock").css("border", "2px solid black");
			$("#rightside").css("display", "");
			$("#leftside").css("width", "");
			$("#myblock").css("border", "");
			//$("#photoblock").css("display", "none");

			/*if(temp.matches == 1){
				$("#photoblock").css("display", "block");
				$("#myblock").css("border", "2px solid black");
				
			}
			else{
				$("#rightside").css("display", "block");
				$("#leftside").css("width", "65%");
				$("#myblock").css("border", "2px solid black");
				$("#photoblock").css("display", "none");
			}*/

			
			
		}

	}
	$("#arrowhead").click(function(){

		$(this).hide('slide', {direction: "up"}, 400);
		$("#buttons").show('slide', {direction: "down"}, 400);
		timer = setTimeout(bringnormal, 3000);
	});



	$("#bcontainer").mouseleave(function(){
			timer = setTimeout(bringnormal, 3000);
	});
	$("#bcontainer").mouseover(function(){
			clearTimeout(timer);
	});

	$("#print").click(function(){
		if(printmode==1){window.print();}
		if(printmode==2){changePrintMode(1); window.print(); changePrintMode(0);}


	});
	$("#mode").click(function(){
		
		if(printmode==1){
			$("#mode").css("background-color", "green");
			$("#mode").text("икономичен");
			printmode=2;
		}
		else if(printmode==2){
			$("#mode").css("background-color", "black");
			$("#mode").text("стандартен");
			printmode=1;
		}

	});
	$(window).resize(changePhotoSize);
	
	changePhotoSize();

})