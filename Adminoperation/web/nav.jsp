<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.mini.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body class="margin">
<nav class="navbar navbar-inverse"">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div id="logo-brand" class="navbar-brand">
      <!-- <a id="logo" class="navbar-brand" href="#"> --><img src="Images/logo2.jpg" style="border-radius: 50%; width: 35px; height: 35px;"></div>
      <span class="main-title">Mr. Green's</span>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">

      	<!--LIST FOR NAVIGATION BAR-->
        
        <!--Start of Home-->
        <li class="active">
        	<a href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <!--End of Home-->

        <!--Start of About us
        <li>
        	<a href="#">About Us </a>
        </li>
        <!--End of About us -->
        <li>
          <a href="about.jsp">About us</a>
       </li>
         <!--Start of Contact us-->
        <li>
            <a href="contact-us.jsp">Contact Us </a>
        </li>
        <!--End of Contact us -->
        <!--Start of workout -->
      </ul>
  </div><!-- /.container-fluid -->
</nav>


<!-- Style for page -->
<style type="text/css">
  .main-title {
  color: green;
  width:bold;
  font-style: italic;
  font-size: 30px;
  font-family: 'Open Sans', sans-serif;
  float: left;
  margin-top: 6px;
  padding-right: 15px;
}
#logo-brand{
  margin-top: -5px;
}
.margin{
    margin-top: 0px;
    padding-top: 0px;
}
</style>

<!--loading java script for jquery and bootstrap.js-->
<script type="text/javascript" src="js/jquery.mini.js"></script>
<script type="text/javascript" src="js/bootstrap.mini.js"></script>
</body>
</html>