<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
	<head><title>OSS OrderFrom FS</title>
		<script language="javascript">
	    function successMsg()
		{
			var conf;
			conf=confirm("Update Successfully.");
			if(conf)
			{
				window.location.href="OSS_OrderFromFC.jsp";
			}
		}
		function deleteMsg()
			{
				var conff;
				conff=confirm("Delete Successfully.");
				if(conff)
				{
					window.location.href="OSS_OrderFromFC.jsp";
				}
			}
		</script>
	</head>
	<body>
	<%!
		Connection conn;
		Statement stmtUpDel;
		String ONo,Date,RName,RetCode,Loc,City,State,GST,SlNo,PCode,PName,Category,Price,OQty,Amount,btnDel,btnUp;
		
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
			ONo=request.getParameter("cmbONo");
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
			
			btnUp=request.getParameter("btnUpdate");
			btnDel=request.getParameter("btnDelete");
			
		doConnect();
        try
        {
            stmtUpDel=conn.createStatement();
            if(btnUp !=null)
            {
                stmtUpDel.executeUpdate("Update oss_tblorderfrom set Date='"+Date+"',RName='"+RName+"',RetCode='"+RetCode+"',Loc='"+Loc+"',City='"+City+"',State='"+State+"',GST='"+GST+"',SlNo='"+SlNo+"',PCode='"+PCode+"',PName='"+PName+"',Category='"+Category+"',Price='"+Price+"',OQty='"+OQty+"',Amount='"+Amount+"' where ONo='"+ONo+"'");
        %>   
			    <script language="javascript">
					successMsg();
				</script>
		<%
            }
            else if(btnDel !=null)
            {
                stmtUpDel.executeUpdate("Delete from oss_tblorderfrom where ONo='"+ONo+"'");
		%>
                <script language="javascript">
					deleteMsg();
				</script>
	<%
            }
        }
        catch(SQLException se)
        {
            System.out.println("Unable to Update or Delete . Try Again Latter"+se);
        }
    %>
    </body>
</html>