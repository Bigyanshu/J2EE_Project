<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
	<head><title>OSS Find Server</title>
		<script language="javascript">
			function successMsg()
			{
				var conf;
				conf=confirm("Update Successfully.");
				if(conf)
				{
					window.location.href="OSS_PmtVouFC.jsp";
				}
			}
			function deleteMsg()
			{
				var conff;
				conff=confirm("Delete Successfully.");
				if(conff)
				{
					window.location.href="OSS_PmtVouFC.jsp";
				}
			}
		</script>
	</head>
	<body>
	<%!
		String VNo,VDate,RName,Loc,City,State,PMode,RefNo,RDate,BName,Amount,btnUp,btnDel;
		Statement stmtUpDel;
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
		VNo=request.getParameter("cmbVNo");
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
        
        btnUp=request.getParameter("btnUpdate");
        btnDel=request.getParameter("btnDelete");

        doConnect();
        try
        {
            stmtUpDel=conn.createStatement();
            if(btnUp !=null)
            {
                stmtUpDel.executeUpdate("Update oss_tblreceiptvou set  VDate='"+VDate+"',RName='"+RName+"',Loc='"+Loc+"',City='"+City+"',State='"+State+"',PMode='"+PMode+"',RefNo='"+RefNo+"',RDate='"+RDate+"',BName='"+BName+"',Amount='"+Amount+"' where VNo='"+VNo+"'");
        %>   
			    <script language="javascript">
					successMsg();
				</script>
		<%
            }
            else if(btnDel !=null)
            {
                stmtUpDel.executeUpdate("Delete from oss_tblreceiptvou where VNo='"+VNo+"'");
		%>
                <script language="javascript">
					deleteMsg();
				</script>
		<%
            }
        }
        catch(SQLException se)
        {
            System.out.println("Unable to Update or Delete. Try Again Latter");
        }
    %>
    </body>
</html>