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
				window.location.href="OSS_CompanyC.html";
			}
		}
	</script>
	</head>
	<body>
	<%!
		String Regd,CName,HOC,Loc,City,State,Phone,Email,GST,Date;
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
			Regd=request.getParameter("txtRegd");
			CName=request.getParameter("txtCName");
			HOC=request.getParameter("txtHOC");
			Loc=request.getParameter("txtLoc");
			City=request.getParameter("txtCity");
			State=request.getParameter("cmbState");
			Phone=request.getParameter("txtPhone");
			Email=request.getParameter("txtEmail");
			GST=request.getParameter("txtGST");
			Date=request.getParameter("txtDate");
			
			doConnect();
			try
			{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into oss_tblcompany values('"+Regd+"','"+CName+"','"+HOC+"','"+Loc+"','"+City+"','"+State+"','"+Phone+"','"+Email+"','"+GST+"','"+Date+"')");
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