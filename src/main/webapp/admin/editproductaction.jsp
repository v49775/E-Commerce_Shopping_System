<%@page import="java.sql.*" %>
<%@page import="os.project.connectionProvider" %>

<%

String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
try{
	Connection con=connectionProvider.getcon();
	Statement st=con.createStatement();
	st.executeUpdate("update product set name='"+name+"',catagory='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	if(active.equals("No")){
		st.executeUpdate("delete from card productid='"+id+"' and address is NULL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");

}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}

%>