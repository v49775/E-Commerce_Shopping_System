<%@page import="java.sql.*" %>
<%@page import="os.project.connectionProvider" %>


<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");

try{
	Connection con=connectionProvider.getcon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from card where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){
	System.out.println(e);
}

%>

