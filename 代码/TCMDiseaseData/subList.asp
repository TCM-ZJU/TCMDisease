<%@ Language=VBScript %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�ٴ��о���¼�б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function workOnclick(id)
{
	document.forms("formData").JBID.value=id;
	document.forms("formData").Type.value=0;
	formData.submit();
}
function checkOnclick(id)
{
	document.forms("formData").JBID.value=id;
	document.forms("formData").Type.value=1;
	formData.submit();
}
function uploadOnclick(id,mc)
{
	document.forms("formUpload").JBID.value=id;
	document.forms("formUpload").JBMC.value=mc;
	formUpload.submit();
}
function jumppn()
{
	document.formSelectPage.offset.value=(document.formSelectPage.pnselect.value-1)*10+1;
	document.formSelectPage.submit();
}
//-->
</script>
</head>

<body class="body">
<%
	dim condition
	condition=request.Form("Condition")
	'response.Write(condition)
	dim sqlstr
	strSQL="select ID, JBMC, LRRY, JGDW, ZTBZ from C_JiB"
	if condition<>"" then 
		strSQL=strSQL+" where "&condition
	end if
'	response.Write(strSQL)
	strSQL=strSQL+" order by LRRQ desc"
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	dim recordnum
	recordnum=oraRS.recordcount
	dim row
	dim intPage
	dim intoffset
	dim intUBound
	dim pagenum
	dim sum

	intPage=10
	intOffset=Cint(Request("offset"))
	pagenum=Cint(recordnum/intPage)
	sum =pagenum*intPage
	if recordnum>sum then
		pagenum=pagenum+1
	end if
%>
<center>
	<table width="800" border="0" class="table2">
        <tr> 
          <td colspan="5" class="title1">���������ĵļ�����¼<%=recordnum%>������<%=Cint(intOffset/intPage)+1%>ҳ����<%=pagenum%>ҳ</td>
        </tr>
        <tr>
			<td><div align="center"><strong>��������</strong></div></td>
			<td width="123"><div align="center"><strong><font size="-1">¼����Ա</font></strong></div></td>
			<td width="110"><div align="center"><strong><font size="-1">�ӹ���λ</font></strong></div></td>
            <td width="118"><div align="center"><strong><font size="-1">״̬˵��</font></strong></div></td>
          <td><div align="center"><strong>����</strong></div></td>
		</tr>
<%
	if intOffset+intPage> recordnum then
		intUBound=recordnum-intOffset
	else
		intUBound=intPage-1
	end if
	on error resume next
	oraRS.MoveTo intOffset
	for row = 0 to intUBound
%>
		<tr> 
          <td width="186"><%=oraRS.fields(1).value%></td>
		  <td><%if not IsNull(oraRS.fields(2)) then response.Write(oraRS.fields(4)) end if%></td>
		  <td><%if not IsNull(oraRS.fields(3)) then response.Write(oraRS.fields(4)) end if%></td>
		  <td><%if not IsNull(oraRS.fields(4)) then response.Write(oraRS.fields(4)) end if%></td>
          <td width="237"><div align="center"> 
              <input name="Work" type="button" class="button1" value="�ӹ�����" onClick="return workOnclick(<%=oraRS.fields(0).value%>)">              
              <input name="Check" type="button" class="button1" value="��У��¼" onClick="return checkOnclick(<%=oraRS.fields(0).value%>)">
            </div></td>
        </tr>
		<tr>
			<td colspan="5"><hr color="#99CCFF"/></td>
		</tr>
<%
 	oraRS.movenext
	next
	response.write  errinformation
	
	oraRS.close
	oraDB.close
	set oraRS=nothing
	set oraDB=nothing
%>
		<tr>
			
      <td height="24" colspan="5">
        <div align="center">
<form name="formPrePage" action="subList.asp?offset=<%=(intOffset-intPage)%>" method="post">
		<input type="hidden" name="Condition" value="<%=condition%>">
          <input name="PrePage" type="submit" class="button1" value="��һҳ" 
<%
	if intOffset-intPage<=0 then
		Response.Write "disabled"
	end if
%>>
</form>
<form name="formNextPage" action="subList.asp?offset=<%=(intOffset+intPage)%>" method="post">
		<input type="hidden" name="Condition" value="<%=condition%>">
		  <input name="NextPage" type="submit" class="button1" value="��һҳ" 
<%
	if intOffset+intPage>recordnum then
		Response.Write "disabled"
	end if
%>>
</form>
<form name="formSelectPage" action="subList.asp" method="post">
��
<select name=pnselect>
<%
dim i
for i=1 to pagenum
%>
<option value=<%=i%>><%=i%></option>
<%next%>
</select>
ҳ
	<input type="hidden" name="Condition" value="<%=condition%>">
	<input type="hidden" name="offset" >
	<input type="button" value="��ת" onclick="jumppn()" >
</form>
        </div></td>
		</tr>
      </table>
	  <a href="javascript:history.go(-1)">����</a>
	  <a href="selectSub.asp">��������ѯ</a> 
</center>
<form name="formData" action="purview.asp" method="post">
  <input type="hidden" name="JBID" value="">
  <input type="hidden" name="Type" value="">
</form>
<form name="formUpload" action="upload.asp" method="post">
	<input type="hidden" name="JBID" value="">
	<input type="hidden" name="JBMC" value="">	
</form>
<hr border="2" color="#6699CC">
<center><BR><FONT size=2>TCM Online Co. Ltd.</FONT></center>
</body>
</html>
