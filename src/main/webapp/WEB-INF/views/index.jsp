<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>EZEN 숙소 예약</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
  </head>
  <body>
    <header>
      <nav>
        <a href="#">탐색하기</a>
        <a href="#">호스트 되기</a>
        <a href="#">저장된 숙소</a>
        <a href="#">여행</a>
        <a href="#">메시지</a>
        <a href="#">도움말</a>
      </nav>
      <div class="logo">
        <a href="#">KStay</a>
      </div>
      <div class="buttons">
        <a href="#" class="signup-btn">Sign up</a>
        <a href="#" class="login-btn">Log in</a>
      </div>
    </header>
    <section class="hero-section">
      <div class="hero-text">
        <h1>Find a place to stay on KStay</h1>
        <p>Discover entire homes and private rooms perfect for any trip.</p>
        <div class="search-box">
          <input type="text" placeholder="Where are you going?">
          <input type="date" placeholder="Check in">
          <input type="date" placeholder="Check out">
          <input type="number" placeholder="Guests">
          <button>Search</button>
        </div>
      </div>
    </section>
    <section class="explore-section">
      <h2>Explore KStay</h2>
      <div class="explore-cards">
        <div class="card">
          <img src="https://picsum.photos/300/200" alt="Card image">
          <h3>Unique stays</h3>
        </div>
        <div class="card">
          <img src="https://picsum.photos/300/200" alt="Card image">
          <h3>Entire homes</h3>
        </div>
        <div class="card">
          <img src="https://picsum.photos/300/200" alt="Card image">
          <h3>Pets allowed</h3>
        </div>
        <div class="card">
          <img src="https://picsum.photos/300/200" alt="Card image">
          <h3>Outdoor getaways</h3>
        </div>
      </div>
    </section>
    <footer>
      <div class="logo">
        <a href="#">KStay</a>
      </div>
      <div class="footer-nav">
        <nav>
          <a href="#">개인정보 처리방침</a>
          <a href="#">이용약관</a>
          <a href="#">사이트맵</a>
          <a href="#">회사 세부정보</a>
        </nav>
      </div>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook-square"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
      </div>
    </footer>
    <script src="script.js"></script>
  </body>
</html>