<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
	<head><title>OSS Retailer Server</title>
	<script language="javascript">
	    function successMsg()
		{
			var conf;
			conf=confirm("Your Data Saved Successfully.");
			if(conf)
			{
				window.location.href="OSS_RetailerC.html";
			}
		}
	</script>
	</head>
	<body>
	<%!
		String RCode,RName,CPerson,Loc,City,State,Phone,Email,GST,Date,Password,Photo;
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
			}
			catch(SQLException se)
			{
				System.out.println("Unable to Connect with DataBase");
			}
		}
	%>
		<%
			RCode=request.getParameter("txtRCode");
			RName=request.getParameter("txtRName");
			CPerson=request.getParameter("txtCPerson");
			Loc=request.getParameter("txtLoc");
			City=request.getParameter("txtCity");
			State=request.getParameter("cmbState");
			Phone=request.getParameter("txtPhone");
			Email=request.getParameter("txtEmail");
			GST=request.getParameter("txtGST");
			Date=request.getParameter("txtDate");
			Password=request.getParameter("txtPswd");
			Photo=request.getParameter("filePhoto");
			
			doConnect();
			try
			{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into oss_tblretailer values('"+RCode+"','"+RName+"','"+CPerson+"','"+Loc+"','"+City+"','"+State+"','"+Phone+"','"+Email+"','"+GST+"','"+Date+"','"+Password+"','"+Photo+"')");
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