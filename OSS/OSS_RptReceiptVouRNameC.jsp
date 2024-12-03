<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtRName;
    ResultSet rsRName;
    String RName;
	
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
	<title>Detail Report Payment Voucher</title></head>
	<link rel="stylesheet" href="CSS_Universal.css">
<body color="Silver">
	<center>
	<form name="f1" action="OSS_RptReceiptVouRNameS.jsp" type="post">
		<nav>
			<h2>Retailer Voucher</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Retailer Name</td>
				<td>:
					<select name="txtRName">
						<option value="">-Select Retailer Name-</option>
						<%
							doConnect();
							try 
							{
								stmtRName = conn.createStatement();
								rsRName = stmtRName.executeQuery("SELECT * FROM oss_tblreceiptvou ORDER BY RName DESC");
								while (rsRName.next()) 
								{
									RName = rsRName.getString("RName");
						%>
									<option value="<%= RName %>"><%= RName %></option>
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