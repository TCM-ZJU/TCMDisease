<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>��������һ����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--

function UpdateRecord()
{
	if(confirm("ȷ��Ҫ���¼�¼ô?"))
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
        <td height="18" colspan="4" class="title1">����������Ϣ</td>
        <input name="WorkStep" type="hidden">
      </tr>
      <tr> 
        <td height="5" colspan="4" id="isMain">
		<table width="100%" height="149" border="0" class="table3">
      		<tr> 
        		<td width="140" height="31"> <div align="right">�������ƣ�</div></td>
        		<td width="260"><textarea name="txtJBMC" cols="30" rows="3" readonly><%=oraRS.fields("JBMC")%></textarea></td>
        		<td><div align="right">������</div></td>
        		<td width="246"><div align="left"> 
            	<textarea name="txtYM" cols="30" rows="3"><%=oraRS.fields("YM")%></textarea>
          		</div></td>
      		</tr>
      		<tr>
              <td height="40"><div align="right">ԭ������</div></td>
              <td><textarea name="txtYFB" cols="20" rows="3"><%=oraRS.fields("YFB")%></textarea>
                  <input name="button2222" type="button" class="button1" onClick="showStandard('JiBing','Right','txtYFB','<%=JLNUM%>');" value="����ѡ��"></td>
              <td><div align="right">����֢��</div></td>
              <td><textarea name="txtBFZ" cols="20" rows="3"><%=oraRS.fields("BFZ")%></textarea>
                  <input name="button22222" type="button" class="button1" onClick="showStandard('JiBing','Right','txtBFZ','<%=JLNUM%>');" value="����ѡ��"></td>
   		  </tr>
      		<tr>
              <td height="40"><div align="right">������ʽ��</div></td>
              <td><textarea name="txtFBFS" cols="20" rows="3"><%=oraRS.fields("FBFS")%></textarea>
                  <input name="button2222" type="button" class="button1" onClick="showStandard('JiBing','Right','txtYFB','<%=JLNUM%>');" value="����ѡ��"></td>
              <td>
                <div align="right">֢״��Ϣ��</div></td>
              <td><textarea name="txtZZMC" cols="20" rows="3"><%=oraRS.fields("ZZMC")%></textarea>
                  <input name="button4" type="button" class="button1" onClick="showStandard('ZhengZhuang','Right','txtZZMC','<%=JLNUM%>');" value="����ѡ��"></td>
   		  </tr>
      	<tr> 
        	<td height="20" ><div align="right">��ע��</div></td>
        	<td height="20" colspan="3" ><textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea></td>
      	</tr>
		</table>
		</td>
      </tr>
	  <tr>
	    <td height="23"><div align="center">
	      <input type="submit" name="Submit" value="���¼���������Ϣ" onClick="return UpdateRecord()">
	    </div></td>
    </tr>
</table>
</form>
<center>
<a href="javascript:history.go(-1)">����</a>
</center>
</body>
</html>
