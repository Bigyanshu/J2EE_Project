<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Report Company</title>
	</head>
	<body background="Pink">
<%!
	Connection conn;
	Statement stmtRegd,stmtData;
	ResultSet rsRegd,rsData;
	String Regd,CName,HOC,Loc,City,State,Phone,Email,GST,Date;
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
	<h2>Company Information<h2>
	<table width="100%">
		<tr bgcolor="lightgreen" height="50">
			<td>SL_No</td>
			<td>Regd No</td>
			<td>CName</td>
			<td>HOC</td>
			<td>Loc</td>
			<td>City</td>
			<td>State</td>
			<td>Phone</td>
			<td>Email</td>
			<td>GST</td>
			<td>Date</td>
		</tr>
<%
doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblcompany");
		SL_No=1;
		while(rsData.next())
		{
			Regd=rsData.getString("Regd");
			CName=rsData.getString("CName");
			HOC=rsData.getString("HOC");
			Loc=rsData.getString("Loc");
			City=rsData.getString("City");
			State=rsData.getString("State");
			Phone=rsData.getString("Phone");
			Email=rsData.getString("Email");
			GST=rsData.getString("GST");
			Date=rsData.getString("Date");
			
			if(SL_No % 2==1)
				out.println("<tr bgcolor=pink>");
			else
				out.println("<tr>");
%>
				<td><%=SL_No%></td>
				<td><%=Regd%></td>
				<td><%=CName%></td>
				<td><%=HOC%></td>
				<td><%=Loc%></td>
				<td><%=City%></td>
				<td><%=State%></td>
				<td><%=Phone%></td>
				<td><%=Email%></td>
				<td><%=GST%></td>
				<td><%=Date%></td>
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