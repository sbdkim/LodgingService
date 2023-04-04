<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--  각 화면의 페이지 번호가 표시되는 영역의 구현 -->
<div>
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<%-- <a href="acc_search_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>--%>
				<a href="#" onclick="location.href='acc_search_list?pageNum='+${pageMaker.startPage-1}+'&rowsPerPage=10&key='+document.getElementById('key').value">[다음]</a>
			</li>
		</c:if>
				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<%-- <a href="acc_search_list${pageMaker.makeQuery(index)}">[${index}]</a>--%>
			<a href="#" onclick="location.href='acc_search_list?pageNum='+${index}+'&rowsPerPage=10&key='+document.getElementById('key').value">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<%-- <a href="acc_search_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>--%>
				<a href="#" onclick="location.href='acc_search_list?pageNum='+${pageMaker.endPage+1}+'&rowsPerPage=10&key='+document.getElementById('key').value">[다음]</a>
			</li>
		</c:if>	
			
	</ul>
</div>




