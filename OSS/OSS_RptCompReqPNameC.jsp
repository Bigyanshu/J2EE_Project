<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtProduct;
    ResultSet rsProduct;
    String Product;
	
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
	<title>Detail Report PName</title></head>
	<link rel="stylesheet" href="CSS_Universal.css">
<body color="Silver">
	<center>
	<form name="f1" action="OSS_RptCompReqProductS.jsp" type="post">
		<nav>
			<h2>Company Requisition</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Product Name</td>
				<td>:
					<select name="txtPName">
						<option value="">-Select Product-</option>
						<%
							doConnect();
							try 
							{
								stmtProduct = conn.createStatement();
								rsProduct = stmtProduct.executeQuery("SELECT * FROM oss_tblcompreq ORDER BY PName1 DESC");
								while (rsProduct.next()) 
								{
									Product = rsProduct.getString("PName1");
						%>
									<option value="<%= Product %>"><%= Product %></option>
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