<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Report Comp Requisition</title>
	</head>
	<body background="grey">
<%!
	Connection conn;
	Statement stmtData;
	ResultSet rsData;
	String ReqNo1,Date1,CName1,CRegdNo1,Locality1,City1,State1,GST1,SlNo1,PCode1,PName1,Category1,Price1,OQty1,Amount1;
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
	CName1=request.getParameter("cmbCName");
%>

<center>
	<font color="red" size="5" face="Copperplate Gothic" >
		<b>One Stop Shop Super Mart<br>
			Madhupatna<br>
			Cuttack-753010<br>
			Odisha<b>
	</font>
	<h2>Company Requisition<h2><h3 style="color: rgb(47, 255, 0);">[<%=CName1%>]</h3></h2>
	<table width="100%">
		<tr bgcolor="lightgreen" height="50">
			<td>SL_No</td>
			<td>ReqNo1 No</td>
			<td>Date1</td>
			<td>CName1</td>
			<td>CRegdNo1</td>
			<td>Locality1</td>
			<td>City1</td>
			<td>State1</td>
			<td>GST1</td>
			<td>SlNo1</td>
			<td>PCode1</td>
			<td>PName1</td>
			<td>Category1</td>
			<td>OQty1</td>
			<td>Amount1</td>
		</tr>
<%
doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblcompreq where CName1='"+CName1+"'");
		SL_No=1;
		while(rsData.next())
		{
			ReqNo1=rsData.getString("ReqNo1");
			Date1=rsData.getString("Date1");
			CName1=rsData.getString("CName1");
			CRegdNo1=rsData.getString("CRegdNo1");
			Locality1=rsData.getString("Locality1");
			City1=rsData.getString("City1");
			State1=rsData.getString("State1");
			GST1=rsData.getString("GST1");
			SlNo1=rsData.getString("SlNo1");
			PCode1=rsData.getString("PCode1");
			PName1=rsData.getString("PName1");
			Category1=rsData.getString("Category1");
			OQty1=rsData.getString("OQty1");
			Amount1=rsData.getString("Amount1");
		
			if(SL_No % 2==0)
				out.println("<tr bgcolor=pink>");
			else
				out.println("<tr>");
%>
				<td><%=SL_No%></td>
				<td><%=ReqNo1%></td>
				<td><%=Date1%></td>
				<td><%=CName1%></td>
				<td><%=CRegdNo1%></td>
				<td><%=Locality1%></td>
				<td><%=City1%></td>
				<td><%=State1%></td>
				<td><%=GST1%></td>
				<td><%=SlNo1%></td>
				<td><%=PCode1%></td>
				<td><%=PName1%></td>
				<td><%=Category1%></td>
				<td><%=OQty1%></td>
				<td><%=Amount1%></td>
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