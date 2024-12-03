<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%! 
    Connection conn;
    Statement stmtData, stmtInvoiceNo,stmtRCode,stmtPCode;
    ResultSet rsData, rsInvoiceNo,rsRCode,rsPCode;

	String InvoiceNo,RCodeN,PCodeN, IDate[], RCode[], RDate[], RName[], Loc[], City[], State[], GST[], IType[], SlNo[], PCode[], PName[], Category[], Price[], PQty[], Amount[],Discountge[],DiscountAmount[],GSTge[],GSTAmount[],NetAmount[],GSTPtage[],      btnUpdate,btnDelete;
		
    int i;

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
    doConnect();
	
	IDate=new String[20];
	RCode=new String[20];
	RDate=new String[20];
	RName=new String[20];
	Loc=new String[20];
	City=new String[20];
	State=new String[20];
	GST=new String[20];
	IType=new String[20];
	SlNo=new String[20];
	PCode=new String[20];
	PName=new String[20];
	Category=new String[20];
	Price=new String[20];
	PQty=new String[20];
	Amount=new String[20];
	Discountge=new String[20];
	DiscountAmount=new String[20];
	GSTge=new String[20];
	GSTAmount=new String[20];
	NetAmount=new String[20];
	GSTPtage=new String[20];
	
    try 
	{
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblissuegoods");
        i = 0;
        while (rsData.next()) 
		{
            IDate[i]=rsData.getString("IDate");
			RCode[i]=rsData.getString("RCode");
			RDate[i]=rsData.getString("RDate");
			RName[i]=rsData.getString("RName");
			City[i]=rsData.getString("City");
			Loc[i]=rsData.getString("Loc");
			State[i]=rsData.getString("State");
			GST[i]=rsData.getString("GST");
			IType[i]=rsData.getString("IType");
			SlNo[i]=rsData.getString("SlNo");
			PCode[i]=rsData.getString("PCode"); 
			PName[i]=rsData.getString("PName");
			Category[i]=rsData.getString("Category");
			Price[i]=rsData.getString("Price");
			PQty[i]=rsData.getString("PQty");
			Amount[i]=rsData.getString("Amount");
			Discountge[i]=rsData.getString("Discountge");
			DiscountAmount[i]=rsData.getString("DiscountAmount");
			GSTge[i]=rsData.getString("GSTge");
			GSTAmount[i]=rsData.getString("GSTAmount");
			NetAmount[i]=rsData.getString("NetAmount");
			
            i = i + 1;
        }
    } 
	catch (SQLException se) 
	{
        System.out.println("Unable to Fill Array-2 "+se);
    }
	
	GSTPtage =new String[20];

    doConnect();
    try 
	{
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblproductinfo");
        i = 0;
        while (rsData.next()) 
		{
            GSTPtage[i] = rsData.getString("TSlab");
            i = i + 1;
        }
    } 
	catch (SQLException se) 
	{
        System.out.println("Unable to Fill Array-2"+se);
    }
%>

<html>
	<head>
		<title>OSS Issue Goods FC</title>
		<link rel="stylesheet" href="CSS_Universal.css">
			<style>
				.highlight-row 
				{
					border: 2px solid #000;
					background-color: rgb(131, 49, 238);
					color: rgb(255, 255, 255);
					text-align: center;
					border-radius: 50px;
				}
			</style>
		<script language="javascript">
			function fillInvoice()
			{
				jIDate=new Array();
				jRCode=new Array();
				jRDate=new Array();
				jRName=new Array();
				jLoc=new Array();
				jCity=new Array();
				jState=new Array();
				jGST=new Array();
				jIType=new Array();
				jSlNo=new Array();
				jPCode=new Array();
				jPName=new Array();
				jCategory=new Array();
				jPrice=new Array();
				jPQty=new Array();
				jAmount=new Array();
				jDiscountge=new Array();
				jDiscountAmount=new Array();
				jGSTPtage=new Array();
				jGSTAmount=new Array();
				jNetAmount=new Array();

				var j = 0, k = 0;
			<% 
					i = 0;
					while (i < RCode.length) 
					{
			%>
						jIDate[j] = "<%=IDate[i]%>";
						jRCode[j] = "<%=RCode[i]%>";
						jRDate[j] = "<%=RDate[i]%>";
						jRName[j] = "<%=RName[i]%>";
						jCity[j] = "<%=City[i]%>";
						jLoc[j] = "<%=Loc[i]%>";
						jState[j] = "<%=State[i]%>";
						jGST[j] = "<%=GST[i]%>";
						jIType[j] = "<%=IType[i]%>";
						jSlNo[j] = "<%=SlNo[i]%>";
						jPCode[j] = "<%=PCode[i]%>";
						jPName[j] = "<%=PName[i]%>";
						jCategory[j] = "<%=Category[i]%>";
						jPrice[j] = "<%=Price[i]%>";
						jPQty[j] = "<%=PQty[i]%>";
						jAmount[j] = "<%=Amount[i]%>";
						jDiscountge[j] = "<%=Discountge[i]%>";
						jDiscountAmount[j] = "<%=DiscountAmount[i]%>";
						jGSTPtage[j] = "<%=GSTPtage[i]%>";
						jGSTAmount[j] = "<%=GSTAmount[i]%>";
						jNetAmount[j] = "<%=NetAmount[i]%>";

						j = j + 1;
				<%
						i = i + 1;
					}
				%>

				k = document.f1.cmbInvoiceNo.selectedIndex;
				
				document.f1.txtIDate.value = jIDate[k - 1];
				document.f1.cmbRCode.value = jRCode[k - 1];
				document.f1.txtRDate.value = jRDate[k - 1];
				document.f1.txtRName.value = jRName[k - 1];
				document.f1.txtCity.value = jCity[k - 1];
				document.f1.txtLoc.value = jLoc[k - 1];
				document.f1.txtState.value = jState[k - 1];
				document.f1.txtGST.value = jGST[k - 1];
				document.f1.cmbIType.value = jIType[k - 1];
				document.f1.txtSlNo.value = jSlNo[k - 1];
				document.f1.cmbPCode.value = jPCode[k - 1];
				document.f1.txtPName.value = jPName[k - 1];
				document.f1.txtCategory.value = jCategory[k - 1];
				document.f1.txtPrice.value = jPrice[k - 1];
				document.f1.txtPQty.value = jPQty[k - 1];
				document.f1.txtAmount.value = jAmount[k - 1];
				document.f1.txtDis.value = jDiscountge[k - 1];
				document.f1.txtDisAmt.value = jDiscountAmount[k - 1];
				document.f1.txtGSTge.value = jGSTPtage[k - 1];
				document.f1.txtGSTAmt.value = jGSTAmount[k - 1];
				document.f1.txtNetAmount.value = jNetAmount[k - 1];
				
			}
			function fillRetailerCode() 
			{
				var jRDate=new Array();
				var jRName=new Array();
				var jCity = new Array();
				var jLoc = new Array();
				var jState = new Array();
				var jGST = new Array();
				
				var j = 0, k = 0;
			<% 
					i = 0;
					while (i < RName.length) 
					{
			%>
						jRDate[j] = "<%=RDate[i]%>";
						jRName[j] = "<%=RName[i]%>";
						jCity[j] = "<%=City[i]%>";
						jLoc[j] = "<%=Loc[i]%>";
						jState[j] = "<%=State[i]%>";
						jGST[j] = "<%=GST[i]%>";

						j = j + 1;
				<%
						i = i + 1;
					}
				%>

				k = document.f1.cmbRCode.selectedIndex;
                
				document.f1.txtRDate.value = jRDate[k - 1];
				document.f1.txtRName.value = jRName[k - 1];
				document.f1.txtCity.value = jCity[k - 1];
				document.f1.txtLoc.value = jLoc[k - 1];
				document.f1.txtState.value = jState[k - 1];
				document.f1.txtGST.value = jGST[k - 1];
			}
			function fillProductCode() 
			{
				var jPName = new Array();
				var jCategory = new Array();
				var jPrice = new Array();
				var jGSTPtage=new Array();
				
				var j = 0, k = 0;
				<% 
					int i = 0;
					while (i < PName.length) 
					{
				%>   
						jPName[j] = "<%=PName[i]%>";
						jCategory[j] = "<%=Category[i]%>";
						jPrice[j] = "<%=Price[i]%>";
						jGSTPtage[j] = "<%=GSTge[i]%>";
						
						j = j + 1;
			<%
						i = i + 1;
					}
			%>

				k = document.f1.cmbPCode.selectedIndex;
			   
				document.f1.txtPName.value = jPName[k - 1];
				document.f1.txtCategory.value = jCategory[k - 1];
				document.f1.txtPrice.value = jPrice[k - 1];
				document.f1.txtGSTge.value = jGSTPtage[k - 1];
			}
			function calAmount()
			{
				var orderQty = parseFloat(document.f1.txtPQty.value);
				var price =  parseFloat(document.f1.txtPrice.value);
		
				var amount = orderQty * price;
				document.f1.txtAmount.value = amount;
			}
			function calDisAmount() 
			{
				var Amount = parseFloat(document.f1.txtAmount.value);
				var DisPercentage = parseFloat(document.f1.txtDis.value);
				var DisAmount = Amount*DisPercentage/100;
				var GSTPtage=document.f1.txtGSTge.value
				
				var TaxableAmount =Amount-DisAmount;
				
				var GSTAmount = TaxableAmount*GSTPtage/100;
				
				var NetAmount = TaxableAmount + GSTAmount;
				 
				document.f1.txtDisAmt.value = DisAmount;
				document.f1.txtGSTAmt.value = GSTAmount;
				document.f1.txtNetAmount.value = NetAmount;
			}
			function goBack()
			{
				window.location="OSS_IssueGoodsC.jsp";
			}
		</script>
	</head>
	<body>
		<center>
			<form name="f1" action="OSS_IssueGoodsFS.jsp" method="post">
				<table>
					<tr>
						<nav>
							<h2>Issue Of Goods</h2>
						</nav>
					</tr>
					<tr>
						<td>Invoice No</td>
						<td>: <select name="cmbInvoiceNo" onchange="fillInvoice()">
							<option value="">-Select Invoice No-</option>
						<%
							doConnect();
							try
							{
								stmtInvoiceNo=conn.createStatement();
								rsInvoiceNo=stmtInvoiceNo.executeQuery("SELECT * FROM oss_tblissuegoods");
								while(rsInvoiceNo.next())
								{
									InvoiceNo = rsInvoiceNo.getString("InvoiceNo");
						%>
									<option value="<%= InvoiceNo %>"><%= InvoiceNo %></option>
						<%
								}
							}
							catch(SQLException se)
							{
								System.out.println("Unable to Create Combo");
							}
						%>
						
						<td>Invoice Date</td>
						<td>: <input type="date" name="txtIDate"></td>
					</tr>
					<tr>
						<td colspan="1">Retailer Code</td>
						<td>: <select name="cmbRCode" onchange="fillRetailerCode()">
							<option value="">-Select Retailer Code-</option>
						<%
							doConnect();
							try
							{
								stmtRCode=conn.createStatement();
								rsRCode=stmtRCode.executeQuery("SELECT * FROM oss_tblretailer");
								while (rsRCode.next()) 
								{
									RCodeN = rsRCode.getString("RCode");
						%>
									<option value="<%= RCodeN %>"><%= RCodeN %></option>
						<%
								}
							}
							catch(SQLException se)
							{
								System.out.println("Unable to Create Combo");
							}
						%>
						</td>
						<td>Retailer Date</td>
						<td>: <input type="date" name="txtRDate"></td>
					</tr>
					<tr>
						<td colspan="1">Retailer Name</td>
						<td >: <input type="text" name="txtRName" placeholder="Enter Retailer Name"></td>
						<td>City</td>
						<td>: <input type="text" name="txtCity" size="30" placeholder="Enter District"></td>
					</tr>
					<tr>
						<td>Locality</td>
						<td colspan1="2">: <input type="text" name="txtLoc" size="30" placeholder="Enter Locality"></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>State</td>
						<td rowspan1="2" colspan1="2">: <input type="text" name="txtState" size="30" placeholder="Enter State"></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>GST No</td>
						<td>: <input type="text" name="txtGST" size="30" placeholder="Enter GST No"></td>
						<td>Invoice Type</td>
						<td>: 
							<select name="cmbIType">
							<option value="Select Invoice Type">-Select Invoice Type-</option>
							<option value="Credit">Credit</option>
							<option value="Cash">Cash</option>
						</td>
					</tr>
					<tr>
						<td  style="width: 8%; padding: 16px;"></td>
					</tr>
				</table>
				<table >
					<tr class="highlight-row" style="border: 1px solid #ec0000;">
						<td style="width: 10%; margin-left: 4px; padding: 8px;"><b>SL No</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Product Code</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Product Name</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Category</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Price</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Purchase Qty</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Amount</b></td>
						
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Discount %ge</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Disount Amount</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>GST %ge</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>GST Amount</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Net Amount</b></td>
					</tr>
					<tr >
						<td><input type="text" name="txtSlNo" size="3" placeholder="Enter Serial No" style=" width: 100px; margin-bottom: 5px; margin-top: 5px;"></td>
						<td>
							<select name="cmbPCode" onchange="fillProductCode()" style="width: 100%; margin-top: 5px; margin-bottom: 5px;">
								<option value="">-Select Product Code-</option>
							<% 
								try 
								{
									stmtPCode = conn.createStatement();
									rsPCode = stmtPCode.executeQuery("SELECT * FROM oss_tblproductinfo");
									while (rsPCode.next()) 
									{
										PCodeN = rsPCode.getString("PCode");
							%>
										<option value="<%= PCodeN %>"><%= PCodeN %></option>
							<% 
									}
								} 
								catch (SQLException se) 
								{
									System.out.println("Unable to create combo");
								} 
							%>
							</select>
						</td>
						<td><input type="text" name="txtPName" placeholder="Enter Product Name" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtCategory" placeholder="Enter Category" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtPrice" placeholder="Enter Sell Price" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtPQty" placeholder="Enter Purchase Qty" oninput="calAmount()" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtAmount" placeholder="Enter Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						
						
						<td><input type="text" name="txtDis" placeholder="Enter Discount %ge" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;" onblur="calDisAmount()"></td>
						
						<td><input type="text" name="txtDisAmt" placeholder="Enter Discount Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtGSTge" placeholder="Enter GST %ge" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtGSTAmt" placeholder="Enter GST Amount" oninput="calAmount()" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtNetAmount" placeholder="Enter Net Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
					</tr>
				</table>
				<br>
				<br>
				<input type="submit" name="btnUpdate" value="Update">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="btnDelete" value="Delete">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name="btnBack" value="Back" onclick="goBack()">
			</form>
		</center>
	</body>
</html>