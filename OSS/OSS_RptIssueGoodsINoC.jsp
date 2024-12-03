<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtINo;
    ResultSet rsINo;
    String INo;
	
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
<html>
<head>
	<title>Detail Report IssueGoods</title></head>
	<link rel="stylesheet" href="CSS_Universal.css">
<body color="Silver">
	<center>
	<form name="f1" action="OSS_RptIssueGoodsINoS.jsp" type="post">
		<nav>
			<h2>Issue of Goods Invoice</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Invoice No</td>
				<td>:
					<select name="txtInvoice">
						<option value="">-Select Invoice No-</option>
						<%
							doConnect();
							try 
							{
								stmtINo = conn.createStatement();
								rsINo = stmtINo.executeQuery("SELECT * FROM oss_tblissuegoods ORDER BY InvoiceNo DESC");
								while (rsINo.next()) 
								{
									INo = rsINo.getString("InvoiceNo");
						%>
									<option value="<%= INo %>"><%= INo %></option>
						<%
								}
							} 
							catch (SQLException se) 
							{
								System.out.println("Unable to create combo");
							}
						%>
					</select>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" name="btnSubmit" value="Submit"> &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" name="btnReset" value="Reset">
    </form>
	</script>
    </center>
</body>
</html>