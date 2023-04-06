<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
     
  <article>
      <h2> Booking List </h2>
      <form name="formm" method="post">
        <table id="bookingList" >
       <tr>
       <th>예약번호</th> <th>예약날짜</th> <th>예약객실명</th>  <th>체크인 날짜</th> <th>체크아웃 날짜</th>  <th>가격</th>  
       </tr>
       <tr>
       <td> ${bookingList.bseq} </td>      
       <td> ${bookingList.indate} </td>
        <td>
            <a href="booking_detail?bseq=${bookingList.bseq}">
              <h3> ${bookingList.name} </h3>              
          </a>    
        </td>
        <td> ${bookingList.checkin} </td>
        <td> ${bookingList.checkout} </td>
        <td> <fmt:formatNumber value="${bookingList.price}" type="currency"/> </td>      
       </tr>
       <tr>
         <th colspan="3"> 총 액 </th>
         <th colspan="3"> <fmt:formatNumber value="${totalPrice}" type="currency"/><br>     </th> 
         <th> 예약 처리가 완료되었습니다. </th>                
       </tr> 
      </table>   
          
      <div class="clear"></div>
      <div id="buttons" style="float: right">
       <input type="button"    value="예약 계속하기"  class="cancel"  onclick="location.href='index'">     
      </div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>