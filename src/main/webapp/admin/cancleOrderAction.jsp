<%@page import="java.sql.*" %>
<%@page import="os.project.connectionProvider" %>


<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String Status="Cancle";

try{
	Connection con=connectionProvider.getcon();
	Statement st=con.createStatement();
	st.executeUpdate("update card set status='"+Status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancle");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}
%>

