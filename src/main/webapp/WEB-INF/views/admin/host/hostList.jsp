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
</script>

<article>
<h1>사업자리스트</h1>  
<form name="frm" method="post">
<table style="float:right; ">
  <tr>
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
    <th> (탈퇴여부) </th>    
    <th> 이름 </th>
    <th> 이메일 </th>            
    <th> 전화 </th>  
    
  </tr>
  <c:forEach items="${hostList}" var="hostVO">  
  <tr>
    <td> 
    <c:choose>
      <c:when test='${hostVO.status=="0"}'>
        <input type="checkbox" name="status" disabled="disabled">
      </c:when>
      <c:otherwise>
        <input type="checkbox" name="status" checked="checked" disabled="disabled">
      </c:otherwise>
    </c:choose>
    </td>
    <td> ${hostVO.name} </td>
    <td> ${hostVO.hemail} </td> 
    <td> ${hostVO.phone} </td>
  </tr>
  </c:forEach>
</table>
</form>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>