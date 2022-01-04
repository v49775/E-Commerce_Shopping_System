<%@page import="java.sql.*" %>
<%@page import="os.project.connectionProvider" %>

<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mobilenumber=request.getParameter("mobilenumber");
	String securityQuetion=request.getParameter("securityQuetion");
	String answer=request.getParameter("answer");
	String newpassword=request.getParameter("password");
	
	
	int check=0;
	try{
		Connection con=connectionProvider.getcon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and MobileNumber='"+mobilenumber+"' and securityQuetion='"+securityQuetion+"' and answer='"+answer+"' ");
		while(rs.next()){
			check=1;
			st.executeUpdate("update user set password='"+newpassword+"' where email='"+email+"'");
			response.sendRedirect("forgotPassword.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}
	}
	catch(Exception e){
		System.out.println(e);
	
	}
	
	
%>