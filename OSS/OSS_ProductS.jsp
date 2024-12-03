<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
	<head>
	    <title>OSS Product Server</title>
		<script language="javascript">
	    function successMsg()
		{
			var conf;
			conf=confirm("Your Data Saved Successfully.");
			if(conf)
			{
				window.location.href="OSS_ProductC.html";
			}
		}
		</script>
		</head>
	<body>
	<%!
		String PCCode,PCName;
		Statement stmtSave;
		Connection conn;
		
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
				System.out.println("Connected To The DataBase");
			}
			catch(SQLException se)
			{
				System.out.println("Unable to Connect with DataBase");
			}
		}
	%>
		<%
			PCCode=request.getParameter("txtPCCode");
			PCName=request.getParameter("txtPCName");
			
			doConnect();
			try
			{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into oss_tblproductcatg values('"+PCCode+"','"+PCName+"')");
				%>
				   <script language="javascript">
				       successMsg();
				   </script>
				<%
		    }
			catch(SQLException se)
			{
				out.println("Unable to Save Data...!"+se);
			}
		%>
	</body>
</html>