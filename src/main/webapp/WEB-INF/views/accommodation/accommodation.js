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


function accommodationRooms(aseq) {
  var form = document.createElement("form");
  form.setAttribute("method", "post");
  form.setAttribute("action", "roomList.jsp");
  var input = document.createElement("input");
  input.setAttribute("type", "hidden");
  input.setAttribute("name", "aseq");
  input.setAttribute("value", aseq);
  form.appendChild(input);
  document.body.appendChild(form);
  form.submit();
}

