<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
	<head><title>OSS Server Page</title>
		<script language="javascript">
			function successMsg()
			{
				var conf;
				conf=confirm("Your Data Saved Successfully.");
				if(conf)
				{
					window.location.href="OSS_Login.html";
				}
			}
		</script>
	</head>
	<body>
	<%!
		String UName,Pswd;
		Statement stmt1;
		ResultSet rs;
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
			UName=request.getParameter("txtUName");
			Pswd=request.getParameter("txtPswd");
			
			doConnect();
			try
			{
				stmt1=conn.createStatement();
				rs=stmt1.executeQuery("select * from oss_login where Uname='"+UName+"' AND pswd='"+Pswd+"');
				if(rs.next())
				{
					window.location="OSS_Menu.html";
				}
				else
					System.out.println("Wrong Password");
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