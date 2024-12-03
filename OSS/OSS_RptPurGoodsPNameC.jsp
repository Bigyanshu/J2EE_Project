<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtPName;
    ResultSet rsPName;
    String PName;
	
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
	<form name="f1" action="OSS_RptPurGoodsPNameS.jsp" type="post">
		<nav>
			<h2>Purchase Of Goods</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Product Name</td>
				<td>:
					<select name="txtPName">
						<option value="">-Select Prodcut Name-</option>
						<%
							doConnect();
							try 
							{
								stmtPName = conn.createStatement();
								rsPName = stmtPName.executeQuery("SELECT * FROM oss_tblpurgoods ORDER BY PName DESC");
								while (rsPName.next()) 
								{
									PName = rsPName.getString("PName");
						%>
									<option value="<%= PName %>"><%= PName %></option>
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