<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<script type="text/javascript">
  function go_search()
  {
     document.frm.action="admin_host_list";
     document.frm.submit();
  }
  
  function approve_host(){
	  var count = 0;
	    if (document.frm.status.length == undefined) {
	      if (document.frm.status.checked == true) {
	        count++;
	      }
	    } else {
	      for ( var i = 0; i < document.frm.status.length; i++) {
	        if (document.frm.status[i].checked == true) {
	          count++;
	        }
	      }
	    }
	    if (count == 0) {
	      alert("주문처리할 항목을 선택해 주세요.");
	    } else {
	      document.frm.action = "approve_host_save";
	      document.frm.submit();
	    }
	  
  }
  
  function delete_host(){
	  
  }
  
  
  
  
 
  
  
  
</script>

<article>
<h1>사업자리스트</h1>  
<form name="frm" method="post">
<table style="float:right; ">
  <tr>
  <c:if test="${empty button2.visible}">
  <td  id="button1" style="display:none"><input type="button" class="btn" style="width: 200px"
      value="승인 기능" onClick="show_approve_checkbox()"></td>
  </c:if>
  <c:if test="${empty button1.visible}">

  <td id="button2"><input type="button"  class="btn" style="width: 200px"
      value="삭제 기능" onClick="show_delete_checkbox()"></td>
  </c:if>
      
      
  <td> 
 사업자 이름
  <input type="text" name="key" id="key">
  <input class="btn" type="button" value="검색" onclick="go_search()">
  </td>
  </tr>
</table>  
<br>
<table id="orderList">
  <tr>
   <c:if test="${empty button2.visible}"><th> (승인여부) </th></c:if>
   
   <c:if test="${empty button1.visible}"><th> (삭제) </th></c:if>
        
    <th> 이름 </th>
    <th> 이메일 </th>            
    <th> 전화 </th>  
    
  </tr>
  <c:forEach items="${hostList}" var="hostVO">  
  <tr>
    <td id="statuscheck"> 
    <c:choose>
      <c:when test='${hostVO.status=="0"}'>
        <input type="checkbox" name="status">
      </c:when>
      <c:otherwise>
        <input type="checkbox" name="status" checked="checked" disabled="disabled">
      </c:otherwise>
    </c:choose>
    </td>
    
    <td id="deletecheck" style="display:none"><input type="checkbox" name="delete"></td>
     
    
    
    
    
    <td> ${hostVO.name} </td>
    <td> ${hostVO.hemail} </td> 
    <td> ${hostVO.phone} </td>
  </tr>
  </c:forEach>
</table>
<input type="button" class="btn" style="width: 200px"
      value="HOST 승인" onClick="approve_host()">
 <input type="button" class="btn" style="width: 200px"
      value="HOST 삭제" onClick="delete_host()">

</form>
<%@ include file="page_area.jsp" %>
</article>


<script>
function show_approve_checkbox(){
	// get references to the two <td> elements to be toggled
	  const td1 = document.getElementById('statuscheck'); // replace 'td1' with the ID of your first <td>
	  const td2 = document.getElementById('deletecheck'); // replace 'td2' with the ID of your second <td>
	  const button1 = document.getElementById('button1');
	  const button2 = document.getElementById('button2');
	  
	  
	  // hide td1 and show td2
	  td1.style.display = 'none';
	  td2.style.display = 'table-cell';
	  button1.style.display = 'none';
      button2.style.display = 'block';
  }
  
  function show_delete_checkbox(){
	// get references to the two <td> elements to be toggled
	  const td1 = document.getElementById('statuscheck'); // replace 'td1' with the ID of your first <td>
	  const td2 = document.getElementById('deletecheck'); // replace 'td2' with the ID of your second <td>
	  const button1 = document.getElementById('button1');
	  const button2 = document.getElementById('button2');
	  
	  
	  // hide td1 and show td2
	  td1.style.display = 'table-cell';
	  td2.style.display = 'none'; 
	  button1.style.display = 'block';
      button2.style.display = 'none';
  }
  

</script>
<%@ include file="../footer.jsp"%>
</body>
</html>