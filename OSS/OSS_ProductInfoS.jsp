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
				window.location.href="OSS_ProductInfoC.jsp";
			}
		}
		</script>
	</head>
	<body>
	<%!
		String CName,CRCode,PCName,PCCode,PCode,PName,Unit,CPrice,SPrice,TSlab,Stock,Photo;
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
			CName=request.getParameter("cmbCName");
			CRCode=request.getParameter("txtCRCode");
			PCName=request.getParameter("cmbPCName");
			PCCode=request.getParameter("txtPCCode");
			PCode=request.getParameter("txtPCode");  
			PName=request.getParameter("txtPName");
			Unit=request.getParameter("txtUnit");
			CPrice=request.getParameter("txtCPrice");
			SPrice=request.getParameter("txtSPrice");
			TSlab=request.getParameter("cmbTSlab");
			Stock=request.getParameter("txtStock");
			Photo=request.getParameter("filephoto");
			
			doConnect();
			try
			{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into oss_tblproductinfo  values('"+CName+"','"+CRCode+"','"+PCName+"','"+PCCode+"','"+PCode+"','"+PName+"','"+Unit+"','"+CPrice+"','"+SPrice+"','"+TSlab+"','"+Stock+"','"+Photo+"')");
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