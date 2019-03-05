<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wait.aspx.cs" Inherits="User_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>正在载入...</title>
    <style type="text/css">
    .middle{margin-top:200px;}
    
    </style>
</head>
<body >
<table border=0 cellpadding=0 cellspacing=0 width="100%" height="100%">
<tr> 
<form name="loading">
<div class="middle">
<td align="center"> 
<p><font color="gray">正在载入考试界面，请做好准备...</font></p>
<p> 
<input type="text" name="chart" size=46 style="font-family:Arial; 
font-weight:bolder; color:gray;
background-color:white; padding:0px; border-style:none;">
<br>
<input type="text" name=percent size=46 style="font-family:Arial; 
color:gray; text-align:center; 
border-width:medium; border-style:none;">

<script type="text/javascript">   
 var bar = 0
    var line = "||"
    var amount = "||"
    count()
    function count() {
        bar = bar + 2
        amount = amount + line
        document.loading.chart.value = amount
        document.loading.percent.value = bar + "%"
        if (bar < 99)
        { setTimeout("count()", 100); }
        else
        { window.location = "user_KS.aspx"; }
    }
</script>
</p>
</td>
</div>
</form>
</tr>
</table>
</body>
</html>
