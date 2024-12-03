<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
	Connection conn;
	Statement stmtPCcode,stmtData;
	ResultSet rsPCcode,rsData;
	String PCCode,PCName[];
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
			System.out.println("Connected To The DataBase Successfully");
		}
		catch(SQLException se)
		{
			System.out.println("Unable to Connect with DataBase");
		}
	}
%>
<%
	PCName=new String[20];
	
	doConnect();
	try
	{
		stmtData=conn.createStatement();
		rsData=stmtData.executeQuery("Select * from oss_tblproductcatg");
		i=0;
		while(rsData.next())
		{
			PCName[i]=rsData.getString("PCName");
			
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
		<title>OSS Product Find</title>
		<link rel="stylesheet" href="CSS_Universal.css">
		<script language="javascript">
			 function goBack()
			{
				window.location="OSS_ProductC.html";
			}
			function showData()
			{
				var jPCName=new Array();
				var j=0;
				var k=0;
				
				<%
					i=0;
					while(i< PCName.length)
					{
				%>
						jPCName[j]="<%=PCName[i] %>";
						
						j=j+1;
				<%
						i=i+1;
					}
				%>
					k=document.f1.cmbPCCode.selectedIndex;
					document.f1.txtPCName.value=jPCName[k-1];
			}
		</script
	</head>

	<body>
    <center>
        <form name="f1" action="OSS_ProductFS.jsp" method="post">
		<nav>
			<h2>Product Category Information</h2>
		</nav>
            <table>
                <tr>
                    <td>Product Category Code </td>
                    <td>: <select name="cmbPCCode" onchange="showData()" >
					   <option value="">-Select-</option>
				<%
					doConnect();
					try
					{
						stmtPCcode=conn.createStatement();
						rsPCcode=stmtPCcode.executeQuery("Select * from oss_tblproductcatg");
						while(rsPCcode.next())
						{
							PCCode=rsPCcode.getString("PCCode");
				%>
							<option value="<%=PCCode %>"><%=PCCode %></option>
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
                    <td>Product Category Name </td>
                    <td>: <input type="text" name="txtPCName" placeholder="Enter Product Category Name"></td>
                </tr>
            </table>  <br>
			<input type="submit" name="btnUpdate" value="Update" >
			<input type="submit" name="btnDelete" value="Delete" >
			<input type="button" name="btnBack" value="Back" onclick="goBack()">
        </form>
    </center>
</body>
</html>