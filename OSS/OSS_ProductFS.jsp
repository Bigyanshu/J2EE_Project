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
					window.location.href="OSS_ProductFC.jsp";
				}
			}
			function deleteMsg()
			{
				var conff;
				conff=confirm("Delete Successfully.");
				if(conff)
				{
					window.location.href="OSS_ProductFC.jsp";
				}
			}
		</script>
	</head>
	<body>
	<%!
		String PCCode,PCName,btnDel,btnUp;
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
        PCCode=request.getParameter("cmbPCCode");
        PCName=request.getParameter("txtPCName");
        
        btnUp=request.getParameter("btnUpdate");
        btnDel=request.getParameter("btnDelete");

        doConnect();
        try
        {
            stmtUpDel=conn.createStatement();
            if(btnUp !=null)
            {
                stmtUpDel.executeUpdate("Update oss_tblproductcatg set PCName='"+PCName+"' where PCCode='"+PCCode+"'");
        %>   
			    <script language="javascript">
					successMsg();
				</script>
		<%
            }
            else if(btnDel !=null)
            {
                stmtUpDel.executeUpdate("Delete from oss_tblproductcatg where PCCode='"+PCCode+"'");
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