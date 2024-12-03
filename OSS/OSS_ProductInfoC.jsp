<%@ page language="java" contentType="text/html" import="java.sql.* " %>

<%! 
    Connection conn;
    Statement stmtCName,stmtPName, stmtData;
    ResultSet rsCName,rsPName, rsData;
    String CName,PName;
    String CRCode[],PCCode[];
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
    CRCode=new String[20];

    doConnect();
    try {
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblcompany");
        i = 0;
        while (rsData.next()) 
		{
            CRCode[i] = rsData.getString("Regd");
            i = i + 1;
        }
    }   
	catch (SQLException se) 
	{
		System.out.println("Unable to fill array");
	}
%>
<%
    PCCode=new String[20];
   
    doConnect();
    try 
	{
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblproductcatg");
        i = 0;
        while (rsData.next()) 
		{
            PCCode[i] = rsData.getString("PCCode");
            i = i + 1;
        }
    }   
	catch(SQLException se) 
    {
        System.out.println("Unable to fill array");
    }
%>

<html>
<head>
    <title>Oss Product Information</title>
    <link rel="stylesheet" href="CSS_Universal.css">
	<script language="javascript">
	function goFind()
	{
        window.location = "OSS_ProductInfoFC.jsp";
    }
	function setCRCode()
	{
		var jCRCode=new Array();
				var j = 0,k=0;
	<% 
		i = 0;
		while (i < CRCode.length) 
		{
	%>
			jCRCode[j] ="<%=CRCode[i]%>";
			j = j + 1;
	<%
			i = i + 1;
		}
    %>
        k = document.f1.cmbCName.selectedIndex;
        document.f1.txtCRCode.value = jCRCode[k - 1];
    }
	function setPCCode()
	{
			var jPCCode=new Array();
			        var j = 0;
					var k=0;;
        <% 
            i = 0;
            while (i < PCCode.length) 
            {
        %>
                jPCCode[j] ="<%=PCCode[i]%>";
                j = j + 1;
        <%
                i = i + 1;
            }
        %>

			k = document.f1.cmbPCName.selectedIndex;
			document.f1.txtPCCode.value = jPCCode[k - 1];
    }
	function showImage()
	{
       var path,photo;
	   path=document.f1.filephoto.value;
	   photo=path.substring(path.lastIndexOf("\\")+1);
	   document.f1.imgProduct.src=photo;
	}
	</script>
</head>

<body>
    <center>
        <form action="OSS_ProductInfoS.jsp" name="f1" method="post">
            <nav>
                <h2>Product Information</h2>
            </nav>
            <table>
                <tr>
                    <td>Company Name</td>
                    <td>:
                        <select name="cmbCName" onchange="setCRCode()">
                            <option value="">-Select Company Name-</option>
                            <%
                                doConnect();
                                try {
                                    stmtCName = conn.createStatement();
                                    rsCName = stmtCName.executeQuery("SELECT * FROM oss_tblcompany");
                                    while (rsCName.next()) 
									{
                                        CName = rsCName.getString("CName");
                            %>
                                        <option value="<%= CName %>"><%= CName %></option>
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

                    <td>Comp Regd Code</td>
                    <td>: <input type="text" name="txtCRCode" size="30" placeholder="Enter Company Regd No" ></td>
                </tr>
                <tr>
                    <td>Product Catagory Name</td>
                    <td>: 
                        <select name="cmbPCName" onchange="setPCCode()">
                            <option value="">-Select Product Category Name-</option>
                            <%
                                doConnect();
                                try {
                                    stmtPName = conn.createStatement();
                                    rsPName = stmtPName.executeQuery("SELECT * FROM oss_tblproductcatg");
                                    while (rsPName.next()) 
									{
                                        PName = rsPName.getString("PCName");
                            %>
                                        <option value="<%= PName %>"><%= PName %></option>
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
                    <td>Product Catagory Code</td>
                    <td>: <input type="text" name="txtPCCode" size="30" placeholder="Enter Product Cat Code" ></td>
                </tr>
                <tr>
                    <td>Product Code </td>
                    <td>: <input type="text" name="txtPCode" placeholder="Enter Product Code"></td>
					<td></td>
                    <td colspan1="2" rowspan="3"> 
					<img src="" name="imgProduct" style="max-width:120px; height:105px" border="1">
					</td>
                </tr>
				<tr>
                    <td>Product Name </td>
                    <td>: <input type="text" name="txtPName" placeholder="Enter Product Name"></td>
                </tr>
				<tr>
					<td>Unit</td>
					<td>: <input type="text" name="txtUnit" placeholder="Enter Units"></td>
				</tr>
				<tr>
					<td>Cost Price</td>
					<td>: <input type="text" name="txtCPrice" placeholder="Enter Cost Price"></td>
					<td>Sell Price</td>
					<td>: <input type="text" name="txtSPrice" placeholder="Enter Sell Price"></td>
				</tr>
                <tr>
                    <td>Tax Slab</td>
                    <td>
                        : <select name="cmbTSlab" >
                            <option value="--Select Tax Slabs--">--Select Tax Slabs--</option>
                            <option value="8.0">8.0</option>
                            <option value="12.0">12.0</option>
                            <option value="18.0">18.0</option>
                            <option value="28.0">28.0</option>
                        </select>
                    </td>
                    <td>Stock </td>
                    <td>: <input type="text" name="txtStock" size="10" placeholder="Enter Stocks"></td>
				</tr>
				<tr>
                    <td>Photo </td>
                    <td>: 
						<input type="file" name="filephoto" onchange="showImage()">
						
						</td>
                </tr>
            </table>
            <br>
            <input type="submit" name="btnSubmit" value="Submit" >&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" name="btnFind" value="Find" onclick="goFind()">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" name="btnReset" value="Reset">
        </form>
    </center>
</body>
</html>