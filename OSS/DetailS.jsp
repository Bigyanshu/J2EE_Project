<html>

<head>
    <title>Menu Page</title>
    <script language="javascript">
        function Hilight(id) {
            cid = document.getElementById(id);
            cid.style.backgroundColor = "red";
        }
        function Normal(id) {
            cid = document.getElementById(id);
            cid.style.backgroundColor = "#151B54";
        }
    </script>
</head>

<body>
    <table width="200">
        <tr height="26" style="border-radius:7px">
            <td width="180" nowrap="nowrap" id="id1" bgcolor="#151B54" onmouseover="Hilight('id1')"
                onmouseout="Normal('id1')" style="border-radius:5px">
                <a href="tap_itemReportvendorc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Item Information[Vendor]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id2" bgcolor="#151B54" onmouseover="Hilight('id2')"
                onmouseout="Normal('id2')" style="border-radius:5px">
                <a href="tap_itemReportproductc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Item Information[Product]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id3" bgcolor="#151B54" onmouseover="Hilight('id3')"
                onmouseout="Normal('id3')" style="border-radius:5px">
                <a href="tap_itemReportitemcatgc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Item Information[Itemcatg]</font>
                </a>
            </td>
        </tr>
       
        <tr height="26" style="border-radius:7px">
            <td width="180" nowrap="nowrap" id="id4" bgcolor="#151B54" onmouseover="Hilight('id4')"
                onmouseout="Normal('id4')" style="border-radius:5px">
                <a href="tap_ordertoReprtvnamec.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Order to vendor[Vname]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id5" bgcolor="#151B54" onmouseover="Hilight('id5')"
                onmouseout="Normal('id5')" style="border-radius:5px">
                <a href="tap_ordertoReprtVproductc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Order to vendor[Product]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id6" bgcolor="#151B54" onmouseover="Hilight('id6')"
                onmouseout="Normal('id6')" style="border-radius:5px">
                <a href="tap_ordertoReprtRnamec.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Order to Retailer[Rname]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id7" bgcolor="#151B54" onmouseover="Hilight('id7')"
                onmouseout="Normal('id7')" style="border-radius:5px">
                <a href="tap_ordertoReprtRitemcatgc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Order to Retailer[Itemcatg]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id8" bgcolor="#151B54" onmouseover="Hilight('id8')"
                onmouseout="Normal('id8')" style="border-radius:5px">
                <a href="tap_ordertoReprtRproductc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Order to Retailer[Product]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id9" bgcolor="#151B54" onmouseover="Hilight('id9')"
                onmouseout="Normal('id9')" style="border-radius:5px">
                <a href="tap_recofgoodReptInvCc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Recipt of goods [Invc Date]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id10" bgcolor="#151B54" onmouseover="Hilight('id10')"
                onmouseout="Normal('id10')" style="border-radius:5px">
                <a href="tap_recofgoodReptVendorc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Recipt of goods [vendor]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id11" bgcolor="#151B54" onmouseover="Hilight('id11')"
                onmouseout="Normal('id11')" style="border-radius:5px">
                <a href="tap_recofgoodReptitemcatgc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Recipt of goods [Itemcatg]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id12" bgcolor="#151B54" onmouseover="Hilight('id12')"
                onmouseout="Normal('id12')" style="border-radius:5px">
                <a href="tap_recofgoodReptProductc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Recipt of goods [Product`]</font>
                </a>
            </td>
        </tr>
       
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id13" bgcolor="#151B54" onmouseover="Hilight('id13')"
                onmouseout="Normal('id13')" style="border-radius:5px">
                <a href="tap_issueofgoodReptInvCc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue of goods[Inc Date]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id3" bgcolor="#151B54" onmouseover="Hilight('id3')"
                onmouseout="Normal('id3')" style="border-radius:5px">
                <a href="tap_issueofgoodReptInvCNoc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue of goods [Invc No]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id14" bgcolor="#151B54" onmouseover="Hilight('id14')"
                onmouseout="Normal('id14')" style="border-radius:5px">
                <a href="tap_issueofgoodReptRetailerc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue of Goods[Retailer name]</font>
                </a>
            </td>
        </tr>

        <tr height="26">
            <td width="180" nowrap="nowrap" id="id15" bgcolor="#151B54" onmouseover="Hilight('id15')"
                onmouseout="Normal('id15')" style="border-radius:5px">
                <a href="tap_issueofgoodReptitemcatgc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue of goods [Item catg]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id16" bgcolor="#151B54" onmouseover="Hilight('id16')"
                onmouseout="Normal('id16')" style="border-radius:5px">
                <a href="tap_issueofgoodReptProductc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue of goods [Product]</font>
                </a>
            </td>
        </tr>
       
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id17" bgcolor="#151B54" onmouseover="Hilight('id17')"
                onmouseout="Normal('id17')" style="border-radius:5px">
                <a href="tap_issueofcustReptInvCc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue to customer[Invc date]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id3" bgcolor="#151B54" onmouseover="Hilight('id3')"
                onmouseout="Normal('id3')" style="border-radius:5px">
                <a href="tap_isuueofCustInvoiceGenC.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue to customer[Inc No]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id18" bgcolor="#151B54" onmouseover="Hilight('id18')"
                onmouseout="Normal('id18')" style="border-radius:5px">
                <a href="tap_issueofcustReptitemcatgc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue to customer[Itemcatg]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id19" bgcolor="#151B54" onmouseover="Hilight('id19')"
                onmouseout="Normal('id19')" style="border-radius:5px">
                <a href="tap_issueofcustReptProductc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Issue to customer[Product]</font>
                </a>
            </td>
        </tr>
       
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id20" bgcolor="#151B54" onmouseover="Hilight('id20')"
                onmouseout="Normal('id20')" style="border-radius:5px">
                <a href="tap_pmtvouReportDatec.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Payment voucher[Date]</font>
                </a>
            </td>
        </tr>

        <tr height="26">
            <td width="180" nowrap="nowrap" id="id21" bgcolor="#151B54" onmouseover="Hilight('id21')"
                onmouseout="Normal('id21')" style="border-radius:5px">
                <a href="tap_pmtvouReportVendorc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Payment voucher[Vendor]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id22" bgcolor="#151B54" onmouseover="Hilight('id22')"
                onmouseout="Normal('id22')" style="border-radius:5px">
                <a href="tap_recvouccustRptcustdatec.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Recipt voucher customer[Date]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id23" bgcolor="#151B54" onmouseover="Hilight('id23')"
                onmouseout="Normal('id23')" style="border-radius:5px">
                <a href="tap_recvouccustRptcustphc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Recipt voucher customer[Ph no]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id3" bgcolor="#151B54" onmouseover="Hilight('id3')"
                onmouseout="Normal('id3')" style="border-radius:5px">
                <a href="tap_recvoucReportRetailerc.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Recipt voucher Retailer[Retailer]</font>
                </a>
            </td>
        </tr>
        <tr height="26">
            <td width="180" nowrap="nowrap" id="id24" bgcolor="#151B54" onmouseover="Hilight('id24')"
                onmouseout="Normal('id24')" style="border-radius:5px">
                <a href="tap_recvoucReteRptdatec.jsp" target="_blank" style="text-decoration:none">
                    <font face="Lucida Console" color="yellow" size="2">Recipt voucher Retailer[Date]</font>
                </a>
            </td>
        </tr>

       
    </table>
</body>

</html>