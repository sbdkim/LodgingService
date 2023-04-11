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
