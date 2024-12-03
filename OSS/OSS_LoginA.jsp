<html>
	<head>
		<title> Login Page </title>
		<link rel="stylesheet" href="CSS_Universal.css">

		<script language="javascript">
			function goBack()
			{
			   window.location="OSS_NewUser.html";
			}
			function goUser()
			{
				window.location="OSS_Menu.html";
			}
			function goForget()
			{
				window.location="OSS_ForgetPwdC.html";
			}
			function Activate()
			{
				document.getElementById("idLogin").disabled=false;
			}
		</script>
	</head>
	<body bgcolor="grey">
	<tr>
		<form name="f1" action="OSS_Login.html" method="post">
		<br><br><br><br><br><br><br><br><br><br><br><br>
		<p align="center">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="red" size="6">One Stop Shop</font>
		</p>
		<table width="700" align="center">
			<tr>
				<td><img src="lock2.jpg" height="250" width="300" style="cursor:pointer" usemap="#click">
					<map name="click">
						<area shape="rect" coords="50 50 200 270" onclick="Activate()"  target="_self">
					</map>
				</td>

				<td>
					<table width="300" align="center">
						<tr>
							<td><font color="black" size="4"> User Name</td>
							<td>: <input type="text" id="idUser" name="txtUName" size="12" required autocomplete="off"><font color="red">*</td><br><br><br><br>
						</tr>
						<tr></tr>
						<tr></tr>
						<tr>
							<td><font color="black" size="4">Password</td>
							<td>: <input type="password" id="idPass" name="txtPwd" size="12" required autocomplete="off"><font color="red">*</td>
						</tr>
					</table><br><br>
				
					<center>
						<input type="submit" name="btnLogin" value="Login" id="idLogin" disabled style="height:27px;background-color:navy;color:white;border-radius:4px;border-color:white;cursor:pointer; " title="Find Hot Spot To Enable Login" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<input type="reset" name="btnRes" value="Reset" Style="height:27px;background-color:navy;color:white;border-radius:4px;border-color:white">
						<br><br>
						
						<input type="button" name="btnForget" value="Forget Password" Style="height:27px;background-color:navy;color:white;border-radius:4px;border-color:white" onclick="goForget()">

						<input type="button" name="btnBack" value="Back" Style="height:27px;background-color:navy;color:white;border-radius:4px;border-color:white" onclick="goBack()">
					</center>
				</td>
			</tr>
		</table>

		<br><br><br><br><br><br><br><br>
		
		<table width="100%" height="20">
			<tr></tr>
			<tr bgcolor="#151B54">
				<td><font color="yellow" size="4"><i><marquee behavior="alternate">Designed & Developed By : </font><font color="red"><b> Bigyanshu Sekhar Panda</b></font></marquee></i></font></td>
			</tr>
		</table>
		</form>
	</body>
</html>