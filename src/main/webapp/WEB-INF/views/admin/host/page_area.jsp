<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

li{
display: inline-block;
}

</style>
<!--  각 화면의 페이지 번호가 표시되는 영역의 구현 -->
<div>
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="#" onclick="location.href='admin_hostList?pageNum='+${pageMaker.startPage-1}+
									'&rowsPerPage=10&key='+document.getElementById('key').value">[이전]</a>
			</li>
		</c:if>
				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<li><a href="#" onclick="location.href='admin_hostList?pageNum='+${index}+
								'&rowsPerPage=10&key='+document.getElementById('key').value">[${index}]</a></li>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="#" onclick="location.href='admin_hostList?pageNum='+${pageMaker.endPage+1}+
									'&rowsPerPage=10&key='+document.getElementById('key').value">[다음]</a>
			</li>
		</c:if>	
			
	</ul>
</div>




