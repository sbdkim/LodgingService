<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class=top_home >
	<!-- image + search box -->
	<div class="alignform" style="padding-top: 10px;  height: 100%; align-items: center; "> 
	<form action="search"
		name="f" method="get" style="margin-top: 200px;">
		<div class=search_room style="padding-top: 10px;  height: 50%; align-items: center; ">
			<!-- searchbox start-->
			<div style="border-left: 1px solid #c8c8c8; margin-right: 10px; display:inline-block">
				<input type=search class=main_search_text placeholder=서울,서초구
					name="address" required>
			</div>
			<div class=main_checkinout style="display:inline-block">
				<div role=button style="display:inline-block">
					<div class="main_checkinout_buttonbox" style="display:inline-block">
						<div style="display:inline-block">
							<input type='date' id="checkin" min="${today }" value="${today }"
								class="main_checkin_1" name="checkin" onchange="dateChk()"
								required>
						</div>
						<div style="display:inline-block">
							<input type='date' id="checkout" min="${tomorrow }"
								value="${tomorrow }" class="main_checkout_1" name="checkout"
								onchange="dateChk()" required>
						</div>
					</div>
				</div>
			</div>

			<div class=main_count_box style="display:inline-block">
				<div role="button">
					<input type="hidden" name="ro_count" value="2">
					<!-- select 저장용 -->
					<select id="select_ro_count" class="form-select form-select-lg" 
						onchange="change_ro_count()" style="border: none; height:40px; width: 40px; border-radius: 5px;" >
						<option value="1">1</option>
						<option value="2" selected>2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>
			</div>



			<div class="main_search_button_box"  style="display:inline-block">
				<button type=submit style="border-left: 1px solid #c8c8c8;"
					class="btn main_search_button">검색</button>
			</div>
		</div>
		<!-- searchbox end -->

	</form>
</div>

</div>







































<section >
	<div class="row" style="display: flex ; justify-content: center">
		<div class="cell" style="padding:5px">
			<img src="css/dummy.jpg" alt="City 1" style="width:100%">
			<p>City 1</p>
		</div>
		<div class="cell" style="padding:5px">
			<img src="css/dummy.jpg" alt="City 2" style="width:100%">
			<p>City 2</p>
		</div>
		<div class="cell" style="padding:5px">
			<img src="css/dummy.jpg" alt="City 3" style="width:100%">
			<p>City 3</p>
		</div>
		<div class="cell" style="padding:5px">
			<img src="css/dummy.jpg" alt="City 4" style="width:100%">
			<p>City 4</p>
		</div>
	</div>
	<div class="row" style="display: flex ; justify-content: center">
		<div class="cell" style="padding:5px">
			<img src="css/dummy.jpg" alt="City 5" style="width:100%">
			<p>City 5</p>
		</div>
		<div class="cell" style="padding:5px">
			<img src="css/dummy.jpg" alt="City 6" style="width:100%">
			<p>City 6</p>
		</div>
		<div class="cell" style="padding:5px">
			<img src="css/dummy.jpg" alt="City 7" style="width:100%">
			<p>City 7</p>
		</div>
		<div class="cell" style="padding:5px">
			<img src="css/dummy.jpg" alt="City 8" style="width:100%">
			<p>City 8</p>
		</div>
	</div>
</section>


</body>





<%@ include file="footer.jsp"%>
