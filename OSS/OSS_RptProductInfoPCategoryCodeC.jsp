<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtPCCode;
    ResultSet rsPCCode;
    String PCCode;
	
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
	<title>Detail Report</title>
</head>
<link rel="stylesheet" href="CSS_Universal.css">
<body color="AquaSilver">
	<center>
	<form name="f1" action="OSS_RptProductInfoPCategoryCodeS.jsp" type="post">
		 <nav>
			<h2>Product Information</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Product Category Code</td>
				<td>:
					<select name="txtPCCode" onchange="setCRCode()">
						<option value="">-Select Product Category Name-</option>
						<%
							doConnect();
							try 
							{
								stmtPCCode = conn.createStatement();
								rsPCCode = stmtPCCode.executeQuery("SELECT * FROM oss_tblproductinfo ORDER BY PCCode ASC");
								while (rsPCCode.next()) 
								{
									PCCode = rsPCCode.getString("PCCode");
						%>
									<option value="<%= PCCode %>"><%= PCCode %></option>
						<%
								}
							} 
							catch (SQLException se) 
							{
								System.out.println("Unable to create combo");
							}
						%>
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