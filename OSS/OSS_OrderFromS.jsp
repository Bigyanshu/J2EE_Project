<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
	<head><title>OSS Product Server</title>
		<script language="javascript">
	    function successMsg()
		{
			var conf;
			conf=confirm("Your Data Saved Successfully.");
			if(conf)
			{
				window.location.href="OSS_OrderFromC.jsp";
			}
		}
		</script>
	</head>
	<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String ONo,Date,RName,RetCode,Loc,City,State,GST,SlNo,PCode,PName,Category,Price,OQty,Amount;
		
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
				System.out.println("Unable to Connect with DataBase"+se);
			}
		}
	%>
		<%
			ONo=request.getParameter("txtONo");
			Date=request.getParameter("txtDate");
			RName=request.getParameter("cmbRName");
			RetCode=request.getParameter("txtRCode");
			Loc=request.getParameter("txtLoc");
			City=request.getParameter("txtCity");
			State=request.getParameter("txtState");
			GST=request.getParameter("txtGST");
			SlNo=request.getParameter("txtSlNo");
			PCode=request.getParameter("cmbPCode");  
			PName=request.getParameter("txtPName");
			Category=request.getParameter("txtCategory");
			Price=request.getParameter("txtPrice");
			OQty=request.getParameter("txtOQty");
			Amount=request.getParameter("txtAmount");
			
			doConnect();
			try
			{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into oss_tblorderfrom values ('"+ONo+"','"+Date+"','"+RName+"','"+RetCode+"','"+Loc+"','"+City+"','"+State+"','"+GST+"','"+SlNo+"','"+PCode+"','"+PName+"','"+Category+"','"+Price+"','"+OQty+"','"+Amount+"')");
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