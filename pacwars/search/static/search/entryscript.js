var description_el;
var title_el;
var datas = []

function collect_data(){

	for(var i=0;i<document.getElementsByClassName('entrydescription').length;i++)
	{
		var p=$('.inc').eq(i);
		datas.push(p.html());


	}

}

function resizeEntryElements(){
	description_el = document.getElementsByClassName('entrydescription')
	title_el = document.getElementsByClassName('entrytitle')




	//if($(window).width();
	for(var i=0;i<description_el.length;i++){

		/// changing the size of the description field so that it takes the rest of the available space
		description_el[i].style.height = "" + ($(".entry").eq(i).innerHeight() - $(".entrytitle").eq(i).height()) + "px";

		// Changing the text volume so that it can fit 
		var p=$('.inc').eq(i);
		var divh=($(".entry").eq(i).innerHeight() - $(".entrytitle").eq(i).height());
		if(p.height()>0){



			var t = datas[i];
		p.html(datas[i]);
   	 	while(p.height() > divh){
   	 		
   	 		t = t.slice(0, t.length-200);
   	 		p.html(t+"...");	
   	 		//console.log(p.text());
   	 	}

		}
		
	}




	


}http://localhost:6446/static/search/images/imagedb/default.png





$(window).ready(function(){

	collect_data();
	resizeEntryElements();


});

$(window).resize(function(){

	resizeEntryElements();
});