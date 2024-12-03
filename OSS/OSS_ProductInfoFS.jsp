<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
	<head><title>OSS Product Info FS</title>
		<script language="javascript">
			function successMsg()
			{
				var conf;
				conf=confirm("Update Successfully.");
				if(conf)
				{
					window.location.href="OSS_ProductInfoFC.jsp";
				}
			}
			function deleteMsg()
			{
				var conff;
				conff=confirm("Delete Successfully.");
				if(conff)
				{
					window.location.href="OSS_ProductInfoFC.jsp";
				}
			}
		</script>
	</head>
	<body> 
	<%!
		Connection conn;
		Statement stmtUpDel;
		String CName, CRCode,PCName,PCCode,PCode, PName, Unit, CPrice, SPrice, TSlab, Stock, Photo,btnDel,btnUp;
		
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
        PCode=request.getParameter("cmbPCode");
        CName=request.getParameter("cmbCName");
        CRCode=request.getParameter("txtCRCode");
        PCName=request.getParameter("cmbPCName");
        PCCode=request.getParameter("txtPCCode");
        PName=request.getParameter("txtPName");
        Unit=request.getParameter("txtUnit");
        CPrice=request.getParameter("txtCPrice");
        SPrice=request.getParameter("txtSPrice");
        TSlab=request.getParameter("cmbTSlab");
        Stock=request.getParameter("txtStock");
        Photo=request.getParameter("filephoto");
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
                stmtUpDel.executeUpdate("Update oss_tblproductinfo set CName='"+CName+"', CRCode='"+CRCode+"',PCName='"+PCName+"',PCCode='"+PCCode+"',  PName='"+PName+"', Unit='"+Unit+"', CPrice='"+CPrice+"', SPrice='"+SPrice+"', TSlab='"+TSlab+"', Stock='"+Stock+"', Photo='"+Photo+"' where PCode='"+PCode+"'");
        %>   
			    <script language="javascript">
					successMsg();
				</script>
		<%
            }
            else if(btnDel !=null)
            {
                stmtUpDel.executeUpdate("Delete from oss_tblproductinfo where PCode='"+PCode+"'");
        %>
                <script language="javascript">
					deleteMsg();
				</script>
	<%
            }
        }
        catch(SQLException se)
        {
            System.out.println("Unable to Update or Delete . Try Again Latter");
        }
    %>
    </body>
</html>