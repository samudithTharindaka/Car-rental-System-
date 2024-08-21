<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
` <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title</title>


<style>
body{
	overflow:hidden;
}
.courosalImages{
    height:100vh;
    object-fit:cover;
}
.overlay-content{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 1000; /* Make sure this value is higher than the z-index of the carousel */
    background-color: rgba(255, 255, 255, 0.8); /* Add a background color with some transparency */
    padding: 20px;
    border-radius: 10px;
    text-align: center;
}
.carousel{
    z-index:1;
}
.row{
position: absolute;
    top: 80%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 1000; 

}
.hidden{
background-color:#EA3C54;
padding:2%,0,2%,0;
	}


</style>
</head>
<body  style="padding-top:0;">

<nav class="navbar navbar-expand-lg bg-body-tertiary" style="position: absolute; top: 0; width: 100%; background-color: rgba(0, 0, 0, 0.0); z-index: 100;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">RentACar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Vehicles</a>
        </li>
     
      </ul>
  
      <a class="btn btn-outline-success" href="login.jsp" style="margin-right: 20px;">Login</a>
      <a class="btn btn-outline-danger" href="Register.jsp" style="margin-right: 20px;">Register</a>
      
    </div>
  </div>
</nav>



<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/landingPage/1.jpg" class="d-block w-100 courosalImages" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/landingPage/2.jpg" class="d-block w-100 courosalImages" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/landingPage/3.jpg" class="d-block w-100 courosalImages" alt="...">
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

<div class="overlay-content">
<div class="hidden">
<p>${regresult}</p>
</div>
    <h2>Welcome to our Car Rental Service</h2>
    <p>Explore our wide range of vehicles and find the perfect one for your needs.</p>
    <a href="#" class="btn btn-primary">Browse Vehicles</a>
</div>

<div class="row">
	<div class="col-4">
	<div class="card" style="width: 18rem;">
  <div class="card-body">
  <h3>100</h3>
    <h5 class="card-title">Customer Satisfaction</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    
  </div>
</div>
	</div>
	<div class="col-4">
	<div class="card" style="width: 18rem;">
  <div class="card-body">
  	<h3>584</h3>
    <h5 class="card-title">Vehicles</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    
  </div>
</div>
	</div>
	<div class="col-4">
	<div class="card" style="width: 18rem;">
  <div class="card-body">
  <h3>1054</h3>
    <h5 class="card-title">Users</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    
  </div>
</div>
	</div>

</div>




<script>
    // Function to animate number counting
    function animateValue(element, start, end, duration) {
        let range = end - start;
        let current = start;
        let increment = end > start ? 1 : -1;
        let stepTime = Math.abs(Math.floor(duration / range));
        let timer = setInterval(function () {
            current += increment;
            element.textContent = current;
            if (current == end) {
                clearInterval(timer);
            }
        }, stepTime);
    }

    // Get all h3 elements inside the cards
    let h3Elements = document.querySelectorAll('.card h3');

    // Loop through each h3 element and animate its value
    h3Elements.forEach(function (h3) {
        let startValue = 0; // Start value for counting animation
        let endValue = parseInt(h3.textContent); // Get the end value from the text content of the h3 element
        let duration = 3000; // Duration of the animation in milliseconds
        animateValue(h3, startValue, endValue, duration);
    });
</script>

</body>
</html>
