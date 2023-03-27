<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<section class="hero-section">
<form>
	<label for="region">지역</label> <input type="text" id="region"
		name="region"> <label for="checkin">체크인</label> <input
		type="date" id="checkin" name="checkin"> <label for="checkout">체크아웃</label>
	<input type="date" id="checkout" name="checkout"> <label
		for="guests">인원</label> <input type="number" id="guests" name="guests">

	<button type="submit">검색</button>
</form>
</section>

<section>
	<div class="row">
		<div class="cell">
			<img src="css/dummy.jpg" alt="City 1">
			<p>City 1</p>
		</div>
		<div class="cell">
			<img src="css/dummy.jpg" alt="City 2">
			<p>City 2</p>
		</div>
		<div class="cell">
			<img src="css/dummy.jpg" alt="City 3">
			<p>City 3</p>
		</div>
		<div class="cell">
			<img src="css/dummy.jpg" alt="City 4">
			<p>City 4</p>
		</div>
	</div>
	<div class="row">
		<div class="cell">
			<img src="css/dummy.jpg" alt="City 5">
			<p>City 5</p>
		</div>
		<div class="cell">
			<img src="css/dummy.jpg" alt="City 6">
			<p>City 6</p>
		</div>
		<div class="cell">
			<img src="css/dummy.jpg" alt="City 7">
			<p>City 7</p>
		</div>
		<div class="cell">
			<img src="css/dummy.jpg" alt="City 8">
			<p>City 8</p>
		</div>
	</div>
</section>








<%@ include file="footer.jsp"%>
