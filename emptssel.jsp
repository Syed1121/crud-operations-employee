<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String driver="org.gjt.mm.mysql.Driver";
String QUERY = "select eno,ename,esal,egrade from myemp where eno =?";
try
{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata", "root", "Pyari$$");
int eno=Integer.parseInt(request.getParameter("teno"));
PreparedStatement preparedStatement = connection.prepareStatement(QUERY);
            preparedStatement.setInt(1, eno);
            System.out.println(preparedStatement);
            
            ResultSet rs = preparedStatement.executeQuery();

 while (rs.next()) 
{

String tename=rs.getString("ename");
int tesal=rs.getInt("esal");
String tegrade=rs.getString("egrade");
out.println(eno);
}
eno++;
        } catch (Exception ex) 
{
            out.print(ex);
        }


%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bootstrap Web Page</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <style>
    body {
      background-image: url('/mypro/company.jpg'); 
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }
h2{
color:black;
}
  </style>
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" href="#">Karim Tech</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/mypro/home.html">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empins.jsp">Insert</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empasel.jsp">List</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empssel.jsp">Record</a>
          </li>
	  <li class="nav-item">
            <a class="nav-link" href="/mypro/del.jsp">Delete</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<form  name="fm1" method="POST" action="/myjsp/empssel.jsp">
Emloyee Number:<input type="text" name="teno"><br><br>
<input type="submit" value="submit">
<input type="Reset" value="reset">
</form>
</body>
</html>

