<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>
<article>
<h1>숙소 검색</h1>
<form name="frm" id="acc_form" method="post" style="display:block">
	<table>
		<tr>
			<td width="650">
				지역
				<input type="text" name="key" id="key">
				<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search()">
				<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total()">
			</td>
		</tr>
	</table>
	
	<table id="accommodationList">
		<tr>
			<th>번호</th><th>숙소명</th><th>주소</th><th>사업자이메일</th><th>전화번호</th>
		</tr>
		<c:choose>
			<c:when test="${accommodationListSize<=0}">
				<tr>
					<td width="100%" colspan="5" align="center" height="23">
					등록된 숙소가 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${accommodationList}" var="accommodationVO" varStatus="status">
				<tr>
				<td height="23" align="center">${status.count}</td>
				<td style="test-align:left; padding-left:50px; padding-right:0px">
				   <a href="#" onclick="go_detail('${pageMaker.criteria.pageNum}','${pageMaker.criteria.rowsPerPage}','${accommodationVO.aseq}')"></a>
			  	   <a href="#" onclick="go_detail('${accommodationVO.aseq}')">    
			       ${accommodationVO.address}
			       </a>
			    </td>
				</tr>
				</c:forEach>
				<tr><td colspan="6" style="text-align:center;"> ${paging} </td></tr>
			</c:otherwise>
		</c:choose>
	</table>
</form>
</article>
<%@ include file="../footer.jsp"%>