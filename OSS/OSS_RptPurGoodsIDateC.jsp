<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtIDate;
    ResultSet rsIDate;
    String IDate;
	
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
	<title>Detail Report IDate</title></head>
	<link rel="stylesheet" href="CSS_Universal.css">
<body color="Silver">
	<center>
	<form name="f1" action="OSS_RptPurGoodsIDateS.jsp" type="post">
		<nav>
			<h2>Purchase Of Goods</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Invoice Date</td>
				<td>:
					<select name="txtIDate">
						<option value="">-Select IDate-</option>
						<%
							doConnect();
							try 
							{
								stmtIDate = conn.createStatement();
								rsIDate = stmtIDate.executeQuery("SELECT * FROM oss_tblpurgoods ORDER BY IDate DESC");
								while (rsIDate.next()) 
								{
									IDate = rsIDate.getString("IDate");
						%>
									<option value="<%= IDate %>"><%= IDate %></option>
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