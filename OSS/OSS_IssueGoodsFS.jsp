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
				window.location.href="OSS_IssueGoodsFC.jsp";
			}
		}
		function deleteMsg()
			{
				var conff;
				conff=confirm("Delete Successfully.");
				if(conff)
				{
					window.location.href="OSS_IssueGoodsFC.jsp";
				}
			}
		</script>
	</head>
	<body>
	<%!
		Connection conn;
		Statement stmtUpDel;
		String InvoiceNo, IDate, RCode, RDate, RName, Loc, City, State, GST, IType, SlNo, PCode, PName, Category, Price, PQty, Amount, Discountge,DiscountAmount,GSTge,GSTAmount,NetAmount,btnUp,btnDel;
		
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
			InvoiceNo=request.getParameter("cmbInvoiceNo");
			IDate=request.getParameter("txtIDate");
			RCode=request.getParameter("cmbRCode");
			RDate=request.getParameter("txtRDate");
			RName=request.getParameter("txtRName");
			City=request.getParameter("txtCity");
			Loc=request.getParameter("txtLoc");
			State=request.getParameter("txtState");
			GST=request.getParameter("txtGST");
			IType=request.getParameter("cmbIType");
			SlNo=request.getParameter("txtSlNo");
			PCode=request.getParameter("cmbPCode");  
			PName=request.getParameter("txtPName");
			Category=request.getParameter("txtCategory");
			Price=request.getParameter("txtPrice");
			PQty=request.getParameter("txtPQty");
			Amount=request.getParameter("txtAmount");
			Discountge=request.getParameter("txtDis");
			DiscountAmount=request.getParameter("txtDisAmt");
			GSTge=request.getParameter("txtGSTge");
			GSTAmount=request.getParameter("txtGSTAmt");
			NetAmount=request.getParameter("txtNetAmount");
			
			btnUp=request.getParameter("btnUpdate");
			btnDel=request.getParameter("btnDelete");
			
		doConnect();
        try
        {
            stmtUpDel=conn.createStatement();
            if(btnUp !=null)
            {
                stmtUpDel.executeUpdate("Update oss_tblissuegoods set IDate='"+IDate+"',RCode='"+RCode+"',RDate='"+RDate+"',RName='"+RName+"',City='"+City+"',Loc='"+Loc+"',State='"+State+"',GST='"+GST+"',IType='"+IType+"',SlNo='"+SlNo+"',PCode='"+PCode+"',PName='"+PName+"',Category='"+Category+"',Price='"+Price+"',PQty='"+PQty+"',Amount='"+Amount+"',Discountge='"+Discountge+"',DiscountAmount='"+DiscountAmount+"',GSTge='"+GSTge+"',GSTAmount='"+GSTAmount+"',NetAmount='"+NetAmount+"' where InvoiceNo='"+InvoiceNo+"'");
        %>   
				alert("Save"+btnUp);
			    <script language="javascript">
					successMsg();
				</script>
		<%
            }
            else if(btnDel !=null)
            {
                stmtUpDel.executeUpdate("Delete from oss_tblissuegoods where RCode='"+RCode+"'");
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
            System.out.println("Unable to Proceed . Try Again Latter"+se);
        }
    %>
    </body>
</html>