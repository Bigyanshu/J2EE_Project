<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%! 
    Connection conn;
    Statement stmtData, stmtONo,stmtRName,stmtPCode;
    ResultSet rsData, rsONo,rsRName,rsPCode;
    String ONo,RNameN,PCodeN,Date[],RName[],RetCode[], Loc[], City[], State[], GST[],SlNo[],PCode[], PName[],Category[], Price[],OQty[], Amount[];
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
	
	Date=new String[20];
    RName=new String[20];
    RetCode=new String[20];
    Loc = new String[20];
    City = new String[20];
    State = new String[20];
    GST = new String[20];
    SlNo = new String[20];
	PCode = new String[20];
    PName = new String[20];
    Category = new String[20];
    Price = new String[20];
    OQty = new String[20];
    Amount = new String[20];
    try 
	{
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblorderfrom");
        i = 0;
        while (rsData.next()) 
		{
            Date[i] = rsData.getString("Date");
            RName[i] = rsData.getString("RName");
            RetCode[i] = rsData.getString("RetCode");
            Loc[i] = rsData.getString("Loc");
            City[i] = rsData.getString("City");
            State[i] = rsData.getString("State");
            GST[i] = rsData.getString("GST");
            SlNo[i] = rsData.getString("SlNo");
            PCode[i] = rsData.getString("PCode");
			PName[i] = rsData.getString("PName");
			Category[i] = rsData.getString("Category");
            Price[i] = rsData.getString("Price");
            OQty[i] = rsData.getString("OQty");
            Amount[i] = rsData.getString("Amount");
			
            i = i + 1;
        }
    } 
	catch (SQLException se) 
	{
        System.out.println("Unable to Fill Array"+se);
    }
%>

<html>
	<head>
		<title>OSS Order From FC</title>
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
			function fillOrderNo()
			{
				jDate = new Array();
				jRName = new Array();
				jRetCode = new Array();
				jLocality = new Array();
				jCity= new Array();
				jState = new Array();
				jGST = new Array();
				jSlNo = new Array();
				jPCode = new Array();
				jPName = new Array();
				jCategory = new Array();
				jPrice = new Array();
				jOQty = new Array();
				jAmount = new Array();
				
				var j = 0, k = 0;
			<% 
					i = 0;
					while (i < RName.length) 
					{
			%>
						jDate[j] = "<%=Date[i]%>";
						jRName[j] = "<%=RName[i]%>";
						jRetCode[j] = "<%=RetCode[i]%>";
						jLocality[j] = "<%=Loc[i]%>";
						jCity[j] = "<%=City[i]%>";
						jState[j] = "<%=State[i]%>";
						jGST[j] = "<%=GST[i]%>";
						jSlNo[j] = "<%=SlNo[i]%>";
						jPCode[j] = "<%=PCode[i]%>";
						jPName[j] = "<%=PName[i]%>";
						jCategory[j] = "<%=Category[i]%>";
						jPrice[j] = "<%=Price[i]%>";
						jOQty[j] = "<%=OQty[i]%>";
						jAmount[j] = "<%=Amount[i]%>";
						
						j = j + 1;
				<%
						i = i + 1;
					}
				%>

				k = document.f1.cmbONo.selectedIndex;
				
				document.f1.txtDate.value = jDate[k - 1];
				document.f1.cmbRName.value = jRName[k - 1];
				document.f1.txtRCode.value = jRetCode[k - 1];
				document.f1.txtLoc.value = jLocality[k - 1];
				document.f1.txtCity.value = jCity[k - 1];
				document.f1.txtState.value = jState[k - 1];
				document.f1.txtGST.value = jGST[k - 1];
				document.f1.txtSlNo.value = jSlNo[k - 1];
				document.f1.cmbPCode.value = jPCode[k - 1];
				document.f1.txtPName.value = jPName[k - 1];
				document.f1.txtCategory.value = jCategory[k - 1];
				document.f1.txtPrice.value = jPrice[k - 1];
				document.f1.txtOQty.value = jOQty[k - 1];
				document.f1.txtAmount.value = jAmount[k - 1];
				
			}
			function fillRetailer() 
			{
				var jRetCode=new Array();
				var jLocality = new Array();
				var jCity = new Array();
				var jState = new Array();
				var jGST = new Array();
				
				var j = 0, k = 0;
			<% 
					 i = 0;
					while (i < Loc.length) 
					{
			%>
						jRetCode[j] = "<%=RetCode[i]%>";
						jLocality[j] = "<%=Loc[i]%>";
						jCity[j] = "<%=City[i]%>";
						jState[j] = "<%=State[i]%>";
						jGST[j] = "<%=GST[i]%>";

						j = j + 1;
				<%
						i = i + 1;
					}
				%>

				k = document.f1.cmbRName.selectedIndex;
				
				document.f1.txtRCode.value = jRetCode[k - 1];
				document.f1.txtLoc.value = jLocality[k - 1];
				document.f1.txtCity.value = jCity[k - 1];
				document.f1.txtState.value = jState[k - 1];
				document.f1.txtGST.value = jGST[k - 1];
			}
			function fillProduct() 
			{
				var jPName = new Array();
				var jCategory = new Array();
				var jPrice = new Array();
				
				var j = 0, k = 0;
				<% 
					int i = 0;
					while (i < PName.length) 
					{
			%>   
						jCategory[j] = "<%=Category[i]%>";
						jPName[j] = "<%=PName[i]%>";
						jPrice[j] = "<%=Price[i]%>";
						
						j = j + 1;
			<%
						i = i + 1;
					}
				%>

					k = document.f1.cmbPCode.selectedIndex;
				   
					document.f1.txtPName.value = jPName[k - 1];
					document.f1.txtCategory.value = jCategory[k - 1];
					document.f1.txtPrice.value = jPrice[k - 1];
			}
			function calAmount()
			{
				var orderQty = parseFloat(document.f1.txtOQty.value);
				var price =  parseFloat(document.f1.txtPrice.value);
		
				var amount = orderQty * price;
				document.f1.txtAmount.value = amount;
			}
			function goBack()
			{
				window.location="OSS_OrderFromC.jsp";
			}
		</script>
	</head>
	<body>
		<center>
			<form name="f1" action="OSS_OrderFromFS.jsp" method="post">
				
				<table>
					<tr>
						<nav>
							<h2>Order From Retailer</h2>
						</nav>
					</tr>
					<tr>
						<td>Order No</td>
						<td colspan="2">: 
							<select name="cmbONo" onchange="fillOrderNo()">
								<option value="">-Select Requisition No-</option>
								<%
									doConnect();
									try 
									{
										stmtONo = conn.createStatement();
										rsONo = stmtONo.executeQuery("SELECT * FROM oss_tblorderfrom");
										while (rsONo.next()) 
										{
											ONo = rsONo.getString("ONo");
								%>
											<option value="<%= ONo %>"><%= ONo %></option>
								<%
										}
									} 
									catch (SQLException se)
									{
										System.out.println("Unable to Create Combo");
									}
								%>
							</select>
						<td></td>
						<td>Date</td>
						<td >: <input type="date" name="txtDate"></td>
					</tr>
					<tr>
						<td>Retailer Name</td>
						<td colspan="2">: 
							<select name="cmbRName" onchange="fillRetailer()">
								<option value="">-Select Retailer Name-</option>
								<%
									doConnect();
									try 
									{
										stmtRName = conn.createStatement();
										rsRName = stmtRName.executeQuery("SELECT * FROM oss_tblretailer");
										while (rsRName.next()) 
										{
											RNameN = rsRName.getString("RName");
								%>
											<option value="<%= RNameN %>"><%= RNameN %></option>
								<%
										}
									} 
									catch (SQLException se)
									{
										System.out.println("Unable to Create Combo"+se);
									}
								%>
							</select>
							<td></td>
							<td>Retailer Code</td>
							<td>: <input type="text" name="txtRCode" size="30" placeholder="Enter Retailer Code" style="width: 88%;" ></td>
						</td>
					</tr>
					<tr>
						<td>Locality</td>
						<td colspan="2">: <input type="text" name="txtLoc" size="30" placeholder="Enter Locality"></td>
					</tr>
					<tr>
						<td>City/District</td>
						<td colspan="2">: <input type="text" name="txtCity" size="30" placeholder="Enter District"></td>
					</tr>
					<tr>
						<td>State</td>
						<td colspan="2">: <input type="text" name="txtState" size="30" placeholder="Enter State">
						</td>
						<td></td>
						<td>GST No</td>
						<td colspan="2">: <input type="text" name="txtGST" size="30" placeholder="Enter GST No"></td>
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
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Order Qty</b></td>
						<td style="width: 15%; margin-left: 4px; padding: 8px;"><b>Amount</b></td>
					</tr>
					<tr >
						<td><input type="text" name="txtSlNo" size="3" placeholder="Enter Serial No" style=" width: 100px; margin-bottom: 5px; margin-top: 5px;"></td>
						<td>
							<select name="cmbPCode" onchange="fillProduct()" style="width: 100%; margin-top: 5px; margin-bottom: 5px;">
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
						
						<td><input type="text" name="txtPrice" placeholder="Enter Price" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtOQty" placeholder="Enter Order Qty" oninput="calAmount()" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtAmount" placeholder="Enter Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
					</tr>
				</table>
				<br>
				<br>
				<input type="submit" name="btnUpdate" value="Update" >
				<input type="submit" name="btnDelete" value="Delete" >
				<input type="button" name="btnBack" value="Back" onclick="goBack()">
			</form>
		</center>
	</body>
</html>