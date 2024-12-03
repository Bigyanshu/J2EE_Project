<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
	Connection conn;
	Statement stmtRegd,stmtData;
	ResultSet rsRegd,rsData;
	String Regd,Cname[],HOC[],LOC[],City[],State[],Ph_No[],Email[],GST_No[],Date[];
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
	Cname=new String[20];
	HOC=new String[20];
	LOC=new String[20];
	City=new String[20];
	State=new String[20];
	Ph_No=new String[20];
	Email=new String[20];
	GST_No=new String[20];
	Date=new String[20];
	
	doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblcompany");
		i=0;
		while(rsData.next())
		{
			Cname[i]=rsData.getString("CName");
			HOC[i]=rsData.getString("HOC");
			LOC[i]=rsData.getString("Loc");
			City[i]=rsData.getString("City");
			State[i]=rsData.getString("State");
			Ph_No[i]=rsData.getString("Phone");
			Email[i]=rsData.getString("Email");
			GST_No[i]=rsData.getString("GST");
			Date[i]=rsData.getString("Date");
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
		<title>OSS Company Information</title>
		<link rel="stylesheet" href="CSS_Universal.css">
		
		<script language="javascript">
		    function goBack()
			{
				window.location="OSS_CompanyC.html";
			}
			function showData()
			{
				var jCname=new Array();
				var jHOC=new Array();
				var jLOC=new Array();
				var jCity=new Array();
				var jState=new Array();
				var jPh_No=new Array();
				var jEmail=new Array();
				var jGST_No=new Array();
				var jDate=new Array();
				var j=0;
				var k=0;
				
				<%
					i=0;
					while(i< Cname.length)
					{
				%>
						jCname[j]="<%=Cname[i] %>";
						jHOC[j]="<%=HOC[i] %>";
						jLOC[j]="<%=LOC[i] %>";
						jCity[j]="<%=City[i] %>";
						jState[j]="<%=State[i] %>";
						jPh_No[j]="<%=Ph_No[i] %>";
						jEmail[j]="<%=Email[i] %>";
						jGST_No[j]="<%=GST_No[i] %>";
						jDate[j]="<%=Date[i] %>";
						
						j=j+1;
				<%
						i=i+1;
					}
				%>
					k=document.f1.cmbRegd.selectedIndex;
					
					document.f1.txtCName.value=jCname[k-1];
					document.f1.txtHOC.value=jHOC[k-1];
					document.f1.txtLoc.value=jLOC[k-1];
					document.f1.txtCity.value=jCity[k-1];
					document.f1.cmbState.value=jState[k-1];
					document.f1.txtPhone.value=jPh_No[k-1];
					document.f1.txtEmail.value=jEmail[k-1];
					document.f1.txtGST.value=jGST_No[k-1];
					document.f1.txtDate.value=jDate[k-1];
			}
		</script
	</head>

	<body>
    <center>
        <form name="f1" action="OSS_CompanyFS.jsp" method="post">
		<nav>
			<h2>Company Information</h2>
		</nav>
            <table>
                <tr>
                    <td>Registration Number </td>
                    <td>: <select name="cmbRegd" onchange="showData()" >
					   <option value="">-Select-</option>
				<%
					doConnect();
					try
					{
						stmtRegd=conn.createStatement();
						rsRegd=stmtRegd.executeQuery("Select * from oss_tblcompany");
						while(rsRegd.next())
						{
							Regd=rsRegd.getString("Regd");
				%>
							<option value="<%=Regd %>"><%=Regd %></option>
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
                    <td>Company Name </td>
                    <td>: <input type="text" name="txtCName" placeholder="Enter Company Name"></td>
                </tr>
                <tr>
                    <td>Head Of Company </td>
                    <td>: <input type="text" name="txtHOC" placeholder="Enter Head of Company" ></td>
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
                            <option value="--Select--">--Select--</option>
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
                    <td>Email ID </td>
                    <td>: <input type="email" name="txtEmail" placeholder="Enter Email"></td>
                </tr>
                <tr>
                    <td>GST No </td>
                    <td>: <input type="text" name="txtGST" placeholder="GST No."></td>
                    <td>Date </td>
                    <td>: <input type="date" name="txtDate"></td>
                </tr>
            </table>  <br>
			<input type="submit" name="btnUpdate" value="Update" foromaction="OSS_CompanyFC.JSP">
			<input type="submit" name="btnDelete" value="Delete" foromaction="OSS_CompanyFC.JSP">
			<input type="button" name="btnBack" value="Back" onclick="goBack()">
        </form>
    </center>
</body>
</html>