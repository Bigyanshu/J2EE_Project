<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%! 
    Connection conn;
    Statement stmtData, stmtCName,stmtPCode;
    ResultSet rsData, rsCName,rsPCode;
    String CName1,PCode1,CRegdNo1[], Locality1[], City1[], State1[], GST1[], PName1[],Category1[], Price1[], Amount1[];
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
    CRegdNo1=new String[20];
    Locality1 = new String[20];
    City1 = new String[20];
    State1 = new String[20];
    GST1 = new String[20];

    doConnect();
    try
	{
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblcompany");
        i = 0;
        while (rsData.next()) 
		{
            CRegdNo1[i] = rsData.getString("Regd");
            Locality1[i] = rsData.getString("Loc");
            City1[i] = rsData.getString("City");
            State1[i] = rsData.getString("State");
            GST1[i] = rsData.getString("GST");
            i = i + 1;
        }
    } 
	catch (SQLException e) 
	{
        System.out.println("Unable to fill array");
    }
	
    PName1 = new String[20];
    Category1 = new String[20];
    Price1 = new String[20];

    doConnect();
    try 
	{
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblproductinfo");
        i = 0;
        while (rsData.next()) 
		{
            PName1[i] = rsData.getString("PName");
            Category1[i] = rsData.getString("PCCode");
            Price1[i] = rsData.getString("CPrice");
            i = i + 1;
        }
    } 
	catch (SQLException se) 
	{
        System.out.println("Unable to Fill Array");
    }
%>

<html>
	<head>
		<title>OSS Requisition Client</title>
		<link rel="stylesheet" href="CSS_Universal.css">
			<style>
				.highlight-row {
					border: 2px solid #000;
					background-color: rgb(131, 49, 238);
					color: rgb(255, 255, 255);
					text-align: center;
					border-radius: 50px;
				}
			</style>
		<script>
			function fillCompany() 
			{
				var jCRegdNo=new Array();
				var jLocality = new Array();
				var jCity = new Array();
				var jState = new Array();
				var jGST = new Array();
				
				var j = 0, k = 0;
				
			<% 
					 i = 0;
					while (i < Locality1.length) 
					{
			%>
						jCRegdNo[j] = "<%=CRegdNo1[i]%>";
						jLocality[j] = "<%=Locality1[i]%>";
						jCity[j] = "<%=City1[i]%>";
						jState[j] = "<%=State1[i]%>";
						jGST[j] = "<%=GST1[i]%>";

						j = j + 1;
				<%
						i = i + 1;
					}
				%>

				k = document.f1.cmbCName.selectedIndex;
                
				document.f1.txtCRegdNo.value = jCRegdNo[k - 1];
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
					while (i < PName1.length) 
					{
				%>   
							jPName[j] = "<%=PName1[i]%>";
							jCategory[j] = "<%=Category1[i]%>";
							jPrice[j] = "<%=Price1[i]%>";
							
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
			<form name="f1" action="OSS_CompReqS.jsp" method="post">
				
				<table>
					<tr>
						<nav>
							<h2>Company Requisition</h2>
						</nav>
					</tr>
					<tr>
						<td>Requisition No</td>
						<td colspan="2">: <input type="text" name="txtReqNo" size="30" placeholder="Enter Requisition No"></td>
						<td></td>
						<td>Date</td>
						<td >: <input type="date" name="txtDate"></td>
					</tr>
					<tr>
						<td>Company Name</td>
						<td colspan="2">: 
							<select name="cmbCName" onchange="fillCompany()">
								<option value="">-Select Company Name-</option>
								<%
									doConnect();
									try 
									{
										stmtCName = conn.createStatement();
										rsCName = stmtCName.executeQuery("SELECT * FROM oss_tblcompany");
										while (rsCName.next()) 
										{
											CName1 = rsCName.getString("CName");
								%>
											<option value="<%= CName1 %>"><%= CName1 %></option>
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
							<td>Comp Regd No</td>
							<td>: <input type="text" name="txtCRegdNo" size="30" placeholder="Enter Company Regd No" style="width: 88%;" ></td>
						</td>
					</tr>
					<tr>
						<td>Locality</td>
						<td colspan="2">: <input type="text" name="txtLoc" size="30" placeholder="Enter Locality1"></td>
					</tr>
					<tr>
						<td>City/District</td>
						<td colspan="2">: <input type="text" name="txtCity" size="30" placeholder="Enter District"></td>
					</tr>
					<tr>
						<td>State</td>
						<td colspan="2">: <input type="text" name="txtState" size="30" placeholder="Enter State1">
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
										PCode1 = rsPCode.getString("PCode");
							%>
										<option value="<%= PCode1 %>"><%= PCode1 %></option>
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
						
						<td><input type="text" name="txtPrice" placeholder="Enter Cost Price" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtOQty" placeholder="Enter Order Qty" oninput="calAmount()" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
						
						<td><input type="text" name="txtAmount" placeholder="Enter Amount" style="width: 100%; margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
					</tr>
				</table>
				<br>
				<br>
				<input type="submit" name="btnSubmit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name="btnFind" value="Find" onclick="goFind()">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" name="btnReset" value="Reset">
			</form>
		</center>
		<script>
			function goFind()
			{
				window.location="OSS_CompReqFC.jsp";
			}
		</script>
	</body>
</html>