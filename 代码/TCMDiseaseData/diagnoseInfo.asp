<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ϸ����ӹ���Уҳ��</title>
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function AddNewRecord()
{
	if(confirm("ȷ��Ҫ�����¼�¼ô?"))
	{
		if(document.forms("formCont").txtFFMC.value=="")
		{
			alert("�������Ʋ���Ϊ��!");
			return false;
		}
		return true;
	}
	else
		return false;
}
function UpdateRecord(num)
{
	if(confirm("ȷ��Ҫ���¼�¼ô?"))
	{
		if(document.forms(num).txtFFMC.value=="")
		{
			alert("�������Ʋ���Ϊ��!");
			return false;
		}
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
	strSQL="select * from C_ZhenDFF where JBMC='"&JBMC&"'"
	
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	
%>
<form>
<INPUT type="hidden" name="pastefield">
</form>
<table width="800" height="282" border="0" align="center" class="table2">
<tr>
<td class="title1"><%=JBMC%>-������ص���Ϸ�����¼�б�<%=oraRS.RecordCount%>��<br/></td>
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
	<div align="center"style="width: 790px;">
	<form action="updateDiagnoseInfo.asp?ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" border="0" class="table3">
      	<tr> 
        	<td><div align="right">�������ƣ�</div></td>        
  			<td><textarea name="txtFFMC" cols="30" rows="5"><%=oraRS.fields("FFMC")%></textarea></td>
        	<td><div align="right">Ӧ�÷�Χ��</div></td>
        	<td><div align="left">
        		  <textarea name="txtYYFW" cols="30" rows="5"><%=oraRS.fields("YYFW")%></textarea>
        		  <input name="button2223" type="button" class="button1" onClick="showStandard('zhendzbfl','Right','txtZDZBFL','<%=JLNUM%>');" value="����ѡ��">
      	  </div></td>
      	</tr>
      	<tr> 
        	<td><div align="right">����ҽ���</div></td>
        	<td><textarea name="txtZXYLB" cols="30" rows="5"><%=oraRS.fields("ZXYLB")%></textarea></td>
        	<td><div align="right">��ϱ�׼��</div></td>
        	<td><div align="left">
        		  <textarea name="txtZDBZ" cols="30" rows="5"><%=oraRS.fields("ZDBZ")%></textarea>
        		  <input name="button2224" type="button" class="button1" onClick="showStandard('neiyxwz','Right','txtZBXM','<%=JLNUM%>');" value="����ѡ��">
      	  </div></td>
      	</tr>
      	<tr>
          <td height="20" ><div align="right">����������</div></td>
          <td height="20"><textarea name="txtFF" cols="30" rows="5"><%=oraRS.fields("FF")%></textarea></td>
    	  <td><div align="right">������ϣ�</div></td>
        	<td><div align="left">
        		  <textarea name="txtJBZD" cols="30" rows="5"><%=oraRS.fields("JBZD")%></textarea>
        		  <input name="button2224" type="button" class="button1" onClick="showStandard('neiyxwz','Right','txtZBXM','<%=JLNUM%>');" value="����ѡ��">
      	  </div></td>
		  </tr>
		<tr> 
        	<td height="20" ><div align="right">��ע��</div></td>
        	<td height="20" colspan="4" ><textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea></td>
      	</tr>
	  	<tr>
	  		<td colspan="4"><div align="center"><input type="submit" name="Submit" value="���¸�����Ϸ�����¼" onClick="return UpdateRecord(<%=JLNUM%>)"> 
    	  	<input type="button" value="ɾ��������Ϸ�����¼" onClick="if (confirm('ȷ��Ҫɾ����¼ô��')) { window.location='delDiagnoseInfo.asp?ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
			</div></td>
	  	</tr>
	</table>
	</form>
	</div>
</td><tr>
<%
		oraRS.movenext
	loop
	JLNUM=JLNUM+1
%>
<tr>
<td class="title1"><div align="center">���һ���µ���Ϸ�����¼</div></td>
</tr>
<tr>
<td>
	<form name="formCont" action="insertDiagnoseInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" border="0" class="table3">
      	<tr>
      	  <td><div align="right">�������ƣ�</div></td>
      	  <td><textarea name="txtFFMC" cols="30" rows="5"><%=oraRS.fields("FFMC")%></textarea></td> 
        	<td><div align="right">Ӧ�÷�Χ��</div></td>
        	<td><div align="left">
                <textarea name="txtYYFW" cols="30" rows="5"><%=oraRS.fields("YYFW")%></textarea>
                <input name="button2223" type="button" class="button1" onClick="showStandard('zhendzbfl','Right','txtZDZBFL','<%=JLNUM%>');" value="����ѡ��">
            </div></td>
      	</tr>
      	<tr>
      	  <td><div align="right">����ҽ���</div></td>
      	  <td><textarea name="txtZXYLB" cols="30" rows="5"><%=oraRS.fields("ZXYLB")%></textarea></td> 
        	<td><div align="right">��ϱ�׼��</div></td>
        	<td><div align="left">
                <textarea name="txtZDBZ" cols="30" rows="5"><%=oraRS.fields("ZDBZ")%></textarea>
                <input name="button2224" type="button" class="button1" onClick="showStandard('neiyxwz','Right','txtZBXM','<%=JLNUM%>');" value="����ѡ��">
            </div></td>
      	</tr>
      	<tr>
      	  <td height="20" ><div align="right">����������</div></td>
      	  <td height="20"><textarea name="txtFF" cols="30" rows="5"><%=oraRS.fields("FF")%></textarea></td>
      	  <td><div align="right">������ϣ�</div></td>
      	  <td><div align="left">
              <textarea name="txtJBZD" cols="30" rows="5"><%=oraRS.fields("JBZD")%></textarea>
              <input name="button2224" type="button" class="button1" onClick="showStandard('neiyxwz','Right','txtZBXM','<%=JLNUM%>');" value="����ѡ��">
          </div></td>
          </tr>
		<tr> 
        	<td height="20" ><div align="right">��ע��</div></td>
        	<td height="20" colspan="4" ><textarea name="txtBZ" cols="60" rows="3"></textarea></td>
      	</tr>
	  	<tr>
	  		<td colspan="4"><div align="center"><input type="submit" name="Submit" value="��Ӹ�����Ϸ�����¼" onClick="return AddNewRecord()"></div></td> 
	  	</tr>
	</table>
	</form>
</td>
</tr>
</table>
<center>
<a href="javascript:history.go(-1)">����</a>
</center
></body>
</html>
