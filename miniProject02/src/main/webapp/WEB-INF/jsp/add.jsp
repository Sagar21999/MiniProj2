<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>Add Test</title>
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
       #add{
            width: 65%;
            margin: auto;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .error{
        color:red;
        }
        .form-check{
          display: inline;
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
      <li class="nav-item active">
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
      <li class="nav-item">
        <a class="nav-link" href="/complete">View Complete Report</a>
      </li>
    </ul>
  </div>
</nav>
<div class="tab-pane fade show" id="add">
        
  <form:form method="post" action="/addTest" modelAttribute="test">
    <fieldset>
      <legend>
        Enter Testing Details.
      </legend>
      <div class="form-group">
        <label class="col-form-label" for="patientName">Patient Name:</label>
        <form:input type="text" path="patientName" class="form-control" placeholder="Patient Name" id="patientName" />
        <form:errors class="error" path="patientName"/>
      </div>
      <div class="form-group">
        <label class="col-form-label" for="age">Age:</label>
        <form:input type="number" path="age" class="form-control" placeholder="Age in years" id="age" />
        <form:errors class="error" path="age"/>
      </div>
        <legend>Gender:</legend>
      <div class="form-check">
        <label class="form-check-label">
          <form:radiobutton class="form-check-input" name="gender" path="gender" id="Male" value="Male" checked="" />
          Male
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <form:radiobutton class="form-check-input" name="gender" path="gender" id="Female" value="Female" />
          Female
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <form:radiobutton class="form-check-input" name="gender" path="gender" id="Others" value="Others" />
          Others
        </label>
        <form:errors class="error" path="gender"/>
      </div>
      <div class="form-group">
        <label for="bloodGroup">Blood Group:</label>
        <form:select class="form-control" path="bloodGroup" id="bloodGroup">
          <option>O+</option>
          <option>O-</option>
          <option>A+</option>
          <option>A-</option>
          <option>B+</option>
          <option>B-</option>
          <option>AB+</option>
          <option>AB-</option>
        </form:select>
        <form:errors class="error" path="bloodGroup"/>
      </div>
      <div class="form-group">
        <label class="col-form-label" for="adhaar">Adhaar Card Number:</label>
        <form:input type="number" path="adhaar" class="form-control" minlength="12" maxlength="12" placeholder="XXXX XXXX XXXX" id="adhaar" />
        <form:errors class="error" path="adhaar"/>
      </div>
      <div class="form-group">
        <label class="col-form-label" for="contact">Contact Number:</label>
        <form:input type="tel" path="contact" minlength="10" maxlength="10" class="form-control" placeholder="Contact Number" id="contact" />
        <form:errors class="error" path="contact"/>
      </div>
      
      
      <button type="submit" class="btn btn-primary">Submit</button>
      <button type="reset" class="btn btn-primary">Reset</button>
    </fieldset>
  </form:form>
</div>
</body>
</html>
