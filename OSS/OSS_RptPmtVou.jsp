<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Report Payment Voucher</title>
	</head>
	<body background-color="black">
<%!
	Connection conn;
	Statement stmtData;
	ResultSet rsData;
	String VNo,VDate,CName,Locality,City,State,PMode,RefNo,RDate,BName,Amount;
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
	<h2>Order From Retailer<h2>
	<table width="100%">
		<tr bgcolor="lightgreen" height="50">
			<td>SL_No</td>
			<td>VNo</td>
			<td>VDate</td>
			<td>CName</td>
			<td>Locality</td>
			<td>City</td>
			<td>State</td>
			<td>PMode</td>
			<td>RefNo</td>
			<td>RDate</td>
			<td>BName</td>
			<td>Amount</td>
		</tr>
<%
doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblpmtvou");
		SL_No=1;
		while(rsData.next())
		{
			VNo=rsData.getString("VNo");
			VDate=rsData.getString("VDate");
			CName=rsData.getString("CName");
			Locality=rsData.getString("Locality");
			City=rsData.getString("City");
			State=rsData.getString("State");
			PMode=rsData.getString("PMode");
			RefNo=rsData.getString("RefNo");
			RDate=rsData.getString("RDate");
			BName=rsData.getString("BName");
			Amount=rsData.getString("Amount");
		
			if(SL_No % 2==0)
				out.println("<tr bgcolor=pink>");
			else
				out.println("<tr>");
%>
				<td><%=SL_No%></td>
				<td><%=VNo%></td>
				<td><%=VDate%></td>
				<td><%=CName%></td>
				<td><%=Locality%></td>
				<td><%=City%></td>
				<td><%=State%></td>
				<td><%=PMode%></td>
				<td><%=RefNo%></td>
				<td><%=RDate%></td>
				<td><%=BName%></td>
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