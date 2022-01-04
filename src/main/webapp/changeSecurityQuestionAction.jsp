<%@page import="java.sql.*" %>
<%@page import="os.project.connectionProvider" %>

<%
String email=session.getAttribute("email").toString();
String securityQuetion=request.getParameter("securityQuetion");
String Password=request.getParameter("Password");
String newAnswer=request.getParameter("newAnswer");

int check=0;
try{
	Connection con=connectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+Password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update user set securityQuetion='"+securityQuetion+"',answer='"+newAnswer+"' where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	
	}
	if(check==0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
	}
}
catch(Exception e){
	System.out.println(e);
}

%>


  

