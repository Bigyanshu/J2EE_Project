<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%! 
    Connection conn;
    Statement stmtVoucher, stmtData,stmtRName;
    ResultSet rsVoucher, rsData,rsRName;
    String VNo,RNameN, VDate[], RName[], Loc[], City[], State[], PMode[], RefNo[], RDate[], BName[], Amount[];

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
    VDate = new String[20];
    RName = new String[20];
    Loc = new String[20];
    City = new String[20];
    State = new String[20];
    PMode = new String[20];
    RefNo = new String[20];
    RDate = new String[20];
    BName = new String[20];
    Amount = new String[20];

    doConnect();
    try {
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblreceiptvou");
        int i = 0;
        while (rsData.next()) 
		{
            VDate[i] = rsData.getString("VDate");
            RName[i] = rsData.getString("RName");
            Loc[i] = rsData.getString("Loc");
            City[i] = rsData.getString("City");
            State[i] = rsData.getString("State");
            PMode[i] = rsData.getString("PMode");
            RefNo[i] = rsData.getString("RefNo");
            RDate[i] = rsData.getString("RDate");
            BName[i] = rsData.getString("BName");
            Amount[i] = rsData.getString("Amount");
            i=i+1;
        }
    }
	catch (SQLException e) 
	{
        System.out.println("Error fetching voucher data: " + e);
    }
%>
<html>
<head>
    <title>OSS Receipt Voucher FC</title>
    <link rel="stylesheet" href="CSS_Universal.css">

    <script language="javascript">
        function goFind()
		{
            window.location = "OSS_ReceiptVouFC.jsp";
        }
        function showVoucherNo() 
		{
            var jVNo = new Array();
            var jVDate = new Array();
            var jRName = new Array();
            var jLocality = new Array();
            var jCity = new Array();
            var jState = new Array();
            var jVcode = new Array();
            var jPMode = new Array();
            var jRefNo = new Array();
            var jRDate = new Array();
            var jBName = new Array();
            var jAmount = new Array();

            var j = 0, k = 0;
        <% 
                int i = 0;
                while (i < RName.length) 
                {
      %>
               
                jVDate[j] = "<%= VDate[i] %>";
                jRName[j] = "<%= RName[i] %>";
                jLocality[j] = "<%= Loc[i] %>";
                jCity[j] = "<%= City[i] %>";
                jState[j] = "<%= State[i] %>";
                jPMode[j] = "<%= PMode[i] %>";
                jRefNo[j] = "<%= RefNo[i] %>";
                jRDate[j] = "<%= RDate[i] %>";
                jBName[j] = "<%= BName[i] %>";
                jAmount[j] = "<%= Amount[i] %>";
                        
				j = j + 1;
        <%
                i = i + 1;
            }
        %>
            k = document.f1.cmbVNo.selectedIndex;
            
            document.f1.txtVDate.value = jVDate[k - 1];
            document.f1.cmbRName.value = jRName[k - 1];
            document.f1.txtLoc.value = jLocality[k - 1];
			document.f1.txtCity.value = jCity[k - 1];
			document.f1.txtState.value = jState[k - 1];
            document.f1.cmbPMode.value = jPMode[k - 1];
            document.f1.txtRefNo.value = jRefNo[k - 1];
            document.f1.txtRDate.value = jRDate[k - 1];
            document.f1.cmbBName.value = jBName[k - 1];
            document.f1.txtAmount.value = jAmount[k - 1];
        }
    </script>
</head>

<body>
    <center>
        <form action="OSS_ReceiptVouFS.jsp" name="f1" method="post">
            <nav>
                <h2>Receipt Voucher</h2>
            </nav>
            <table>
                <tr>
                    <td>Voucher No</td>
                    <td>:
                        <select name="cmbVNo" onchange="showVoucherNo()">
                            <option value="">-select-</option>
                            <%
                                doConnect();
                                try {
                                    stmtVoucher = conn.createStatement();
                                    rsVoucher = stmtVoucher.executeQuery("SELECT * FROM oss_tblreceiptvou");
                                    while (rsVoucher.next())
									{
                                        VNo = rsVoucher.getString("VNo");
                            %>
                                        <option value="<%= VNo %>"><%= VNo %></option>
                            <%
                                    }
                                } 
								catch (SQLException ex) 
								{
                                    System.out.println("Unable to create combo"+ex);
                                }
                            %>
                        </select>
                    </td>
                    <td>V Date</td>
                    <td>: <input type="date" name="txtVDate"></td>
                </tr>
               <tr>
                    <td>Retailer Name</td>
                    <td>:
                        <select name="cmbRName" onchange="showReceipt()" >
                            <option value="">-Select Retailer Name-</option>
                            <%
                                doConnect();
                                try 
								{
                                    stmtRName = conn.createStatement();
                                    rsRName = stmtRName.executeQuery("SELECT * FROM oss_tblreceiptvou");
                                    while (rsRName.next()) 
									{
                                        RNameN = rsRName.getString("RName");
                            %>
                                        <option value="<%= RNameN %>"><%= RNameN %></option>
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
            <input type="submit" name="btnUpdate" value="Update" id="updatebtn">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="btnDelete" value="Delete" id="deletebtn">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="btnback" value="<<&nbsp;&nbsp;Back" formaction="OSS_ReceiptVouC.jsp">
       </form>
    </center>
</body>

</html>