<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Report Retailer</title>
	</head>
	<body background="grey">
<%!
	Connection conn;
	Statement stmtData;
	ResultSet rsData;
	String RCode,RName,CPerson,Loc,City,State,Phone,Email,GST,Date,Password,Photo;
	int SL_No;
	
	public void doConnect()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException cnfe)
		{
			System.out.println("Unable to Load Driver");
		}
		try
		{
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/ossdb","root","root1");
		}
		catch(SQLException se)
		{
			System.out.println("Unable to Connect with DataBase");
		}
	}
%>

<center>
	<font color="red" size="5"face="Copperplate Gothic" >
		<b>One Stop Shop Super Mart<br>
			Madhupatna<br>
			Cuttack-753010<br>
			Odisha<b>
	</font>
	<h2>Retailer Information<h2>
	<table width="100%">
		<tr bgcolor="lightgreen" height="50">
			<td>SL_No</td>
			<td>RCode No</td>
			<td>RName</td>
			<td>CPerson</td>
			<td>Loc</td>
			<td>City</td>
			<td>State</td>
			<td>Phone</td>
			<td>Email</td>
			<td>GST</td>
			<td>Date</td>
			<td>Password</td>
			<td>Photo</td>
		</tr>
<%
doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblretailer");
		SL_No=1;
		while(rsData.next())
		{
			RCode=rsData.getString("RCode");
			RName=rsData.getString("RName");
			CPerson=rsData.getString("CPerson");
			Loc=rsData.getString("Loc");
			City=rsData.getString("City");
			State=rsData.getString("State");
			Phone=rsData.getString("Phone");
			Email=rsData.getString("Email");
			GST=rsData.getString("GST");
			Date=rsData.getString("Date");
			Password=rsData.getString("Password");
			Photo=rsData.getString("Photo");
		
			if(SL_No % 2==0)
				out.println("<tr bgcolor=pink>");
			else
				out.println("<tr>");
%>
				<td><%=SL_No%></td>
				<td><%=RCode%></td>
				<td><%=RName%></td>
				<td><%=CPerson%></td>
				<td><%=Loc%></td>
				<td><%=City%></td>
				<td><%=State%></td>
				<td><%=Phone%></td>
				<td><%=Email%></td>
				<td><%=GST%></td>
				<td><%=Date%></td>
				<td><%=Password%></td>
				<td><%=Photo%></td>
			</tr>
<%
			SL_No=SL_No+1;
		}
	}
	catch(SQLException se)
	{
		System.out.println("Unable to Fill Array"+se);
	}
%>
	</table>
	</center>
</body>
<html>