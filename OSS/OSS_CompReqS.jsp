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
				window.location.href="OSS_CompReqC.jsp";
			}
		}
		</script>
	</head>
	<body>
	<%!
		Connection conn;
		Statement stmtSave;
		String ReqNo1,Date1,CName1,CRegdNo1,Locality1,City1,State1,GST1,SlNo1,PCode1,PName1,Category1,Price1,OQty1,Amount1;
		
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
			ReqNo1=request.getParameter("txtReqNo");
			Date1=request.getParameter("txtDate");
			CName1=request.getParameter("cmbCName");
			CRegdNo1=request.getParameter("txtCRegdNo");
			Locality1=request.getParameter("txtLoc");
			City1=request.getParameter("txtCity");
			State1=request.getParameter("txtState");
			GST1=request.getParameter("txtGST");
			SlNo1=request.getParameter("txtSlNo");
			PCode1=request.getParameter("cmbPCode");  
			PName1=request.getParameter("txtPName");
			Category1=request.getParameter("txtCategory");
			Price1=request.getParameter("txtPrice");
			OQty1=request.getParameter("txtOQty");
			Amount1=request.getParameter("txtAmount");
			
			doConnect();
			try
			{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into oss_tblcompreq values('"+ReqNo1+"','"+Date1+"','"+CName1+"','"+CRegdNo1+"','"+Locality1+"','"+City1+"','"+State1+"','"+GST1+"','"+SlNo1+"','"+PCode1+"','"+PName1+"','"+Category1+"','"+Price1+"','"+OQty1+"','"+Amount1+"')");
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