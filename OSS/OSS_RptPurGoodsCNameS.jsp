<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
	<head>
		<title>Report PurGoods CName</title>
	</head>
	<body background="black">
<%!
	Connection conn;
	Statement stmtData;
	ResultSet rsData;
	String InvoiceNo,IDate,ReqNo,RDate,CName,Locality,City,State,GST,IType,SlNo,PCode,PName,Category,Price,PQty,Amount,Discountge,DiscountAmount,GSTge,GSTAmount,NetAmount;
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
	<h2>Purchase Of Goods<h2><h3 style="color: rgb(255, 0, 191);">[<%=CName%>]</h3></h2>
	<table width="100%">
		<tr bgcolor="lightgreen" height="50">
			<td>SL_No</td>
			<td>InvoiceNo</td>
			<td>IDate</td>
			<td>ReqNo</td>
			<td>RDate</td>
			<td>CName</td>
			<td>Locality</td>
			<td>City</td>
			<td>State</td>
			<td>GST</td>
			<td>IType</td>
			<td>SlNo</td>
			<td>PCode</td>
			<td>PName</td>
			<td>Category</td>
			<td>Price</td>
			<td>PQty</td>
			<td>Amount</td>
			<td>Discountge</td>
			<td>DiscountAmount</td>
			<td>GSTge</td>
			<td>GSTAmount</td>
			<td>NetAmount</td>
		</tr>
<%
doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblpurgoods where CName='"+CName+"'");
		SL_No=1;
		while(rsData.next())
		{
			InvoiceNo=rsData.getString("InvoiceNo");
			IDate=rsData.getString("IDate");
			ReqNo=rsData.getString("ReqNo");
			RDate=rsData.getString("RDate");
			CName=rsData.getString("CName");
			Locality=rsData.getString("Locality");
			City=rsData.getString("City");
			State=rsData.getString("State");
			GST=rsData.getString("GST");
			IType=rsData.getString("IType");
			SlNo=rsData.getString("SlNo");
			PCode=rsData.getString("PCode");
			PName=rsData.getString("PName");
			Category=rsData.getString("Category");
			Price=rsData.getString("Price");
			PQty=rsData.getString("PQty");
			Amount=rsData.getString("Amount");
			Discountge=rsData.getString("Discountge");
			DiscountAmount=rsData.getString("DiscountAmount");
			GSTge=rsData.getString("GSTge");
			GSTAmount=rsData.getString("GSTAmount");
			NetAmount=rsData.getString("NetAmount");
		
			if(SL_No % 2==0)
				out.println("<tr bgcolor=pink>");
			else
				out.println("<tr>");
%>
				<td><%=SL_No%></td>
				<td><%=InvoiceNo%></td>
				<td><%=IDate%></td>
				<td><%=ReqNo%></td>
				<td><%=RDate%></td>
				<td><%=CName%></td>
				<td><%=Locality%></td>
				<td><%=City%></td>
				<td><%=State%></td>
				<td><%=GST%></td>
				<td><%=IType%></td>
				<td><%=SlNo%></td>
				<td><%=PCode%></td>
				<td><%=PName%></td>
				<td><%=Category%></td>
				<td><%=PQty%></td>
				<td><%=Price%></td>
				<td><%=Amount%></td>
				<td><%=Discountge%></td>
				<td><%=DiscountAmount%></td>
				<td><%=GSTge%></td>
				<td><%=GSTAmount%></td>
				<td><%=NetAmount%></td>
				
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