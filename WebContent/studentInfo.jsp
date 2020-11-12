<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"	
%>

<%@ page import = "java.sql.*" %>
    
<%	
	String id = request.getParameter("ID");
	String pw = request.getParameter("pw");
	
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?useSSL=false","root","1234");
	
	PreparedStatement stmt = conn.prepareStatement("select password from student where id = ?");
	stmt.setString(1, id);
	ResultSet rs = stmt.executeQuery();
	
	while (rs.next()){
		String holder = rs.getString("password");
		
		if (pw != holder)
			response.sendRedirect("/register.html");
		else
			continue;
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>You Passed</h1>
</body>
</html>