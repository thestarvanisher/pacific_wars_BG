
var th, tw,g,h,s;
var dmenu_s = false, umenu_s = false;
var ddn = false;
/*function resizeMe(){
		th = $(window).height();
		console.log(th);
		tw = $(window).width();
		console.log(tw);

		if(th<tw)
		{

			g = (16*th)/9;
			console.log("g=" + g);
			if(g>tw){
				console.log("terra 1");
				$("#maps").width(tw);

				h = (9*tw)/16;
				$("#maps").height(h);

				s = ($(window).height() - $("#maps").height())/2;
				//$("#maps").css("top", s);

				$("#maps").css("border-top", "1px solid black");
				$("#maps").css("border-bottom", "1px solid black");
				$("#maps").mapster("resize", tw, h, 0);
				$("#mapster_wrap_0").css("top", s);

				$("#rsq").css("left", "" + (0.352*tw) + "px");
				$("#rsq").css("height", "" + (0.0307*tw) + "px");
				$("#rsq").css("width", "" + (0.0307*tw) + "px");
				$("#rsq").css("top", "" + ((0.3097*h)+s) + "px");
				console.log("parent -> " + $("#maps").parent().id);

			}
			else{
				console.log("terra 2");
				$("#maps").height(th);

				$("#maps").width(g);
				$("#maps").mapster("resize", g, th, 0);
				//$("#maps").css("top", 0);
				$("#mapster_wrap_0").css("top", 0);
				$("#maps").css("border-top", "none");
				$("#maps").css("border-bottom", "none");


				$("#rsq").css("left", "" + (0.352*g) + "px");
				$("#rsq").css("height", "" + (0.0307*g) + "px");
				$("#rsq").css("width", "" + (0.0307*g) + "px");
				$("#rsq").css("top", "" + (0.3097*th) + "px");

			}

		}
		else{
			console.log("terra 3");
			h = (9*tw)/16;
			$("#maps").width(tw);
			$("#maps").height(h);
			$("#maps").mapster("resize", tw, h, 0);
			s = ($(window).height() - $("#maps").height())/2;
			console.log("s = " + $("#mapster_wrap_0").length);
			//$("#maps").css("top", s);
			$("#mapster_wrap_0").css("top", s);


			$("#rsq").css("left", "" + (0.352*tw) + "px");
			$("#rsq").css("height", "" + (0.0307*tw) + "px");
			$("#rsq").css("width", "" + (0.0307*tw) + "px");
			$("#rsq").css("top", "" + ((0.3097*h)+s) + "px");
			$("#maps").css("border-top", "1px solid black");
			$("#maps").css("border-bottom", "1px solid black");

		}



}*/


function changePosDmenu(){
	if(dmenu_s == false){
	var tgh = "" + ($(window).height()-50) + "px";
	//$("#darr").css("top", tgh);
	}
	else{
		var thg = "" + ($(window).height()-128) + "px";
		//$("#darr").css("top", thg)
	}
}


function toggleUmenu(){
	if(umenu_s == false){

		$("#menu").slideDown(400);
		$("#uparr").animate({top: "94px"});
		document.getElementById("uparr").innerHTML = "<b>&#708;</b>";
	}
	else{
		$("#menu").slideUp(400);
		$("#uparr").animate({top: "20px"});
		document.getElementById("uparr").innerHTML = "<b>&#709;</b>";

	}
	umenu_s = !umenu_s;

}

/*function toggleDmenu(){

	console.log("cool");

	if(dmenu_s == false){
	$("#bmenu").show("slide",{direction: "down"},400);
	
	var tgh = "" + ($(window).height()-128) + "px";
	$("#darr").animate({top:tgh});
	
	else{

		$("#bmenu").hide("slide",{direction: "down"},400);
		var thg = "" + ($(window).height()-50) + "px";
		$("#darr").animate({top:thg});
		document.getElementById("darr").innerHTML = "<b>&#708;</b>";
	}
	dmenu_s = !dmenu_s;

}*/


//$(window).on("load", resizeMe);

$(document).ready(function(){


	/*$('#maps').mapster({
         fillColor: 'ff0000',
         fillOpacity: 0.6
	});*/

/*function chck()
{
	console.log("sss");
	if($("#mapster_wrap_0").length!=0)
	{
		clearInterval(st);
		resizeMe();
	}

}*/

//var st = setInterval(chck, 20);

	//setTimeout(resizeMe, 200);

		/* $("#maps").mapster("resize", 10000,5625, 0);*/
	$("#uparr").click(function(){

		toggleUmenu();
	});

	/*$("#logos").click(function(){
	$("#menu").slideUp(400);
	setTimeout(function(){$("#uparr").css("display","inline-block");},420);
});*/

	$("#darr").click(function(){
		toggleDmenu();
	});

	//$('#btn').click(function (evt) {
	   // $(this).closest('.rsq').fadeOut();
		// $("#rsq").fadeOut();
		//console.log("no way");
	   /* $("body").zoomTo({
	        targetsize: 0.0, duration: 600
	    });*/
		//	evt.stopPropagation();
	//});
	//$("#innerFirst").zoomContainer();
//$("#rsq").zoomTarget();

	//$("#rsq").click(function(evt) {
	     ///   $(this).zoomTo({targetsize:1, duration:800});
					//$("body").setAttribute("style", "");
	       /// evt.stopPropagation();
					//$("#rsq").css("height", "10px");
	  ///  });


/*	$(document).keydown(function(e){
			if(e.which == 118){
				$("body").zoomTo({
						targetsize: 0.0, duration: 600
				});
				$("#rsq").css("display", "block");
				}


	});*/
});




$(window).resize(function(){
	console.log("yep");
	//resizeMe();
	changePosDmenu();

});
