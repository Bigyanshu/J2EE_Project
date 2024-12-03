<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%! 
    Connection conn;
    Statement stmtCName,stmtCRCode,stmtPCName,stmtPCode, stmtData;
    ResultSet rsCName,rsCRCode,rsPCName,rsPCCode, rsData;
    String PCode,CName1,PCName1, CName[], CRCode[], PCName[], PCCode[], PName[], Unit[], CPrice[], SPrice[], TSlab[], Stock[], Photo[];
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
    try 
	{
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
	catch (SQLException se) 
	{
		System.out.println("Unable to fill array");
	}
%>
<%
    CName = new String[20];
    CRCode = new String[20];
    PCName = new String[20];
    PCCode = new String[20];
    PName = new String[20];
    Unit = new String[20];
    CPrice = new String[20];
    SPrice = new String[20];
    TSlab = new String[20];
    Stock = new String[20];
    Photo = new String[20];

    doConnect();
    try {
        stmtData = conn.createStatement();
        rsData = stmtData.executeQuery("SELECT * FROM oss_tblproductinfo");
        i = 0;
        while (rsData.next()) 
		{
            CName[i] = rsData.getString("CName");
            CRCode[i] = rsData.getString("CRCode");
            PCName[i] = rsData.getString("PCName");
            PCCode[i] = rsData.getString("PCCode");
            PName[i] = rsData.getString("PName");
            Unit[i] = rsData.getString("Unit");
            CPrice[i] = rsData.getString("CPrice");
            SPrice[i] = rsData.getString("SPrice");
            TSlab[i] = rsData.getString("TSlab");
            Stock[i] = rsData.getString("Stock");
            Photo[i] = rsData.getString("Photo");
            i = i + 1;
        }
    } 
	catch (SQLException se) 
	{
        System.out.println("Unable to fill array");
    }
%>

<html>
	<head>
		<title>OSS Find Client</title>
		<link rel="stylesheet" href="CSS_Universal.css">
		<script>
			function setCRCode() 
			{
				var jCRCode = new Array();
				var j = 0, k = 0;
			<% 
					i = 0;
					while (i < CRCode.length) 
					{
			%>
						jCRCode[j] = "<%=CRCode[i]%>";
						j = j + 1;
				<%
						i = i + 1;
					}
				%>
					k = document.f1.cmbCName.selectedIndex;
					document.f1.txtCRCode.value = jCRCode[k-1];
			}
			function setPCCode() 
			{
				var jPCCode = new Array();
				var j = 0, k = 0;
			<% 
				i = 0;
				while (i < PCCode.length) 
				{
			%>
					jPCCode[j] = "<%=PCCode[i]%>";
					j = j + 1;
			<%
					i = i + 1;
				}
			%>
				k = document.f1.cmbPCName.selectedIndex;
				document.f1.txtPCCode.value = jPCCode[k-1];
			}
			function showData() 
			{
				var jCName = new Array();
				var jCRCode = new Array();
				var jPCName = new Array();
				var jPCCode = new Array();
				var jPName = new Array();
				var jUnit = new Array();
				var jCPrice = new Array();
				var jSPrice = new Array();
				var jTSlab = new Array();
				var jStock = new Array();
				var jPhoto = new Array();
				var j = 0, k =0;
			<% 
				int i = 0;
				while (i < CName.length) 
				{
            %>
                    jCName[j] = "<%=CName[i]%>";
                    jCRCode[j] = "<%=CRCode[i]%>";
                    jPCName[j] = "<%=PCName[i]%>";
                    jPCCode[j] = "<%=PCCode[i]%>";
                    jPName[j] = "<%=PName[i]%>";
                    jUnit[j] = "<%=Unit[i]%>";
                    jCPrice[j] = "<%=CPrice[i]%>";
                    jSPrice[j] = "<%=SPrice[i]%>";
                    jTSlab[j] = "<%=TSlab[i]%>";
                    jStock[j] = "<%=Stock[i]%>";
                    jPhoto[j] = "<%=Photo[i]%>";

                    j = j + 1;
            <%
                    i = i + 1;
                }
            %>
				k = document.f1.cmbPCode.selectedIndex;

				document.f1.cmbCName.value = jCName[k - 1];
				document.f1.txtCRCode.value = jCRCode[k - 1];
				document.f1.cmbPCName.value = jPCName[k - 1];
				document.f1.txtPCCode.value = jPCCode[k - 1];
				document.f1.txtPName.value = jPName[k - 1];
				document.f1.txtUnit.value = jUnit[k - 1];
				document.f1.txtCPrice.value = jCPrice[k - 1];
				document.f1.txtSPrice.value = jSPrice[k - 1];
				document.f1.cmbTSlab.value = jTSlab[k - 1];
				document.f1.txtStock.value = jStock[k - 1];
				document.f1.imgPhoto.src = jPhoto[k - 1];
				document.f1.hdnPhoto.value = jPhoto[k - 1];
			}
			function showImage()
			{
			   var path,photo;
			   path=document.f1.filephoto.value;
			   photo=path.substring(path.lastIndexOf("\\")+1);
			   document.f1.imgPhoto.src=photo;
			}
		</script>
</head>

<body>
    <center>
        <form name="f1" action="OSS_ProductInfoFS.jsp" method="post">
            <nav>
                <h2>Product Information</h2>
            </nav>
            <table>
                <tr>
                    <td>Product Code</td>
                    <td>:
                        <select name="cmbPCode" onchange="showData()">
                            <option value="">-Select Product Code-</option>
                          <%
								doConnect();
                                try
								{
                                    stmtPCode = conn.createStatement();
                                    rsPCCode = stmtPCode.executeQuery("SELECT * FROM oss_tblproductinfo");
                                    while (rsPCCode.next()) 
									{
                                        PCode = rsPCCode.getString("PCode");
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
                    </tr>
					<tr>
                    <td>Company Name</td>
                    <td>: 
                        <select name="cmbCName" onchange="setCRCode()">
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
                                    System.out.println("Unable to create combo");
                                }
                            %>
                        </select>
                    </td>

                    <td>Company Regd Code</td>
                    <td>: <input type="text" name="txtCRCode" size="30" placeholder="Enter Company Regd Code" ></td>
                </tr>
                <tr>
                    <td>Product Catagory Name</td>
                    <td>:
                        <select name="cmbPCName" onchange="setPCCode()">
                            <option value="">-Select Product Cat Name-</option>
                            <%
                                doConnect();
                                try 
								{
                                    stmtPCName = conn.createStatement();
                                    rsPCName = stmtPCName.executeQuery("SELECT * FROM oss_tblproductcatg");
                                    while (rsPCName.next()) 
									{
                                        PCName1 = rsPCName.getString("PCName");
                            %>
                                        <option value="<%= PCName1 %>"><%= PCName1 %></option>
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

                    <td>Product Catagory Code</td>
                    <td>: <input type="text" name="txtPCCode" size="30" placeholder="Enter Product Category Code" ></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td id="image" rowspan="3" colspan="2">
					<img name="imgPhoto" placeholder="Photo of the Item" src="#" alt="Preview" style="max-width: 125px; height: 105px;" border="1">
					<input type="hidden" name="hdnPhoto">
					</td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td>: <input type="text" name="txtPName" size="30" placeholder="Enter Product Name"></td>
                </tr>
                <tr>
                    <td>Unit</td>
                    <td>: <input type="text" name="txtUnit" placeholder="Enter Unit" size="30"></td>
                </tr>
                <tr>
                    <td>Cost Price</td>
                    <td>: <input type="text" name="txtCPrice" size="30" placeholder="Enter Cost Price"></td>
                    <td>Sell Price</td>
                    <td>: <input type="text" name="txtSPrice" placeholder="Enter Sell Price"></td>
                </tr>
                <tr>
                    <td>TSlab Slab</td>
                    <td>: 
                        <select name="cmbTSlab">
                            <option value="--Enter Tax Slab--">--Enter Tax Slab--</option>
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
						<input type="file" name="filephoto" onchange="showImage()" border="1"></td>
                </tr>
            </table>  <br>
            <input type="submit" name="btnUpdate" value="Update" id="updatebtn">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="btnDelete" value="Delete" id="deletebtn">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="btnBack" value="Back" formaction="OSS_ProductInfoC.jsp">
        </form>
    </center>
    <script>
	    InpImg.onchange=evt=>
	    {
			const[file]=InpImg.files
		   
			if (file) 
			{
				imgPhoto.src=URL.createObjectURL(file)
			}
        }
        function goFind()
		{
            window.location = "OSS_ProductInfoFC.jsp";
        }
    </script>
</body>
</html>