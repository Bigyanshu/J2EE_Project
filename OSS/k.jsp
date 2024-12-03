<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%! 
    Connection conn;
    Statement stmtProduct_code, stmtdata, stmtVendor_code, stmtItem_name, stmtVname;
    ResultSet rsProduct_code, rsdata, rsItem_name, rsVname;
    String Product_code, Vendor_name[], Item_name[], Product_name[], Cost_price[], Regdno[], Vtype[], Locality[], City_district[], State_ut[], Date[];

    Statement stmtVtype;
    ResultSet rsVtype;
    
    String Vname;
    String vregds[];
    int i;

    public void doConnect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "root", "root");
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error connecting to the database: " + e.getMessage());
        }
    }
%>

<%
    Item_name = new String[20];
    Product_name = new String[20];
    Cost_price = new String[20];

    doConnect();
    try {
        stmtdata = conn.createStatement();
        rsdata = stmtdata.executeQuery("SELECT * FROM oss_tblproductinfo");
        i = 0;
        while (rsdata.next()) {
            Product_name[i] = rsdata.getString("Product_name");
            Item_name[i] = rsdata.getString("Item_name");
            Cost_price[i] = rsdata.getString("Cost_price");
            i = i + 1;
        }
    } catch (SQLException e) {
        System.out.println("Unable to fill array");
    }

    Vtype = new String[20];
    Locality = new String[20];
    City_district = new String[20];
    State_ut = new String[20];
    Date = new String[20];
    Regdno=new String[20];

    doConnect();
    try {
        stmtdata = conn.createStatement();
        rsdata = stmtdata.executeQuery("SELECT * FROM tap_tblvendor");
        i = 0;
        while (rsdata.next()) {
            Vtype[i] = rsdata.getString("Vendor_type");
            Locality[i] = rsdata.getString("Locality");
            City_district[i] = rsdata.getString("City_district");
            State_ut[i] = rsdata.getString("State_ut");
            Date[i] = rsdata.getString("Date");
            Regdno[i] = rsdata.getString("Regdno");
            i = i + 1;
        }
    } catch (SQLException e) {
        System.out.println("Unable to fill array");
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Order to Vendor</title>
    <link rel="stylesheet" href="tapstyles.css">
    <style>
        .highlight-row {
            border: 2px solid #000;
            background-color: rgb(24, 209, 33);
            color: white;
            text-align: center;
            border-radius: 10px;
        }
    </style>
    <script>
        function showvalue() {
            var jVtype = new Array();
            var jLocality = new Array();
            var jCity_district = new Array();
            var jState_ut = new Array();
            var jDate = new Array();
            var jRegdno=new Array();
            var j = 0, k = 0;

            <% 
                 i = 0;
                while (i < Locality.length) 
                {
            %>
                      
                    jLocality[j] = "<%=Locality[i]%>";
                    jCity_district[j] = "<%=City_district[i]%>";
                    jState_ut[j] = "<%=State_ut[i]%>";
                    jDate[j] = "<%=Date[i]%>";
                    jRegdno[j] = "<%=Regdno[i]%>";
                    jVtype[j] = "<%=Vtype[i]%>";

                    j = j + 1;
            <%
                    i = i + 1;
                }
            %>

            k = document.f1.cmbVname.selectedIndex;

            document.f1.cmbVtype.value = jVtype[k - 1];
            document.f1.txtAreaLocality.value = jLocality[k - 1];
            document.f1.txtCity.value = jCity_district[k - 1];
            document.f1.cmbState.value = jState_ut[k - 1];
            document.f1.txtDate.value = jDate[k - 1];
            document.f1.txtVcode.value = jRegdno[k - 1];
        }

        function showdata() {
            var jItem_name = new Array();
            var jProduct_name = new Array();
            var jCost_price = new Array();
            var j = 0, k = 0;

            <% 
                int i = 0;
                while (i < Product_name.length) 
                {
            %>   
                        jItem_name[j] = "<%=Item_name[i]%>";
                        jProduct_name[j] = "<%=Product_name[i]%>";
                        jCost_price[j] = "<%=Cost_price[i]%>";
                        
                        j = j + 1;
            <%
                        i = i + 1;
                    }
                %>

                k = document.f1.cmbProduct_code.selectedIndex;
               
                document.f1.txtCatagory.value = jItem_name[k - 1];
                document.f1.txtPName.value = jProduct_name[k - 1];
                document.f1.txtPrice.value = jCost_price[k - 1];
        }

        
    function calculateAmount() {
        var orderQty = parseFloat(document.f1.txtOrderqty.value);
        var price =  parseFloat(document.f1.txtPrice.value);
    
            var amount = orderQty * price;
            document.f1.txtAmount.value = amount;
        
    }
    </script>
</head>

<body>
    <center>
        <form action="tap_ordertos.jsp" name="f1" method="post">
            
            <table>
            <tr>
            <nav>
                <h2>Order to Vendor</h2>
            </nav>
            </tr>
                <tr>
                    <td>Order Number:</td>
                    <td colspan="2"><input type="text" name="txtOrderno" size="30" placeholder="Order no"></td>
                    <td></td>
                    <td>Date:</td>
                    <td ><input type="date" name="txtDate"></td>
                </tr>
                <tr>
                
                        <td>Vendor Name:</td>
                        <td colspan="2">
                            <select name="cmbVname" onchange="showvalue()">
                                <option value="">-select-</option>
                                <%
                                    doConnect();
                                    try {
                                        stmtVname = conn.createStatement();
                                        rsVname = stmtVname.executeQuery("SELECT * FROM tap_tblvendor");
                                        while (rsVname.next()) {
                                            Vname = rsVname.getString("Vendor_name");
                                %>
                                            <option value="<%= Vname %>"><%= Vname %></option>
                                <%
                                        }
                                    } catch (SQLException ex) {
                                        System.out.println("Unable to create combo");
                                    }
                                %>
                            </select>
                            <td></td>
                            <td>Regd. No:</td>
                            <td><input type="text" name="txtVcode" size="30" placeholder="code" style="width: 88%;" ></td>
                        </td>
                </tr>
                
                <tr>
                    <td>Locality:</td>
                    <td colspan="2"><input type="text" name="txtAreaLocality" size="30" placeholder="Locality"></td>
                </tr>
                <tr>
                    <td>City/District:</td>
                    <td colspan="2"><input type="text" name="txtCity" size="30" placeholder="City"></td>
                </tr>
                <tr>
                    <td>State/U.Territory:</td>
                    <td colspan="2"><input type="text" name="cmbState" size="30" placeholder="State">
                    </td>
                    <td></td>
                    <td>V.Type:</td>
                    
                       <td colspan="2"><input type="text" name="cmbVtype" size="30" placeholder="Category"></td>
                   
                </tr>
                <tr>
    <td  style="width: 8%; padding: 16px;"></td>
</tr>
</table><table >
    <tr class="highlight-row" style="border: 1px solid #000;">
        <td style="width: 8%; padding: 8px;"><b>Sl.no</b></td>
        <td style="width: 15%; padding: 8px;"><b>Product Code</b></td>
        <td style="width: 19%; padding: 8px;"><b>Product Name</b></td>
        <td style="width: 15%; padding: 8px;"><b>Category</b></td>
        <td style="width: 10%; padding: 8px;"><b>Price</b></td>
        <td style="width: 15%; padding: 8px;"><b>Order quantity</b></td>
        <td style="width: 20%; padding: 8px;"><b>Amount</b></td>
    </tr>
    <tr >
        <td><input type="text" name="txtslno" size="3" placeholder="Sl no" style=" width: 35px; margin-bottom: 5px; margin-top: 5px;"></td>
        <td>
            <select name="cmbProduct_code" onchange="showdata()" style="width: 100%; margin-top: 5px; margin-bottom: 5px;">
                <option value="">-select-</option>
                <% try {
                    stmtProduct_code = conn.createStatement();
                    rsProduct_code = stmtProduct_code.executeQuery("SELECT * FROM tap_tbliteminfo");
                    while (rsProduct_code.next()) {
                        Product_code = rsProduct_code.getString("Product_code");
                %>
                        <option value="<%= Product_code %>"><%= Product_code %></option>
                <% }
                } catch (SQLException ex) {
                    System.out.println("Unable to create combo");
                } %>
            </select>
        </td>
        <td><input type="text" name="txtPName" size="15" placeholder="Product Name" style="margin-bottom: 5px; margin-top: 5px;"></td>
        <td><input type="text" name="txtCatagory" size="10" placeholder="Category" style="margin-bottom: 5px; margin-top: 5px;"></td>
        <td><input type="text" name="txtPrice" size="5" placeholder="Price" style="margin-bottom: 5px; margin-top: 5px;"></td>
        <td><input type="text" name="txtOrderqty" size="10" placeholder="Order Qty" oninput="calculateAmount()" style="margin-bottom: 5px; margin-left: 5px; margin-top: 5px;"></td>
        <td><input type="text" name="txtAmount" size="10" placeholder="Amount" style="margin-bottom: 5px; margin-top: 5px; margin-left: 5px;"></td>
    </tr>
</table>
            <br>
            <br>
            <input type="submit" name="btnsubmit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" name="btnfind" value="Find" formaction="tap_ordertofc.jsp" id="findbtn" onclick="goFind()">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" name="btnreset" value="Reset">
        </form>
    </center>
    <script>
        function goFind()
		{
            window.location="tap_ordertofc.jsp";
        }
    </script>
</body>

</html>