<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>֤��ӹ���Уҳ��</title>
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function AddNewRecord()
{
	if(confirm("ȷ��Ҫ�����¼�¼ô?"))
	{
		return true;
	}
	else
		return false;
}
function UpdateRecord(num)
{
	if(confirm("ȷ��Ҫ���¼�¼ô?"))
	{
		return true;
	}
	else
		return false;
}

var standard;
function showStandard(strTable,strPos,txtTarget,strnum)
{
	var num = parseInt(strnum);
	var left;
	
	if (strPos=="left")
		left=screen.width-280;
	else
		left=0;
	document.forms(num).pastefield.value=txtTarget;

	if (standard=='[object]')
		standard.close();
			
	standard=window.open("/starch/wizard.asp?table="+strTable+"&formNum="+num,"standard","width=310,height=500,left="+left+",top=25,toolbar=no,scrollbars=yes");
	
	if ((document.forms(num).window!=null) && (!standard.opener))
		standard.opener=document.forms(num).window;
		
	standard.focus();
}
//-->
</script>
</head>

<body class="body">
<% 
	dim JBMC
	JBMC=request.QueryString("JBMC")
	dim strSQL
	strSQL="select * from C_ChuC where JBMC='"&JBMC&"'"
	
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	
%>
<form>
<INPUT type="hidden" name="pastefield">
</form>
<table width="800" border="0" align="center" class="table2">
<tr>
<td class="title1"><%=JBMC%>-������صĳ�����¼�б�<%=oraRS.RecordCount%>��<br/></td>
</tr>
<%		
	Dim JLNUM
	JLNUM= 0    	
	oraRS.MoveFirst
    Do Until oraRS.EOF
		JLNUM= JLNUM+1
%>
<tr><td class="title1"><%response.Write(JLNUM)%></td></tr>
<tr><td>
	<form action="updateDerivationInfo.asp?ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
    	<tr> 
      		<td height="40"> <div align="right">���ߣ�</div></td>
      		<td><textarea name="txtZZ" cols="20" rows="3"><%=oraRS.fields("ZZ")%></textarea> 
       		</td>
      		<td height="40"><div align="right">���ߵ�λ��</div></td>
      		<td><textarea name="txtZZDW" cols="30" rows="3"><%=oraRS.fields("ZZDW")%></textarea>
            </td>
    	</tr>
    	<tr> 
      		<td height="40"> <div align="right">�����磺</div></td>
      		<td><textarea name="txtCBS" cols="20" rows="3"><%=oraRS.fields("CBS")%></textarea>
        		<input type="button" class="button1" onClick="showStandard('ZhengHou','Right','txtZHMC','<%=JLNUM%>');" value="����ѡ��"></td>
      		<td> <div align="right">�������ͣ�</div></td>
      		<td><textarea name="txtCBLX" cols="20" rows="3"><%=oraRS.fields("CBLX")%></textarea>
        		<input name="button4" type="button" class="button1" onClick="showStandard('ZhengZhuang','Right','txtZZMC','<%=JLNUM%>');" value="����ѡ��"></td>
    	</tr>
		<tr> 
      		<td height="40"> <div align="right">���ƣ�</div></td>
      		<td><textarea name="txtMC" cols="30" rows="3"><%=oraRS.fields("MC")%></textarea>
       		</td>
      		<td> <div align="right">�ص㣺</div></td>
      		<td><textarea name="txtDD" cols="30" rows="3"><%=oraRS.fields("DD")%></textarea>
       		</td>
		</tr>
		<tr> 
			<td height="40"> <div align="right">ʱ�䣺</div></td>
      		<td><textarea name="txtSJ" cols="30" rows="3"><%=oraRS.fields("SJ")%></textarea>
        	<td height="20" ><div align="right">��ע��</div></td>
        	<td height="20" ><textarea name="txtBZ" cols="30" rows="3"><%=oraRS.fields("BZ")%></textarea></td>
      	</tr>
    	<tr>
    	  <td height="16" colspan="4"><div align="center"><input type="submit" name="Submit" value="���¸���������¼" onClick="return UpdateRecord(<%=JLNUM%>)"> 
		  <input type="button" value="ɾ������������¼" onClick="if (confirm('ȷ��Ҫɾ����¼ô��')) { window.location='delDerivationInfo.asp?ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
    	  </div></td>
   	  	</tr>
  	</table>
	</form>
</td></tr>
<%
		oraRS.movenext
	loop
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	JLNUM=JLNUM+1
%>
<tr>
<td class="title1"><div align="center">���һ���µĳ�����¼</div></td>
</tr>
<tr>
<td>
	<form name="formCont" action="insertDerivationInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
    	<tr>
          <td height="40">
            <div align="right">���ߣ�</div></td>
          <td><textarea name="txtZZ" cols="20" rows="3"></textarea>
          </td>
          <td height="40"><div align="right">���ߵ�λ��</div></td>
          <td><textarea name="txtZZDW" cols="30" rows="3"></textarea>
          </td>
  	  </tr>
    	<tr>
          <td height="40">
            <div align="right">�����磺</div></td>
          <td><textarea name="txtCBS" cols="20" rows="3"></textarea>
              <input type="button" class="button1" onClick="showStandard('ZhengHou','Right','txtZHMC','<%=JLNUM%>');" value="����ѡ��"></td>
          <td>
            <div align="right">�������ͣ�</div></td>
          <td><textarea name="txtCBLX" cols="20" rows="3"></textarea>
              <input name="button4" type="button" class="button1" onClick="showStandard('ZhengZhuang','Right','txtZZMC','<%=JLNUM%>');" value="����ѡ��"></td>
  	  </tr>
    	<tr>
          <td height="40">
            <div align="right">���ƣ�</div></td>
          <td><textarea name="txtMC" cols="30" rows="3"></textarea>
          </td>
          <td>
            <div align="right">�ص㣺</div></td>
          <td><textarea name="txtDD" cols="30" rows="3"></textarea>
          </td>
  	  </tr>
    	<tr>
          <td height="40">
            <div align="right">ʱ�䣺</div></td>
          <td><textarea name="txtSJ" cols="30" rows="3"></textarea>
          <td height="20" ><div align="right">��ע��</div></td>
          <td height="20" ><textarea name="txtBZ" cols="30" rows="3"></textarea></td>
  	  </tr>
    	<tr>
    	  <td height="16" colspan="4"><div align="center"><input type="submit" name="Submit" value="��Ӹ���������¼" onClick="return AddNewRecord()">
    	  </div></td>
   	  	</tr>
  	</table>
	</form></td>
</tr>
</table>
<center>
<a href="javascript:history.go(-1)">����</a>
</center>
</body>
</html>
