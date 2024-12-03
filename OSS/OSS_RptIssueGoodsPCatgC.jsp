<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtCategory;
    ResultSet rsCategory;
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
	<title>Detail Report IssueGoods</title></head>
	<link rel="stylesheet" href="CSS_Universal.css">
<body color="Silver">
	<center>
	<form name="f1" action="OSS_RptIssueGoodsPCatgS.jsp" type="post">
		<nav>
			<h2>Issue of Goods</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Product Category</td>
				<td>:
					<select name="txtCategory">
						<option value="">-Select Prod Category-</option>
						<%
							doConnect();
							try 
							{
								stmtCategory = conn.createStatement();
								rsCategory = stmtCategory.executeQuery("SELECT * FROM oss_tblissuegoods ORDER BY Category DESC");
								while (rsCategory.next()) 
								{
									PCategory = rsCategory.getString("Category");
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