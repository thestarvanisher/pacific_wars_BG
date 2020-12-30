var modal_info = document.getElementsByClassName("infowindow")[0];
var spans_info = document.getElementsByClassName("info-close")[0];

var modal_sort = document.getElementsByClassName("infowindow")[1];
var spans_sort = document.getElementsByClassName("info-close")[1];


spans_info.onclick = function(){
	modal_info.style.display='none';
}

function showmodal(){
	modal_info.style.display = 'block';

}

spans_sort.onclick = function(){
	modal_sort.style.display='none';
}

function showsort(){
	modal_sort.style.display = 'block';

}
