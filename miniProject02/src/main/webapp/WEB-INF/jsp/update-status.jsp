<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>Update Status for Test</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="googlebot" content="noindex, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="/css/result-light.css">
    <link rel="stylesheet" type="text/css" href="https://bootswatch.com/4/superhero/bootstrap.min.css">
    <script type="text/javascript" src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .active{
            background-color:#2b3e50;
            border-radius: 5px;
        }
        .nav-item{
            margin: 5px;
        }
        .navbar{
            margin-bottom: 10px;
        }
        .form{
            width: 60%;
            margin: auto;
        }
        
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <h3 class="navbar-brand">COVID-19 Testing Portal</h3>
  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="/home">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/add">Add Test</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/view">View Tests</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/update">Update Status</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/today">View Day-Wise Report</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/complete">View Complete Report</a>
      </li>
    </ul>
  </div>
</nav>
<div class="form">
    <legend>Updation for the Test with test id : ${test.id}</legend>
    <form:form action="/updateStatus/${test.id}" method="post" modelAttribute="test">
<div class="form-group">
    <label for="status">Status:</label>
    <form:select class="form-control" path="status" name="status" id="status" required="">
        <option value="" selected disabled>--Select--</option>
      <option value="Positive">Positive</option>
      <option value="Negative">Negative</option>
    </form:select>
  </div>
  <button type="submit" class="btn btn-primary">Update</button>
  <a class=" btn btn-primary " href="/update">Cancel</a>

  </form:form>
  </div>
</body>
</html>
