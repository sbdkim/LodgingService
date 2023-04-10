<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
header{
  position: fixed;
}
</style>

<div class=top_home >

	


	<!-- image + search box -->
	<div class="alignform" style="padding-top: 10px;  height: 100%; align-items: center; "> 
	<!-- Title -->
    <div class="main_title" style="text-align: left;  padding-left: 30% ;font-size: 60px; font-weight: bold; padding-top: 50px; margin-top: 130px;">
        다음  <span class = "auto-type"></span>
    </div>
    
    <script src="https://unpkg.com/typed.js@2.0.15/dist/typed.umd.js"></script>
    
    <script>
    var typed = new Typed('.auto-type', {
      strings: ["여행지를 찾아보세요!", "여행지는 어디인가요?"],
      typeSpeed: 150,
      backSpeed: 150,
      loop: true
    });
  </script>
    
    
    
    
	<form action="acc_search_list" name="f" method="get" style="margin-top: 20px;">
	
		<div class=search_room style="padding-top: 10px;  height: 50%; align-items: center; ">
			<!-- searchbox start-->
			<div style="margin-right: 10px; display:inline-block">
				<input type=search class=main_search_text placeholder=서울,서초구
					name="key" id="key">
			</div>
			
			
			<div class=main_checkinout style="display:inline-block">
				<div role=button style="display:inline-block">
					<div class="main_checkinout_buttonbox" style="display:inline-block">
						<div style="display:inline-block">
							<input type='date' id="checkin"
									class="main_checkin_1" name="checkin" 
								required>
						</div>
						<div style="display:inline-block">
							<input type='date' id="checkout"
								class="main_checkout_1" name="checkout"
								 required>
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
				<button type=submit
					class="btn main_search_button">검색</button>
			</div>
		</div>
		<!-- searchbox end -->

	</form>
</div>

</div>





<script>
  // Get today's date
  const today = new Date().toISOString().split('T')[0];
  
  
  const tomorrow = new Date();
  tomorrow.setDate(tomorrow.getDate() + 1);
  const tomorrowISO = tomorrow.toISOString().split('T')[0];
  
  // Set the minimum date of the input
  document.getElementById("checkin").setAttribute("min", today);
  document.getElementById("checkout").setAttribute("min", tomorrowISO);
  
  //set default date for the date inputs
  document.getElementById("checkin").setAttribute("value", today);
  document.getElementById("checkout").setAttribute("value", tomorrowISO);
</script>



			<input type="hidden" id="today" name="today">
			<input type="hidden" id="tomorrow" name="tomorrow">
<section>
	<div class="white-box" style="border: 1px solid #e0e0e0; border-radius: 8px; padding: 10px; margin: 30px">
		<h3 style="font-weight: bold; margin-bottom: 10px; text-align: center" >🗺️ 인기 목적지별 숙소를 확인하세요</h3>
		<div id="regionacc" class="row" style="display: flex ; justify-content: center">
			<div class="cell" style="padding:5px">
				<a href="#" onclick="location.href='acc_search_list?key=서울&checkin='+document.getElementById('today').value+'&checkout='+document.getElementById('tomorrow').value+'&ro_count=2'">					
					<img src="css/seoul.jpg" alt="City 1" style="width:100%">
					<p>서울</p>
				</a>
			</div>
			<div class="cell" style="padding:5px">
				<a href="#" onclick="location.href='acc_search_list?key=부산&checkin='+document.getElementById('today').value+'&checkout='+document.getElementById('tomorrow').value+'&ro_count=2'">
					<img src="css/busan.jpg" alt="City 2" style="width:100%">
					<p>부산</p>
				</a>
			</div>
			<div class="cell" style="padding:5px">
				<a href="#" onclick="location.href='acc_search_list?key=제주&checkin='+document.getElementById('today').value+'&checkout='+document.getElementById('tomorrow').value+'&ro_count=2'">
					<img src="css/jeju.jpg" alt="City 3" style="width:100%">
					<p>제주</p>
				</a>
			</div>
			<div class="cell" style="padding:5px">
				<a href="#" onclick="location.href='acc_search_list?key=대구&checkin='+document.getElementById('today').value+'&checkout='+document.getElementById('tomorrow').value+'&ro_count=2'">
					<img src="css/daegu.jpg" alt="City 4" style="width:100%">
					<p>대구</p>
				</a>
				
			</div>
		</div>
	</div>
	
	<div class="white-box" style="border: 1px solid #e0e0e0; border-radius: 8px; padding: 10px; margin: 30px;">
		<h3 style="font-weight: bold; margin-bottom: 10px; text-align: center">🔥 최근에 가장 인기 많은 숙소를 방문하세요</h3>
		
		
		
		
		
		
		
		
		
		
		
	<div id = "trendingacc" class="row" style="display: flex ; justify-content: center">
		<c:forEach items="${bestAccommodationList}" var="bookingVO">
		
	    	<div class="cell" style="padding:5px">
	    	<a href="#" onclick="location.href='room?aseq=${bookingVO.aseq}&checkin='+document.getElementById('today').value+'&checkout='+document.getElementById('tomorrow').value">
		        <img src="accommodation_images/${bookingVO.aseq}.jpg" style="width:100%">
			     <p>${bookingVO.aname}</p>
			   </a>
		    </div>
		   
		</c:forEach>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>
</section>

<script>
  document.getElementById("today").setAttribute("value", today);
  document.getElementById("tomorrow").setAttribute("value", tomorrowISO);
</script>




<%@ include file="footer.jsp"%>
