<%@page import="java.sql.*" %>
<%@page import="os.project.connectionProvider" %>

<%
String email=session.getAttribute("email").toString();
String newMobileNo=request.getParameter("newMobileNo");
String password=request.getParameter("password");

int check=0;
try{
	Connection con=connectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+password+"'");
	while(rs.next()){		
		check=1;
		st.executeUpdate("update user set MobileNumber='"+newMobileNo+"' where email='"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	
	}
	if(check==0){
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
					
			
			
}
catch(Exception e){
	System.out.println(e);
}




%>