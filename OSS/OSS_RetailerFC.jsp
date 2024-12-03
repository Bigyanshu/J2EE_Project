<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
	Connection conn;
	Statement stmtRCode,stmtData;
	ResultSet rsRCode,rsData;
	String RCode,RName[],CPerson[],Loc[],City[],State[],Phone[],Email[],GST[],Date[],Password[],Photo[];
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
			conn=DriverManager.getConnection("jdbc:mysql://Localhost:3307/ossdb","root","root1");
		}
		catch(SQLException se)
		{
			System.out.println("Unable to Connect with DataBase");
		}
	}
%>
<%
	RName=new String[20];
	CPerson=new String[20];
	Loc=new String[20];
	City=new String[20];
	State=new String[20];
	Phone=new String[20];
	Email=new String[20];
	GST=new String[20];
	Date=new String[20];
	Password=new String[20];
	Photo=new String[20];
	
	doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblretailer");
		i=0;
		while(rsData.next())
		{
			RName[i]=rsData.getString("RName");
			CPerson[i]=rsData.getString("CPerson");
			Loc[i]=rsData.getString("Loc");
			City[i]=rsData.getString("City");
			State[i]=rsData.getString("State");
			Phone[i]=rsData.getString("Phone");
			Email[i]=rsData.getString("Email");
			GST[i]=rsData.getString("GST");
			Date[i]=rsData.getString("Date");
			Password[i]=rsData.getString("Password");
			Photo[i]=rsData.getString("Photo");
			
			i=i+1;
		}
	}
	catch(SQLException se)
	{
		System.out.println("Unable to Fill Array"+se);
	}
%>

<html>
	<head>
		<title>OSS Retailer Find Client</title>
		<link rel="stylesheet" href="CSS_Universal.css">
		<script language="javascript">
		
			function passwordVisible() 
			{
				var x = document.getElementById("myInput");
				if (x.type ==="password") 
				{
					x.type = "text";
				} 
				else 
				{
					x.type = "password";
				}
			}
		    function goBack()
			{
				window.location="OSS_RetailerC.html";
			}
			function showImage()
			{
			   var path,photo;
			   path=document.f1.filePhoto.value;
			   photo=path.substring(path.lastIndexOf("\\")+1);
			   document.f1.imgPhoto.src=photo;
			}		

			function showData()
			{
				var jRName=new Array();
				var jCPerson=new Array();
				var jLoc=new Array();
				var jCity=new Array();
				var jState=new Array();
				var jPhone=new Array();
				var jEmail=new Array();
				var jGST=new Array();
				var jDate=new Array();
				var jPassword=new Array();
				var jPhoto=new Array();
				
				var j=0;
				var k=0;
				
				<%
					i=0;
					while(i< RName.length)
					{
				%>
						jRName[j]="<%=RName[i] %>";
						jCPerson[j]="<%=CPerson[i] %>";
						jLoc[j]="<%=Loc[i] %>";
						jCity[j]="<%=City[i] %>";
						jState[j]="<%=State[i] %>";
						jPhone[j]="<%=Phone[i] %>";
						jEmail[j]="<%=Email[i] %>";
						jGST[j]="<%=GST[i] %>";
						jDate[j]="<%=Date[i] %>";
						jPassword[j]="<%=Password[i] %>";
						jPhoto[j]="<%=Photo[i] %>";
						
						j=j+1;
				<%
						i=i+1;
					}
				%>
					k=document.f1.cmbRCode.selectedIndex;
					
					document.f1.txtRName.value=jRName[k-1];
					document.f1.txtCPerson.value=jCPerson[k-1];
					document.f1.txtLoc.value=jLoc[k-1];
					document.f1.txtCity.value=jCity[k-1];
					document.f1.cmbState.value=jState[k-1];
					document.f1.txtPhone.value=jPhone[k-1];
					document.f1.txtEmail.value=jEmail[k-1];
					document.f1.txtGST.value=jGST[k-1];
					document.f1.txtDate.value=jDate[k-1];
					document.f1.txtPswd.value=jPassword[k-1];
					document.f1.imgPhoto.src=jPhoto[k-1];
					document.f1.hdnPhoto.value=jPhoto[k-1];
			}
		</script
	</head>

	<body>
    <center>
        <form name="f1" action="OSS_RetailerFS.jsp" method="post">
		<nav>
			<h2>Retailer Information</h2>
		</nav>
            <table>
                <tr>
                    <td>Retailer Code </td>
                    <td>: <select name="cmbRCode" onchange="showData()" >
							<option value="">-Select Retailer Code-</option>
				<%
					doConnect();
					try
					{
						stmtRCode=conn.createStatement();
						rsRCode=stmtRCode.executeQuery("Select * from oss_tblretailer");
						while(rsRCode.next())
						{
							RCode=rsRCode.getString("RCode");
				%>
							<option value="<%=RCode %>"><%=RCode %></option>
				<%
						}
					}
					catch(SQLException se)
					{
						System.out.println("Unable to Create Combo");
					}
				%>
				</select><br>
				<tr>
                    <td>Retailer Name </td>
                    <td>: <input type="text" name="txtRName" placeholder="Enter Company Name"></td>
					
                    <td><img src="#" name="imgPhoto" alt="Preview" style="max-width: 120px; height: 100px;" border="1"></td>
					<td><input type="hidden" name="hdnPhoto">
                </tr>
                <tr>
                    <td>Contact Person </td>
                    <td>: <input type="text" name="txtCPerson" placeholder="Enter Head of Company" ></td>
                </tr>
                <tr>
                    <td>Locality </td>
                    <td> :  <input type="text" name="txtLoc"  placeholder="Enter Locality"></textarea></td>
                </tr>
                <tr>
                    <td>City/District </td>
                    <td>:   <input type="text" name="txtCity" placeholder="Enter City/District"></td>
                </tr>
                <tr>
                    <td>State/U.Territory </td>
                    <td>: <select name="cmbState">
                            <option value="--Select State--">--Select State--</option>
                            <option value="Andhra Pradesh">Andhra Pradesh</option>
                            <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                            <option value="Assam">Assam</option>
                            <option value="Bihar">Bihar</option>
                            <option value="Chhattisgarh">Chhattisgarh</option>
                            <option value="Goa">Goa</option>
                            <option value="Gujarat">Gujarat</option>
                            <option value="Haryana">Haryana</option>
                            <option value="Himachal Pradesh">Himachal Pradesh</option>
                            <option value="Jharkhand">Jharkhand</option>
                            <option value="Karnataka">Karnataka</option>
                            <option value="Kerala">Kerala</option>
                            <option value="Madhya Pradesh">Madhya Pradesh</option>
                            <option value="Maharashtra">Maharashtra</option>
                            <option value="Manipur">Manipur</option>
                            <option value="Meghalaya">Meghalaya</option>
                            <option value="Mizoram">Mizoram</option>
                            <option value="Nagaland">Nagaland</option>
                            <option value="Odisha">Odisha</option>
                            <option value="Punjab">Punjab</option>
                            <option value="Rajasthan">Rajasthan</option>
                            <option value="Sikkim">Sikkim</option>
                            <option value="Tamil Nadu">Tamil Nadu</option>
                            <option value="Telangana">Telangana</option>
                            <option value="Tripura">Tripura</option>
                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                            <option value="Uttarakhand">Uttarakhand</option>
                            <option value="West Bengal">West Bengal</option>
                            <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                            <option value="Chandigarh">Chandigarh</option>
                            <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and
                                Daman and
                                Diu</option>
                            <option value="Lakshadweep">Lakshadweep</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Puducherry">Puducherry</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Phone No </td>
                    <td>: <input type="text" name="txtPhone" placeholder="Phone Number"></td>
                    <td nowrap>Email ID </td>
                    <td nowrap>:<input type="email" name="txtEmail" placeholder="Enter Email"></td>
                </tr>
                <tr>
                    <td>GST No </td>
                    <td>: <input type="text" name="txtGST" placeholder="GST No."></td>
                    <td>Date </td>
                    <td>: <input type="date" name="txtDate"></td>
                </tr>
				<tr>
                    <td>Password </td>
					<td>:<input type="password" style="border-radius:7px;" name="txtPswd" id="myInput" placeholder="Enter Password"></td>

					<td>Photo </td>
                    <td>: <input type="file" name="filePhoto" onchange="showImage()"></td>
                </tr>
				<tr>
					<td></td>
					<!-- An element to toggle between password visibility -->
					<td ><input type="checkbox" onclick="passwordVisible()">Show Password</td>
				</tr>
            </table>  <br>
			<input type="submit" name="btnUpdate" value="Update" >
			<input type="submit" name="btnDelete" value="Delete" >
			<input type="button" name="btnBack" value="Back" onclick="goBack()">
        </form>
    </center>
</body>
</html>