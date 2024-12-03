<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtCName;
    ResultSet rsCName;
    String CName;
	
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
	<title>Detail Report Prod Info</title>
</head>
<link rel="stylesheet" href="CSS_Universal.css">
<body color="AquaSilver">
	<center>
	<form name="f1" action="OSS_RptProductInfoCompanyS.jsp" type="post">
		 <nav>
			<h2>Product Information</h2>
		</nav>
		<table border="0">
			<tr>
				<td>Company Name</td>
				<td>:
					<select name="cmbCName">
						<option value="">-Select Company Name-</option>
						<%
							doConnect();
							try 
							{
								stmtCName = conn.createStatement();
								rsCName = stmtCName.executeQuery("SELECT * FROM oss_tblproductinfo ORDER BY CName DESC");
								while (rsCName.next()) 
								{
									CName = rsCName.getString("CName");
						%>
									<option value="<%= CName %>"><%= CName %></option>
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