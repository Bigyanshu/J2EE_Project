<%@ page language="java" contentType="text/html" import="java.sql.* " %>
<%! 
    Connection conn;
    Statement stmtData, stmtRName;
    ResultSet rsData, rsRName;
    String RName, Locality[], City[], State[];

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
    Locality = new String[20];
    City = new String[20];
    State = new String[20];
    
    doConnect();
    try {
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblretailer");
        i = 0;
        while (rsData.next())
		{
            Locality[i] = rsData.getString("Loc");
            City[i] = rsData.getString("City");
            State[i] = rsData.getString("State");
           
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
		<title>Payment Voucher</title>
		<link rel="stylesheet" href="CSS_Universal.css">
		<script language="javascript">
			function showRetailer() 
			{
				var jLocality,jCity,jState;
				
				jLocality = new Array();
				jCity = new Array();
				jState = new Array();
			   
				var j = 0, k = 0;
				<% 
					i = 0;
					while (i < Locality.length) 
					{
				%>
						jLocality[j] = "<%=Locality[i]%>";
						jCity[j] = "<%=City[i]%>";
						jState[j] = "<%=State[i]%>";

						j = j + 1;
				<%
						i = i + 1;
					}
				%>
				k = document.f1.cmbRName.selectedIndex;
				
				document.f1.txtLoc.value = jLocality[k - 1];
				document.f1.txtCity.value = jCity[k - 1];
				document.f1.txtState.value = jState[k - 1];
			}
		</script>
	</head>

	<body>
    <center>
        <form name="f1" action="OSS_ReceiptVouS.jsp" method="post">
            <nav>
                <h2>Receipt Voucher</h2>
            </nav>
            <table>
               <tr>
                <td>Voucher No</td>
                    <td>: <input type="text" name="txtVNo" size="30" placeholder="Enter Voucher No" width: 50;></td>
                    <td>V Date</td>
                    <td>: <input type="date" name="txtVDate" placeholder="Enter Date" size="30" width: 50;></td>
               </tr>
                <tr>
                    <td>Retailer Name</td>
                    <td>:
                        <select name="cmbRName" onchange="showRetailer()" width: 50;>
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
								catch (SQLException ex) 
								{
                                    System.out.println("Unable to create combo");
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Locality</td>
                    <td colspan="2">: <input type="text" name="txtLoc" size="30" placeholder="Enter Locality" ></td>
                </tr>
				
                <tr>
                    <td>City/District</td>
                    <td >: <input type="text" name="txtCity" size="30" placeholder="Enter City" ></td>
                </tr>
                <tr>
                    <td>State/U.Territory</td>
                    <td colspan="2">: <input type="text" name="txtState" size="30" placeholder="Enter State" ></td>
                </tr>
                <tr>
                    <td>Payment Mode</td>
                    <td> :
                        <select name="cmbPMode" width: 50;>
                            <option value="--Select Payment Mode--">--Select Payment Mode--</option>
                            <option value="CASH">CASH</option>
                            <option value="CHEQUE">CHEQUE</option>
                            <option value="DRAFT">DRAFT</option>
                            <option value="ONLINE">ONLINE</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Reference No</td>
                    <td>: <input type="text" name="txtRefNo" placeholder="Enter Reference No" size="30" width: 50;></td>
                    
                    <td>Date</td>
                    <td>: <input type="date" name="txtRDate" placeholder="Enter Reference Date" size="30" width: 50;></td>
                </tr>

                <tr>
                    <td>Bank Name</td>
                <td>:
                    <select name="cmbBName">
						<option value="--Select Bank--">--Select Bank--</option>
                        <option value="SBI">State Bank of India (SBI)</option>
                        <option value="ICICI">ICICI Bank</option>
                        <option value="HDFC">HDFC Bank</option>
                        <option value="AXIS">Axis Bank</option>
                        <option value="BOI">Bank of India (BOI)</option>
                        <option value="PNB">Punjab National Bank (PNB)</option>
                        <option value="Kotak">Kotak Mahindra Bank</option>
                        <option value="Canara">Canara Bank</option>
                    </select>
                </td>
                <tr>
                    <td>Amount</td>
                    <td>: <input type="text" name="txtAmount" size="30" placeholder="Enter Amount" width: 50;></td>
                </tr>
            </table>
            <br>
            <input type="submit" name="btnSubmit" value="Submit">					&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name="btnFind" value="Find" onclick="goFind()">	&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" name="btnReset" value="Reset">
		</form>
	</center>
	<script>
		function goFind()
		{
			window.location="OSS_ReceiptVouFC.jsp";
		}
	</script>
</body>
</html>