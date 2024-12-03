<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%! 
    Connection conn;
    Statement stmtData, stmtRName,stmtPCode;
    ResultSet rsData, rsRName,rsPCode;
    String RName,PCode,RetCode[], Loc[], City[], State[], GST[], PName[],Category[], Price[], Amount[];
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
    RetCode=new String[20];
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
            RetCode[i] = rsData.getString("RCode");
            Loc[i] = rsData.getString("Loc");
            City[i] = rsData.getString("City");
            State[i] = rsData.getString("State");
            GST[i] = rsData.getString("GST");
            i = i + 1;
        }
    } 
	catch (SQLException e) 
	{
        System.out.println("Unable to Fill Array-2"+e);
    }
	
    PName = new String[20];
    Category = new String[20];
    Price = new String[20];

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
		<title>OSS Order From Client</title>
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
			function fillRetailer() 
			{
				var jRetCode=new Array();
				var jLoc = new Array();
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
						jLoc[j] = "<%=Loc[i]%>";
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
				document.f1.txtLoc.value = jLoc[k - 1];
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
							jPName[j] = "<%=PName[i]%>";
							jCategory[j] = "<%=Category[i]%>";
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
		</script>
	</head>
	<body>
		<center>
			<form name="f1" action="OSS_OrderFromC.jsp" method="post">
				
				<table>
					<tr>
						<nav>
							<h2>Order From Retailer</h2>
						</nav>
					</tr>
					<tr>
						<td>Order No</td>
						<td colspan="2">: <input type="text" name="txtONo" size="30" placeholder="Enter Order No"></td>
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
											RName = rsRName.getString("RName");
								%>
											<option value="<%= RName %>"><%= RName %></option>
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
						
						<td><input type="text" name="txtPrice" placeholder="Enter Price" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtOQty" placeholder="Enter Order Qty" oninput="calAmount()" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtAmount" placeholder="Enter Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
					</tr>
				</table>
				<br>
				<br>
				<input type="submit" name="btnSubmit" value="Submit" formaction="OSS_OrderFromS.jsp">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name="btnFind" value="Find" onclick="goFind()">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" name="btnReset" value="Reset">
			</form>
		</center>
		<script>
			function goFind()
			{
				window.location="OSS_OrderFromFC.jsp";
			}
		</script>
	</body>
</html>