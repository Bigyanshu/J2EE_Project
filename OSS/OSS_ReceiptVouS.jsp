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
				window.location.href="OSS_ReceiptVouC.jsp";
			}
		}
	</script>
	</head>
	<body>
	<%!
		String VNo,VDate,RName,Loc,City,State,PMode,RefNo,RDate,BName,Amount;
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
			VNo=request.getParameter("txtVNo");
			VDate=request.getParameter("txtVDate");
			RName=request.getParameter("cmbRName");
			Loc=request.getParameter("txtLoc");
			City=request.getParameter("txtCity");
			State=request.getParameter("txtState");
			PMode=request.getParameter("cmbPMode");
			RefNo=request.getParameter("txtRefNo");
			RDate=request.getParameter("txtRDate");
			BName=request.getParameter("cmbBName");
			Amount=request.getParameter("txtAmount");
			
			doConnect();
			try
			{
				stmtSave=conn.createStatement();
				stmtSave.executeUpdate("insert into oss_tblreceiptvou values ('"+VNo+"','"+VDate+"','"+RName+"','"+Loc+"','"+City+"','"+State+"','"+PMode+"','"+RefNo+"','"+RDate+"','"+BName+"','"+Amount+"')");
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