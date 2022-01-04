<%@page import="java.sql.*" %>
<%@page import="os.project.connectionProvider" %>

<%
	Connection con=connectionProvider.getcon();
	Statement st=con.createStatement();
	String q1="create table user(name varchar(100),email varchar(100)primary key,MobileNumber bigint,securityQuetion varchar(200),answer varchar(200),password varchar(200),address varchar(100),city varchar(100),state varchar(100),country varchar(100))";
	String q2="create table product(id int,name varchar(200),catagory varchar(200),price int,active varchar(10))";
	String q3="create table card(email varchar(100),product_id int,quality int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobilenumber bigint,orderdate varchar(100),deliverydate varchar(100),paymentmethod varchar(100),transactionid varchar(100),status varchar(10))";
	String q4="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),PRIMARY KEY(id))";
	System.out.println(q1);
	System.out.println(q2);
	System.out.println(q3);
	System.out.println(q4);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	st.execute(q4);
		
	System.out.println("created table");
	con.close();
	
	
%>