<%@ page language="java" import="java.sql.*" %>
<%
String driver = "org.gjt.mm.mysql.Driver";
String url = "jdbc:mysql://localhost:3306/empdata?user=root&password=Pyari$$";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName(driver);
    con = DriverManager.getConnection(url);
    
    if(request.getParameter("action") != null) {
        int eno = Integer.parseInt(request.getParameter("empeno"));
        String ename = request.getParameter("empename");
        int esal = Integer.parseInt(request.getParameter("empesal"));
        String egrade = request.getParameter("empegrade");
        
        pstmt = con.prepareStatement("UPDATE myemp SET ename=?, esal=?, egrade=? WHERE eno=?");
        pstmt.setString(1, ename);
        pstmt.setInt(2, esal);
        pstmt.setString(3, egrade);
        pstmt.setInt(4, eno);
        
        int rowsUpdated = pstmt.executeUpdate();
        
        if(rowsUpdated > 0) {
            out.println("<h2>Employee Data Updated Successfully!</h2>");
        } else {
            out.println("<h2>Failed to Update Employee Data. Employee with ENO " + eno + " does not exist.</h2>");
        }
    }
} catch(Exception ex) {
    out.println("<h2>Error: " + ex.getMessage() + "</h2>");
} finally {
    // Close resources
    try {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    } catch(SQLException ex) {
        out.println("<h2>Error closing resources: " + ex.getMessage() + "</h2>");
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee</title>
</head>
<body>
    <h1>Update Employee Data</h1>
    <form action="" method="post">
        <label for="empeno">Employee Number:</label>
        <input type="text" id="empeno" name="empeno" required><br><br>
        <label for="empename">Employee Name:</label>
        <input type="text" id="empename" name="empename" required><br><br>
        <label for="empesal">Employee Salary:</label>
        <input type="text" id="empesal" name="empesal" required><br><br>
        <label for="empegrade">Employee Grade:</label>
        <input type="text" id="empegrade" name="empegrade" required><br><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
