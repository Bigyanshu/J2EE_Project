<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtPCategory;
    ResultSet rsPCategory;
    String PCategory;
	
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
	<title>Detail Report Product Category</title></head>
	<link rel="stylesheet" href="CSS_Universal.css">
<body color="Silver">
	<center>
	<form name="f1" action="OSS_RptOrderFromPCatgS.jsp" type="post">
		<nav>
			<h2>Order From PCategory</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Product Category</td>
				<td>:
					<select name="txtCategory">
						<option value="">-Select Product Category-</option>
						<%
							doConnect();
							try 
							{
								stmtPCategory = conn.createStatement();
								rsPCategory = stmtPCategory.executeQuery("SELECT * FROM oss_tblorderfrom ORDER BY Category DESC");
								while (rsPCategory.next()) 
								{
									PCategory = rsPCategory.getString("Category");
						%>
									<option value="<%= PCategory %>"><%= PCategory %></option>
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