<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>Complete Report</title>
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
          width: 70%;
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
      <li class="nav-item">
        <a class="nav-link" href="/update">Update Status</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/today">View Day-Wise Report</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/complete">View Complete Report</a>
      </li>
    </ul>
  </div>
</nav>

<table class="table table-hover">
  <thead>
    <tr class="table-primary">
      <th scope="col">Type</th>
      <th scope="col">Today</th>
      <th scope="col">This Month</th>
      <th scope="col">Overall</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Tests Performed</th>
      <td>${testCountToday}</td>
      <td>${testCountMonth}</td>
      <td>${testCountOverall}</td>
    </tr>
    <tr class="table-danger">
      <th scope="row">Positive</th>
      <td>${positiveCountToday}</td>
      <td>${positiveCountMonth}</td>
      <td>${positiveCountOverall}</td>
    </tr>
    <tr class="table-success">
      <th scope="row">Negative</th>
      <td>${negativeCountToday}</td>
      <td>${negativeCountMonth}</td>
      <td>${negativeCountOverall}</td>
    </tr>
    <tr class="table-warning">
      <th scope="row">Awaiting Results</th>
      <td>${pendingCountToday}</td>
      <td>${pendingCountMonth}</td>
      <td>${pendingCountOverall}</td>
    </tr>

    
  </tbody>
</table>
</body>
</html>
