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
					window.location.href="OSS_CompanyFC.jsp";
				}
			}
			function deleteMsg()
			{
				var conff;
				conff=confirm("Delete Successfully.");
				if(conff)
				{
					window.location.href="OSS_CompanyFC.jsp";
				}
			}
		</script>
	</head>
	<body>
	<%!
		String Regd,CName,HOC,Loc,City,State,Phone,Email,GST,Date,btnUp,btnDel;
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
				System.out.println("Connected To The DataBase");
			}
			catch(SQLException se)
			{
				System.out.println("Unable to Connect with DataBase");
			}
		}
	%>
    <%
        Regd=request.getParameter("cmbRegd");
        CName=request.getParameter("txtCName");
        HOC=request.getParameter("txtHOC");
        Loc=request.getParameter("txtLoc");
        City=request.getParameter("txtCity");
        State=request.getParameter("cmbState");
        Phone=request.getParameter("txtPhone");
        Email=request.getParameter("txtEmail");
        GST=request.getParameter("txtGST");
        Date=request.getParameter("txtDate");
        
        btnUp=request.getParameter("btnUpdate");
        btnDel=request.getParameter("btnDelete");

        doConnect();
        try
        {
            stmtUpDel=conn.createStatement();
            if(btnUp !=null)
            {
                stmtUpDel.executeUpdate("Update oss_tblcompany set CName='"+CName+"',HOC='"+HOC+"',Loc='"+Loc+"',City='"+City+"',State='"+State+"',Phone='"+Phone+"',Email='"+Email+"',GST='"+GST+"',Date='"+Date+"' where Regd='"+Regd+"'");
        %>   
			    <script language="javascript">
					successMsg();
				</script>
		<%
            }
            else if(btnDel !=null)
            {
                stmtUpDel.executeUpdate("Delete from oss_tblcompany where Regd='"+Regd+"'");
		%>
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