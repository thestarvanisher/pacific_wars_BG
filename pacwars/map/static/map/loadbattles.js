var openedCluster = null;
function loadContent(){

	chck();

	function checkInterval(){
		if(checkLoaded()==1){ clearInterval(tm); 

	tags = document.getElementsByClassName("maptag");
	bxs = document.getElementsByClassName('bxs');
	for(var i=0; i<tags.length; i++)
	{
		/*$('#'+tags[i].id).css({
		'position': 'absolute',
		//'left': ''+ 0.32*100 + '%',
		//'top': ''+0.1*100+'%',
		'left': '' + parseFloat(tags[i].getAttribute('data-location-left'))*100 + '%',
		'top': '' + parseFloat(tags[i].getAttribute('data-location-top'))*100 + '%',
		'color': 'green',
		//'border-left': 'solid black 1px',
		//'border-top': 'solid black 1px',
		'height': '3%',
		'width': 'auto',
		'z-index': '100'
		
	});*/
	$('#' + bxs[i].id).css({
		'position': 'absolute',
		'left': '' + parseFloat(tags[i].getAttribute('data-location-left'))*100 + '%',
		'top': '' + parseFloat(tags[i].getAttribute('data-location-top'))*100 + '%',
		'height': '3%',
		'width': 'auto',
		'cursor': 'pointer'
		//'z-index': '100'
	});
	$('#' + tags[i].id).css({
		'height': '100%',
		'width': 'auto',
		'position': 'relative',
		'z-index': '102'

	});



	}

	clickables = document.getElementsByClassName('clickable');

	groups = document.getElementsByClassName("group");
	bxs2 = document.getElementsByClassName('bxs2');
	for(var i=0; i<groups.length; i++){

		$('#'+clickables[i].id).css({
		'position': 'absolute',
		'left': '' + parseFloat(clickables[i].getAttribute('data-location-left'))*100 + '%',
		'top': '' + parseFloat(clickables[i].getAttribute('data-location-top'))*100 + '%',
		'height': '3%',
		'width': 'auto',
		'z-index': '100'
		
	});

		


		
	
		
		$('#'+groups[i].id).css({
			'position': 'absolute',
			'height': '3%',
			//'width': 'auto',
			'border-bottom': '2px #9D3838 solid',
			'z-index': '103',
			'cursor': 'pointer'
			
			//'background-color': 'white'
		});
		$('#'+groups[i].id).css({
			'left': '' + ((((parseFloat(clickables[i].getAttribute('data-location-left'))*$('#battlewindow').width() + ($('#'+clickables[i].id).width()*0.5)) - $('#' + groups[i].id).width()*0.5)/$('#battlewindow').width())*100).toFixed(2) + '%', 
			'top': '' + (((parseFloat(clickables[i].getAttribute('data-location-top'))*$('#battlewindow').height() - $('#battlewindow').height()*0.03 - 4)/$('#battlewindow').height())*100).toFixed(2) + '%',
			'display': 'none'
		});
	
	var t = '#' + groups[i].id;
	$('#' + clickables[i].id).click(function(){
		console.log('idk why');
			if(openedCluster!=null || openedCluster == t){
				//$(openedCluster).css('display', 'none');
				$(openedCluster).fadeOut();
				
			}
			openedCluster = t;
			//$(t).css('display', 'block');
			$(t).fadeIn();
			event.stopPropagation();
	});	
	$('#maps').click(function(){
		if(openedCluster!=null){
			//$(openedCluster).css('display', 'none');
			$(openedCluster).fadeOut();
			openedCluster = null;
		}

	});



	}

		$("#loadingscreen").hide();
		$("#loadingscreen").remove();

		console.log("done");}
	}


	var tm = setInterval(checkInterval, 5);


	
	//hiddenmaps = document.getElementsByClassName('hiddenmaps');
	/*for(var i=0; i<hiddenmaps.length; i++)
	{
		$('#'+hiddenmaps[i].id).css({
			'height': '90%',
			'position': 'absolute',
			'top': '5%',
			'margin-left': '3px',
			'margin-rigth': '3px',
			'display'

		});*/
	


	/*$("#mappos1").css({
		'position': 'absolute',
		'left': ''+ 0.32*100 + '%',
		'top': ''+0.1*100+'%',
		'color': 'green',
		'height': '3%',
		'width': 'auto',
		'z-index': '100'
		
	});
	$("#mappos1").hover(function(){
		console.log("inside")
	});

	$("#mappos1").mouseleave(function(){
		console.log('outside');
		
	});*/



	
	//console.log("done");
}