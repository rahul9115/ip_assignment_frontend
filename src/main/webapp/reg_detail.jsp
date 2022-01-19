<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");
 %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
	<script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script>
	
	<script src=
"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
	</script>
	
	<script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
	</script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip_assignment?useSSL=false", "root", "rahul9115");
Statement s = connection.createStatement();
ResultSet rs = s.executeQuery("SELECT * FROM employee");
%>
<section class="vh-100 gradient-custom" >
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-12">
	  
        <div class="card" style="border-radius: 15px;">
          <div class="card-body">
<table class="table table-striped table-responsive-md btn-table">

  <thead>
    <tr>
      <th>ID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Email-ID</th>
	  <th>CV/Resume</th>
	  <th>Approval/Rejection</th>
    </tr>
  </thead>


  <tbody>
  <% while(rs.next()){ %>
    <tr>
      <th scope="row">1</th>
	  <td><%= rs.getString(3) %></td>
      <td><%= rs.getString(2) %></td>
	  <td><%= rs.getString(1) %></td>
	  <td>
	  <button class="btn btn-Info"><i class="fa fa-download"></i> Download Resume</button>
	  </td>
      <td>
	  <div class="row">
			<div class="col-5">
			<button type="button" class="btn btn-success btn-rounded btn-sm m-0">Approve</button>
			</div>
			<div class="col-5">
			<button type="button" class="btn btn-danger btn-rounded btn-sm m-0">Decline</button>
			</div>
		</div>
      </td>
      
    </tr>
    

    <% } %>
      
  </tbody>

</table>
</div>
        </div>
 </div>
    </div>
  </div>
</section>
</body>
</html>