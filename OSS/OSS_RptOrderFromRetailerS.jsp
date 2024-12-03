<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Report Order From</title>
	</head>
	<body background-color="black">
<%!
	Connection conn;
	Statement stmtData;
	ResultSet rsData;
	String ONo,Date,RName,RetCode,Loc,City,State,GST,SlNo,PCode,PName,Category,Price,OQty,Amount;
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
<%
    RName=request.getParameter("txtRName");
%>
<center>
	<font color="red" size="5"face="Copperplate Gothic" >
		<b>One Stop Shop Super Mart<br>
			Madhupatna<br>
			Cuttack-753010<br>
			Odisha<b>
	</font>
	<h2>Order From Retailer<h2><h3 style="color: rgb(255, 0, 191);">[<%=RName%>]</h3></h2>
	<table width="100%">
		<tr bgcolor="lightgreen" height="50">
			<td>SL_No</td>
			<td>ONo</td>
			<td>Date</td>
			<td>RName</td>
			<td>RetCode</td>
			<td>Loc</td>
			<td>City</td>
			<td>State</td>
			<td>GST</td>
			<td>SlNo</td>
			<td>PCode</td>
			<td>PName</td>
			<td>Category</td>
			<td>Price</td>
			<td>OQty</td>
			<td>Amount</td>
		</tr>
<%
doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblorderfrom where RName='"+RName+"'");
		SL_No=1;
		while(rsData.next())
		{
			ONo=rsData.getString("ONo");
			Date=rsData.getString("Date");
			RName=rsData.getString("RName");
			RetCode=rsData.getString("RetCode");
			Loc=rsData.getString("Loc");
			City=rsData.getString("City");
			State=rsData.getString("State");
			GST=rsData.getString("GST");
			SlNo=rsData.getString("SlNo");
			PCode=rsData.getString("PCode");
			PName=rsData.getString("PName");
			Category=rsData.getString("Category");
			Price=rsData.getString("Price");
			OQty=rsData.getString("OQty");
			Amount=rsData.getString("Amount");
		
			if(SL_No % 2==0)
				out.println("<tr bgcolor=pink>");
			else
				out.println("<tr>");
%>
				<td><%=SL_No%></td>
				<td><%=ONo%></td>
				<td><%=Date%></td>
				<td><%=RName%></td>
				<td><%=RetCode%></td>
				<td><%=Loc%></td>
				<td><%=City%></td>
				<td><%=State%></td>
				<td><%=GST%></td>
				<td><%=SlNo%></td>
				<td><%=PCode%></td>
				<td><%=PName%></td>
				<td><%=Category%></td>
				<td><%=OQty%></td>
				<td><%=Price%></td>
				<td><%=Amount%></td>
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