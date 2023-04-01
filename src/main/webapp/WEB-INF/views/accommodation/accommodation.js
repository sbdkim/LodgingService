/**
 * 
 */
function go_search() {
	var form = document.getElementById("acc_form");
	form.action = "acc_search_list";
	form.submit();
}

function go_total() {
	var form = document.getElementById("acc_form");
	document.getElementById("key").value = "";
	form.action = "acc_search_list";
	form.submit();
}


function accommodationRooms(){
	window.location.href = "roomList.jsp";
}

