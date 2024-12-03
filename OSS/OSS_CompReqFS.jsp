<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
	<head><title>OSS CompRequisition Server</title>
		<script language="javascript">
	    function successMsg()
		{
			var conf;
			conf=confirm("Update Successfully.");
			if(conf)
			{
				window.location.href="OSS_CompReqFC.jsp";
			}
		}
		function deleteMsg()
			{
				var conff;
				conff=confirm("Delete Successfully.");
				if(conff)
				{
					window.location.href="OSS_RetailerFC.jsp";
				}
			}
		</script>
	</head>
	<body>
	<%!
		Connection conn;
		Statement stmtUpDel;
		String ReqNo1,Date1,CName1,CRegdNo1,Locality1,City1,State1,GST1,SlNo1,PCode1,PName1,Category1,Price1,OQty1,Amount1,btnUp,btnDel;
		
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
			ReqNo1=request.getParameter("cmbReqNo");
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
			
			btnUp=request.getParameter("btnUpdate");
			btnDel=request.getParameter("btnDelete");
			
		doConnect();
        try
        {
            stmtUpDel=conn.createStatement();
            if(btnUp !=null)
            {
                stmtUpDel.executeUpdate("Update oss_tblcompreq set Date1='"+Date1+"',CName1='"+CName1+"',CRegdNo1='"+CRegdNo1+"',Locality1='"+Locality1+"',City1='"+City1+"',State1='"+State1+"',GST1='"+GST1+"',SlNo1='"+SlNo1+"',PCode1='"+PCode1+"',PName1='"+PName1+"',Category1='"+Category1+"',Price1='"+Price1+"',OQty1='"+OQty1+"',Amount1='"+Amount1+"' where ReqNo1='"+ReqNo1+"'");
        %>   
				alert("Save"+btnUp);
			    <script language="javascript">
					successMsg();
				</script>
		<%
            }
            else if(btnDel !=null)
            {
                stmtUpDel.executeUpdate("Delete from oss_tblcompreq where ReqNo1='"+ReqNo1+"'");
		%>
				alert("Delete"+btnDel);
                <script language="javascript">
					deleteMsg();
				</script>
	<%
            }
        }
        catch(SQLException se)
        {
            System.out.println("Unable to Proceed . Try Again Latter");
        }
    %>
    </body>
</html>