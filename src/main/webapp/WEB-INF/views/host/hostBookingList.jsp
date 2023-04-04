<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
<%@ include file="sub_menu_host.jsp" %>      
     
  <article>
      <h2> 예약된 목록 </h2>
      <form name="formm" method="post">
        <table id="accommodationList">
       <c:forEach items="${accommodationList}"  var="accommodationVO">
       <tr>      
         <td align="center">
            <a href="host_booking_detail?aseq=${accommodationVO.aseq}">
              <h3> ${accommodationVO.aname} </h3>              
          </a>    
       
       </tr>
       </c:forEach>
       
      </table>   
          
      <div class="clear"></div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>