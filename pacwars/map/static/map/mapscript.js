
var th, tw,g,h,s;
var dmenu_s = false, umenu_s = false;
var ddn = false;
var loaded = false;

function checkLoaded(){
	if(loaded==false) return 0;
	else return 1;
	

}

function resizeMe(){
	console.log("????");
		th = $(window).height(); // getting the window height
		console.log(th);
		tw = $(window).width(); // getting the window width
		console.log(tw);

		if(th<tw) // when height is smaller than width
		{

			g = (16*th)/9;
			console.log("g=" + g);
			if(g>tw){ //if width is smaller than wxpected width with 16:9 aspect ratio
				console.log("terra 1");
				$("#maps").width(tw); //changing maps width to the width

				h = (9*tw)/16; // getting the height to r
				$("#maps").height(h);

				s = ($(window).height() - $("#maps").height())/2;
				

				$("#battlewindow").width(tw);
				$("#battlewindow").height(h);
				$("#battlewindow").css('top', s);
				
				
				$("#maps").mapster("resize", tw, h, 0);
				$("#mapster_wrap_0").css("top", s);
				console.log("parent -> " + $("#maps").parent().id);
			}
			else{
				console.log("terra 2");
				$("#maps").height(th);

				$("#maps").width(g);
				$("#maps").mapster("resize", g, th, 0);
				
				$("#mapster_wrap_0").css("top", 0);


				$("#battlewindow").width(g);
				$("#battlewindow").height(th);
				$("#battlewindow").css('top', 0);
			
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
			
			$("#mapster_wrap_0").css("top", s);

			$("#battlewindow").width(tw);
			$("#battlewindow").height(h);
			$("#battlewindow").css('top', s);


		}



}


function changePosDmenu(){
	if(dmenu_s == false){
	var tgh = "" + ($(window).height()-50) + "px";
	$("#darr").css("top", tgh);
	}
	else{
		var thg = "" + ($(window).height()-128) + "px";
		$("#darr").css("top", thg)
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

function toggleDmenu(){

	console.log("cool");

	if(dmenu_s == false){
	$("#bmenu").show("slide",{direction: "down"},400);
	//$("#darr").css("display","none");
	var tgh = "" + ($(window).height()-128) + "px";
	$("#darr").animate({top:tgh});
	document.getElementById("darr").innerHTML = "<b>&#709;</b>";
	}
	else{

		$("#bmenu").hide("slide",{direction: "down"},400);
		var thg = "" + ($(window).height()-50) + "px";
		$("#darr").animate({top:thg});
		document.getElementById("darr").innerHTML = "<b>&#708;</b>";
	}
	dmenu_s = !dmenu_s;

}


//$(window).on("load", resizeMe);
function chck()
{
	
	function checkDone(){
		
		//console.log("checking...");
		if($("#mapster_wrap_0").length!=0)
	{
		//console.log("=== None ===");
		clearInterval(st);
		resizeMe();
		loaded = true;


	}
	}
	var st = setInterval(checkDone, 8);

	/*var t = setInterval(function(){
		console.log("STATUS: " + $("#mapster_wrap_0").length);
	}, 8)*/
	//console.log("sss" + $("#mapster_wrap_0").length);
	//console.log(st);
	 
	if($("#mapster_wrap_0").length!=0)
	{
		clearInterval(st);
		resizeMe();
		loaded = true;
	}


}


$(document).ready(function(){



	/*$('#maps').mapster({
		 mapKey: 'data-key',
         
        });*/



//chck();
//var st = setInterval(chck, 5);

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

	$('#btn').click(function (evt) {
	   // $(this).closest('.rsq').fadeOut();
		// $("#rsq").fadeOut();
		console.log("no way");
	   /* $("body").zoomTo({
	        targetsize: 0.0, duration: 600
	    });*/
			evt.stopPropagation();
	});
	//$("#innerFirst").zoomContainer();
//$("#rsq").zoomTarget();

	//$("#rsq").click(function(evt) {
	       // $(this).zoomTo({targetsize:1, duration:800});
					//$("body").setAttribute("style", "");
	       // evt.stopPropagation();
					//$("#rsq").css("height", "10px");
	   // });


	$(document).keydown(function(e){
			if(e.which == 118){
				/*$("body").zoomTo({
						targetsize: 0.0, duration: 600
				});*/
				$("#rsq").css("display", "block");
				}


	});
});




$(window).resize(function(){
	console.log("yep");
	resizeMe();
	changePosDmenu();

});
