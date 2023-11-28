<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>View Status</title>
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
          margin-bottom: 20px;
        }
        .table{
          width: 80%;
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
      <li class="nav-item active">
        <a class="nav-link" href="/view">View Tests</a>
      </li>
      <li class="nav-item">
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
<table class="table table-hover">
  <thead>
    <tr class="table-primary">
      <th scope="col">Id</th>
      <th scope="col">Patient Name</th>
      <th scope="col">Age</th>
      <th scope="col">Gender</th>
      <th scope="col">Blood Group</th>
      <th scope="col">Adhaar Card Number</th>
      <th scope="col">Contact Number</th>
      <th scope="col">Date Of Test</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="test" items="${testList}">
    <tr class="table-dark">
      <th scope="col">${test.id}</th>
      <th scope="col">${test.patientName}</th>
      <th scope="col">${test.age}</th>
      <th scope="col">${test.gender}</th>
      <th scope="col">${test.bloodGroup}</th>
      <th scope="col">${test.adhaar}</th>
      <th scope="col">${test.contact}</th>
      <th scope="col">${test.dateOfTest}</th>
      <th scope="col">${test.status}</th>
    </tr>
    </c:forEach>

    
  </tbody>
</table>
</body>
</html>
