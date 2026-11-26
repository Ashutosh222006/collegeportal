<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<%@include file="/common/common_css.html"%>

<style>

.w-100
{
height:60vh;
}

</style>
</head>
<body class="bg-image" >
	<!-- top header -->

	<%@ include file="/common/top_header.html"%>

	<!-- normal header -->

	<%@ include file="/common/header.html"%>

	<!-- main div -->

	<div class="main-div">


<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/collegeportal/images/cafe.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/collegeportal/images/audi.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/collegeportal/images/lib.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


	</div>

	<%@include file="/common/footer.html"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
		
				<script src="/collegeportal/javascript/custom_validation.js"></script>
		
		
	<!-- include -->

	<script src="/collegeportal/javascript/custom_validation.js"></script>

</body>
</html>