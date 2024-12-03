<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Detail Report Prod Info</title>
	</head>
	<body background="grey">
<%!
	Connection conn;
	Statement stmtData;
	ResultSet rsData;
	String CName,CRCode,PCName,PCCode,PCode,PName,Unit,CPrice,SPrice,TSlab,Stock,Photo;
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
	CName=request.getParameter("cmbCName");
%>

<center>
	<font color="red" size="5"face="Copperplate Gothic" >
		<b>One Stop Shop Super Mart<br>
			Madhupatna<br>
			Cuttack-753010<br>
			Odisha<b>
	</font>
	<h2>Product Information	<h3 style="color: red;">[<%=CName%>]</h3><h2>
	<table width="100%">
		<tr bgcolor="lightgreen" height="50">
			<td>SL_No</td>
			<td>CName</td>
			<td>CRCode No</td>
			<td>PCName</td>
			<td>PCCode</td>
			<td>PCode</td>
			<td>PName</td>
			<td>Unit</td>
			<td>CPrice</td>
			<td>SPrice</td>
			<td>TSlab</td>
			<td>Stock</td>
			<td>Photo</td>
		</tr>
<%
	doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblproductinfo where CName='"+CName+"'");
		SL_No=1;
		while(rsData.next())
		{
			CName=rsData.getString("CName");
			CRCode=rsData.getString("CRCode");
			PCName=rsData.getString("PCName");
			PCCode=rsData.getString("PCCode");
			PCode=rsData.getString("PCode");  
			PName=rsData.getString("PName");
			Unit=rsData.getString("Unit");
			CPrice=rsData.getString("CPrice");
			SPrice=rsData.getString("SPrice");
			TSlab=rsData.getString("TSlab");
			Stock=rsData.getString("Stock");
			Photo=rsData.getString("Photo");
			
			if(SL_No % 2==0)
				out.println("<tr bgcolor=pink>");
			else
				out.println("<tr>");
%>
				<td><%=SL_No%></td>
				<td><%=CName%></td>
				<td><%=CRCode%></td>
				<td><%=PCName%></td>
				<td><%=PCCode%></td>
				<td><%=PCode%></td>
				<td><%=PName%></td>
				<td><%=Unit%></td>
				<td><%=CPrice%></td>
				<td><%=SPrice%></td>
				<td><%=TSlab%></td>
				<td><%=Stock%></td>
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