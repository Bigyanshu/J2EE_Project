<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%! 
    Connection conn;
    Statement stmtData, stmtRCode,stmtPCode;
    ResultSet rsData, rsRCode,rsPCode;
    String RetCode, PCode, InvoiceNo, IDate, RDate[], RName[], Loc[], City[], State[], GST[], PName[],Category[], Price[], Stock[],Amount[],GSTPtage[];
    int i,stk;

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
	RDate= new String[20];
    RName = new String[20];
    Loc = new String[20];
    City = new String[20];
    State = new String[20];
    GST = new String[20];

    doConnect();
    try
	{
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblretailer");
        i = 0;
        while (rsData.next()) 
		{
            RDate[i] = rsData.getString("Date");
            RName[i] = rsData.getString("RName");
            Loc[i] = rsData.getString("Loc");
            City[i] = rsData.getString("City");
            State[i] = rsData.getString("State");
            GST[i] = rsData.getString("GST");
            i = i + 1;
        }
    } 
	catch (SQLException e) 
	{
        System.out.println("Unable to Fill Array");
    }
    PName = new String[20];
    Category = new String[20];
    Price = new String[20];
	GSTPtage =new String[20];
	Stock=new String[20];

    doConnect();
    try 
	{
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblproductinfo");
        i = 0;
        while (rsData.next()) 
		{
            PName[i] = rsData.getString("PName");
            Category[i] = rsData.getString("PCCode");
            Price[i] = rsData.getString("SPrice");
            GSTPtage[i] = rsData.getString("TSlab");
			Stock[i] = rsData.getString("Stock");
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
		<title>OSS Issue of Goods Client</title>
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
		<script>
			function fillRetailerCode() 
			{
				var jRDate=new Array();
				var jRName=new Array();
				var jLoc = new Array();
				var jCity = new Array();
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
						jLoc[j] = "<%=Loc[i]%>";
						jCity[j] = "<%=City[i]%>";
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
				document.f1.txtLoc.value = jLoc[k - 1];
				document.f1.txtCity.value = jCity[k - 1];
				document.f1.txtState.value = jState[k - 1];
				document.f1.txtGST.value = jGST[k - 1];
			}
			function fillProductCode() 
			{
				var jPName = new Array();
				var jCategory = new Array();
				var jPrice = new Array();
				var jGSTPtage =new Array();
				var jStock =new Array();
				
				var j = 0, k = 0;
				<% 
					int i = 0;
					while (i < PName.length) 
					{
				%>   
						jPName[j] = "<%=PName[i]%>";
						jCategory[j] = "<%=Category[i]%>";
						jPrice[j] = "<%=Price[i]%>";
						jGSTPtage[j] = "<%=GSTPtage[i]%>";
						jStock[j] = "<%=Stock[i]%>";
						
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
					stk=parseInt(jStock[k-1]);
			}
			function calAmount()
			{
				var orderQty,price,amount;
				var orderQty = parseFloat(document.f1.txtPQty.value);
				var price =  parseFloat(document.f1.txtPrice.value);
				if(orderQty <= stk)
				{
					document.getElementById("msg").innerHTML="";
					var amount = orderQty * price;
					document.f1.txtAmount.value = amount;
				}
				else
				{
					//alert("Insufficient Stock");
					document.getElementById("msg").innerHTML="Insufficient Stock";
					document.f1.txtPQty.focus();
				}
			}
			function calDisAmount() 
			{
				var Amount = parseFloat(document.f1.txtAmount.value);
				var DisPercentage = parseFloat(document.f1.txtDis.value);
				var DisAmount = Amount*DisPercentage/100;
				
				//var GSTPtage = parseFloat(document.f1.txtGST.value);
				
				var GSTPtage=12.0;
				var TaxableAmount =Amount-DisAmount;
				
				var GSTAmount = TaxableAmount*GSTPtage/100;
				
				
				var NetAmount = TaxableAmount + GSTAmount;
				 
				document.f1.txtDisAmt.value = DisAmount;
				document.f1.txtGSTAmt.value = GSTAmount;
				document.f1.txtNetAmount.value = NetAmount;
			}
		</script>
	</head>
	<body>
		<center>
			<form name="f1" action="OSS_IssueGoodsS.jsp" method="post">
				<table>
					<tr>
						<nav>
							<h2>Issue Of Goods</h2>
						</nav>
					</tr>
					<tr>
						<td>Invoice No</td>
						<td>: <input type="text" name="txtInvoice" size="30" placeholder="Enter Invoice No"></td>
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
									RetCode = rsRCode.getString("RCode");
						%>
									<option value="<%= RetCode %>"><%= RetCode %></option>
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
						<td>Loc</td>
						<td colspan1="2">: <input type="text" name="txtLoc" size="30" placeholder="Enter Loc"></td>
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
										PCode = rsPCode.getString("PCode");
							%>
										<option value="<%= PCode %>"><%= PCode %></option>
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
						
						<td><input type="text" name="txtPQty" placeholder="Enter Purchase Qty" onblur="calAmount()" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtAmount" placeholder="Enter Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						
						
						<td><input type="text" name="txtDis" placeholder="Enter Discount %ge" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;" onblur="calDisAmount()"></td>
						
						<td><input type="text" name="txtDisAmt" placeholder="Enter Discount Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtGSTge" placeholder="Enter GST %ge" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtGSTAmt" placeholder="Enter GST Amount" oninput="calAmount()" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtNetAmount" placeholder="Enter Net Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
					</tr>
				</table>
				<p id="msg"></p>
				<br>
				<br>
				<input type="submit" name="btnSubmit" value="Submit" >&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name="btnFind" value="Find" onclick="goFind()">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" name="btnReset" value="Reset">
			</form>
		</center>
		<script>
			function goFind()
			{
				window.location="OSS_IssueGoodsFC.jsp";
			}
		</script>
	</body>
</html>