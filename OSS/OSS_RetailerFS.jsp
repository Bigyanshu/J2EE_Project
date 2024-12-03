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
					window.location.href="OSS_RetailerFC.jsp";
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
		String RCode,RName,CPerson,Loc,City,State,Phone,Email,GST,Date,Password,Photo, btnUp,btnDel;
		
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
        RCode=request.getParameter("cmbRCode");
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
		if(Photo.length()==0)
			Photo=request.getParameter("hdnPhoto");
        
        btnUp=request.getParameter("btnUpdate");
        btnDel=request.getParameter("btnDelete");

        doConnect();
        try
        {
            stmtUpDel=conn.createStatement();
            if(btnUp !=null)
            {
                stmtUpDel.executeUpdate("Update oss_tblretailer set RName='"+RName+"',CPerson='"+CPerson+"',Loc='"+Loc+"',City='"+City+"',State='"+State+"',Phone='"+Phone+"',Email='"+Email+"',GST='"+GST+"',Date='"+Date+"',Password='"+Password+"',Photo='"+Photo+"' where RCode='"+RCode+"'");
        %>   
			    <script language="javascript">
					successMsg();
				</script>
		<%
            }
            else if(btnDel !=null)
            {
                stmtUpDel.executeUpdate("Delete from oss_tblretailer where RCode='"+RCode+"'");
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