<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>疾病主表一般信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--

function UpdateRecord()
{
	if(confirm("确定要更新记录么?"))
		return true;
	else
		return false;
}

var standard;
function showStandard(strTable,strPos,txtTarget)
{
	var left;
	
	if (strPos=="left")
		left=screen.width-280;
	else
		left=0;

	document.forms(0).pastefield.value=txtTarget;

	if (standard=='[object]')
		standard.close();
			
	standard=window.open("/starch/wizard.asp?table="+strTable,"standard","width=310,height=500,left="+left+",top=25,toolbar=no,scrollbars=yes");
	
	if ((document.forms(0).window!=null) && (!standard.opener))
		standard.opener=document.forms(0).window;
		
	standard.focus();
}
//-->
</script>
</head>

<body class="body">
<%
	dim ID
	ID=request("JBID")
	dim strSQL
	strSQL="select * from C_JiB where ID="&ID
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>

<form name="formCont" action="updateMainInfo.asp?JBID=<%=ID%>&BJZT=<%=request("BJZT")%>" method="post">
<INPUT type="hidden" name="pastefield">
<table width="800" height="175" border="0" align="center" class="table2">
      <tr> 
        <td height="18" colspan="4" class="title1">疾病基本信息</td>
        <input name="WorkStep" type="hidden">
      </tr>
      <tr> 
        <td height="5" colspan="4" id="isMain">
		<table width="100%" height="149" border="0" class="table3">
      		<tr> 
        		<td width="140" height="31"> <div align="right">疾病名称：</div></td>
        		<td width="260"><textarea name="txtJBMC" cols="30" rows="3" readonly><%=oraRS.fields("JBMC")%></textarea></td>
        		<td><div align="right">异名：</div></td>
        		<td width="246"><div align="left"> 
            	<textarea name="txtYM" cols="30" rows="3"><%=oraRS.fields("YM")%></textarea>
          		</div></td>
      		</tr>
      		<tr>
              <td height="40"><div align="right">原发病：</div></td>
              <td><textarea name="txtYFB" cols="20" rows="3"><%=oraRS.fields("YFB")%></textarea>
                  <input name="button2222" type="button" class="button1" onClick="showStandard('JiBing','Right','txtYFB','<%=JLNUM%>');" value="辅助选词"></td>
              <td><div align="right">并发症：</div></td>
              <td><textarea name="txtBFZ" cols="20" rows="3"><%=oraRS.fields("BFZ")%></textarea>
                  <input name="button22222" type="button" class="button1" onClick="showStandard('JiBing','Right','txtBFZ','<%=JLNUM%>');" value="辅助选词"></td>
   		  </tr>
      		<tr>
              <td height="40"><div align="right">发病方式：</div></td>
              <td><textarea name="txtFBFS" cols="20" rows="3"><%=oraRS.fields("FBFS")%></textarea>
                  <input name="button2222" type="button" class="button1" onClick="showStandard('JiBing','Right','txtYFB','<%=JLNUM%>');" value="辅助选词"></td>
              <td>
                <div align="right">症状信息：</div></td>
              <td><textarea name="txtZZMC" cols="20" rows="3"><%=oraRS.fields("ZZMC")%></textarea>
                  <input name="button4" type="button" class="button1" onClick="showStandard('ZhengZhuang','Right','txtZZMC','<%=JLNUM%>');" value="辅助选词"></td>
   		  </tr>
      	<tr> 
        	<td height="20" ><div align="right">备注：</div></td>
        	<td height="20" colspan="3" ><textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea></td>
      	</tr>
		</table>
		</td>
      </tr>
	  <tr>
	    <td height="23"><div align="center">
	      <input type="submit" name="Submit" value="更新疾病主表信息" onClick="return UpdateRecord()">
	    </div></td>
    </tr>
</table>
</form>
<center>
<a href="javascript:history.go(-1)">返回</a>
</center>
</body>
</html>
