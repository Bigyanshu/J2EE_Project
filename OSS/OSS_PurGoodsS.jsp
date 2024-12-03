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
				window.location.href="OSS_PurGoodsC.jsp";
			}
		}
		</script>
	</head>
	<body>
	<%!
		Connection conn;
		Statement stmtSave,stmtStockUpdate;
		String InvoiceNo,IDate,ReqNo,RDate,CName,Locality,City,State,GST,IType,SlNo,PCode,PName,Category,Price,PQty,Amount;
		String Discountge,DiscountAmount,GSTge,GSTAmount,NetAmount;
		
		public void doConnect()
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch(ClassNotFoundException cnfe)
			{
				System.out.println("Unable to Load Driver"+cnfe);
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
			InvoiceNo=request.getParameter("txtInvoice");
			IDate=request.getParameter("txtIDate");
			ReqNo=request.getParameter("cmbReqNo");
			RDate=request.getParameter("txtRDate");
			CName=request.getParameter("txtCName");
			Locality=request.getParameter("txtLoc");
			City=request.getParameter("txtCity");
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
						
			doConnect();
			try
			{
				stmtSave=conn.createStatement();
				stmtStockUpdate=conn.createStatement();
				stmtSave.executeUpdate("insert into oss_tblpurgoods values('"+InvoiceNo+"','"+IDate+"','"+ReqNo+"','"+RDate+"','"+CName+"','"+City+"','"+Locality+"','"+State+"','"+GST+"','"+IType+"','"+SlNo+"','"+PCode+"','"+PName+"','"+Category+"','"+Price+"','"+PQty+"','"+Amount+"','"+Discountge+"','"+DiscountAmount+"','"+GSTge+"','"+GSTAmount+"','"+NetAmount+"')");
				
				stmtStockUpdate.executeUpdate("update oss_tblproductinfo set stock=stock+'"+PQty+"' where PCode='"+PCode+"'");
			%>
				<script language="javascript">
					successMsg();
				</script>
			<%
			}
			catch(SQLException se)
			{
				out.println("Unable to Save Data...!-2"+se);
			}
		%>
	</body>
</html>