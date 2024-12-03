<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Report</title>
	</head>
	<body background="Pink">
<%!
	Connection conn;
	Statement stmtData ;
	ResultSet rsData ;
	String PCCode,PCName;
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
	<h2>Product Category Code Information<h2>
	<table width="100%">
		<tr bgcolor="lightgreen" height="50">
			<td>SL_No</td>
			<td>PCCode No</td>
			<td>PCName</td>
		</tr>
<%
doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblproductcatg");
		SL_No=1;
		while(rsData.next())
		{
			PCCode=rsData.getString("PCCode");
			PCName=rsData.getString("PCName");
			
			if(SL_No % 2==1)
				out.println("<tr bgcolor=pink>");
			else
				out.println("<tr>");
%>
				<td><%=SL_No%></td>
				<td><%=PCCode%></td>
				<td><%=PCName%></td>
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