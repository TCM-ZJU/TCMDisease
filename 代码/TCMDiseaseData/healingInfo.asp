<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������Ϣ�ӹ�ҳ��</title>
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!--
	function windowOnload(stepnum) 
    {			 
		inputShow(stepnum);		
	}
	function inputShow(stepnum)
	{
		var str;
		if (stepnum !=-1)
			str="div"+stepnum;
		else
			str="div" + document.forms("formCont").JLLX[document.forms("formCont").JLLX.selectedIndex].value;
		eval("inputCont.innerHTML="+str+".innerHTML");
	}
	
function AddNewRecord()
{
	if(confirm("ȷ��Ҫ�����¼�¼ô?"))
	{
		if (document.forms("formCont").JLLX.value==0 && document.forms("formCont").txtKFFF.value=="")
		{
			alert("������������Ϊ��!");
			return false;
		}
		if (document.forms("formCont").JLLX.value==1 && document.forms("formCont").txtYFFF.value=="")
		{
			alert("Ԥ����������Ϊ��!");
			return false;
		}
		if (document.forms("formCont").JLLX.value==2 && document.forms("formCont").txtYHMS.value=="")
		{
			alert("Ԥ����������Ϊ��!");
			return false;
		}
		if (document.forms("formCont").JLLX.value==3 && document.forms("formCont").txtPDFF.value=="")
		{
			alert("������������Ϊ��!");
			return false;
		}
		return true;
	}
	else
		return false;
}
function UpdateKFRecord(num)
{
	if(confirm("ȷ��Ҫ���¼�¼ô?"))
	{
		if (document.forms(num).txtKFFF.value=="")
		{
			alert("������������Ϊ��!");
			return false;
		}
		return true;
	}
	else
		return false;
}
function UpdateYFRecord(num)
{
	if(confirm("ȷ��Ҫ���¼�¼ô?"))
	{
		if (document.forms(num).txtYFFF.value=="")
		{
			alert("Ԥ����������Ϊ��!");
			return false;
		}
		return true;
	}
	else
		return false;
}
function UpdateYHRecord(num)
{
	if(confirm("ȷ��Ҫ���¼�¼ô?"))
	{
		if (document.forms(num).txtYHMS.value=="")
		{
			alert("Ԥ����������Ϊ��!");
			return false;
		}
		return true;
	}
	else
		return false;
}
function UpdateLXRecord(num)
{
	if(confirm("ȷ��Ҫ���¼�¼ô?"))
	{
		if (document.forms(num).txtPDFF.value=="")
		{
			alert("������������Ϊ��!");
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

-->
</script>
</head>

<body class="body" onLoad="return windowOnload(0)" onUnload="if (standard=='[object]') standard.close();">
<%
	dim JBMC
	JBMC=request.QueryString("JBMC")
	
	dim strSQL
	strSQL="select * from C_KangF where JBMC='"&JBMC&"'"
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	
	Dim JLSUM
	JLSUM= 0
%>
<form>
<INPUT type="hidden" name="pastefield">
</form>
<table width="800" border="0" align="center" class="table2">
<tr>
<td class="title1"><%=JBMC%>-������صĿ�����¼�б�<%=oraRS.RecordCount%>��</td>
</tr>
<%		
	Dim JLNUM
	JLNUM= 0    	
	oraRS.MoveFirst
    Do Until oraRS.EOF
		JLNUM= JLNUM+1
		JLSUM= JLSUM+1
%>
<tr><td class="title1"><%response.Write(JLNUM)%></td></tr>
<tr><td>
	<form action="updateHealingInfo.asp?Type=0&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
	<tr> 
      <td><div align="right">����������</div></td>
      <td><div align="left"><textarea name="txtKFFF"><%=oraRS.fields("KFFF")%></textarea>
	  </div></td>
      <td width="134"><div align="right">����������</div></td>
      <td width="247"><div align="left">
          <textarea name="txtFFMS"><%=oraRS.fields("FFMS")%></textarea>
      </div></td>
	</tr>
    <tr> 
      <td><div align="right">��ע��</div></td>
      <td colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
	<tr>
    	  <td colspan="4"><div align="center"><input type="submit" name="Submit" value="���¸���������¼" onClick="return UpdateKFRecord(<%=JLSUM%>)">
		  <input type="button" value="ɾ������������¼" onClick="if (confirm('ȷ��Ҫɾ����¼ô��')) { window.location='delHealingInfo.asp?Type=0&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
    	  </div></td>
	</tr>	  
	</table>
	</form>
</td></tr>
<%
		oraRS.movenext
	loop
	oraRS.close
	
	strSQL="select * from C_YuF where JBMC='"&JBMC&"'"
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<tr>
<td class="title1"><%=JBMC%>-������ص�Ԥ����¼�б�<%=oraRS.RecordCount%>��</td>
</tr>
<%	
	JLNUM= 0    	
	oraRS.MoveFirst
    Do Until oraRS.EOF
		JLNUM= JLNUM+1
		JLSUM= JLSUM+1
%>
<tr><td class="title1"><%response.Write(JLNUM)%></td></tr>
<tr><td>
	<form action="updateHealingInfo.asp?Type=1&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
    <tr> 
      <td width="17%"><div align="right">Ԥ��������</div></td>
      <td width="33%"><div align="left"><textarea name="txtYFFF"><%=oraRS.fields("YFFF")%></textarea></div></td>
      <td width="17%"><div align="right">����������</div></td>
      <td width="33%"><div align="left">
          <textarea name="txtFFMS"><%=oraRS.fields("FFMS")%></textarea>
      </div></td>
    </tr>
	<tr> 
      <td><div align="right">��ע��</div></td>
      <td colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
	<tr>
    	  <td colspan="4"><div align="center"><input type="submit" name="Submit" value="���¸���Ԥ����¼" onClick="return UpdateYFRecord(<%=JLSUM%>)">
		  <input type="button" value="ɾ������Ԥ����¼" onClick="if (confirm('ȷ��Ҫɾ����¼ô��')) { window.location='delHealingInfo.asp?Type=1&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
    	  </div></td>
	</tr>	
  </table>
  </form>
</td></tr>
<%
		oraRS.movenext
	loop
	oraRS.close
	
	strSQL="select * from C_YuH where JBMC='"&JBMC&"'"
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<tr>
<td class="title1"><%=JBMC%>-������ص�Ԥ���¼�б�<%=oraRS.RecordCount%>��</td>
</tr>
<%	
	JLNUM= 0    	
	oraRS.MoveFirst
    Do Until oraRS.EOF
		JLNUM= JLNUM+1
		JLSUM= JLSUM+1
%>
<tr><td class="title1"><%response.Write(JLNUM)%></td></tr>
<tr><td>
	<form action="updateHealingInfo.asp?Type=2&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
	  <tr>
        <td><div align="right">Ԥ��������</div></td>
        <td><div align="left">
            <textarea name="txtYHMS" cols="60" rows="3"><%=oraRS.fields("YHMS")%></textarea>
        </div></td>
	    </tr>
	<tr> 
      <td width="17%"><div align="right">��ע��</div></td>
      <td width="83%"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
	<tr>
    	  <td colspan="2"><div align="center"><input type="submit" name="Submit" value="���¸���Ԥ���¼" onClick="return UpdateYHRecord(<%=JLSUM%>)">
		  <input type="button" value="ɾ������Ԥ���¼" onClick="if (confirm('ȷ��Ҫɾ����¼ô��')) { window.location='delHealingInfo.asp?Type=2&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
    	  </div></td>
	</tr>	
  </table>
  </form>
</td></tr>
<%
		oraRS.movenext
	loop
	oraRS.close
	
	strSQL="select * from C_LiaoX where JBMC='"&JBMC&"'"
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<tr>
<td class="title1"><%=JBMC%>-������ص���Ч��¼�б�<%=oraRS.RecordCount%>��</td>
</tr>
<%	
	JLNUM= 0    	
	oraRS.MoveFirst
    Do Until oraRS.EOF
		JLNUM= JLNUM+1
		JLSUM= JLSUM+1
%>
<tr><td class="title1"><%response.Write(JLNUM)%></td></tr>
<tr><td>
	<form action="updateHealingInfo.asp?Type=3&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
	  <tr>
        <td><div align="right">����������</div></td>
        <td><div align="left">
            <textarea name="txtPDFF" cols="60" rows="3"><%=oraRS.fields("PDFF")%></textarea>
        </div></td>
	    </tr>
	<tr> 
      <td width="17%"><div align="right">��ע��</div></td>
      <td width="83%"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
	<tr>
    	  <td colspan="2"><div align="center"><input type="submit" name="Submit" value="���¸�����Ч��¼" onClick="return UpdateLXRecord(<%=JLSUM%>)">
		  <input type="button" value="ɾ��������Ч��¼" onClick="if (confirm('ȷ��Ҫɾ����¼ô��')) { window.location='delHealingInfo.asp?Type=3&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
    	  </div></td>
	</tr>	
  </table>
  </form>
</td></tr>
<%
		oraRS.movenext
	loop
	oraRS.close
%>

<tr><td align="center" class="title1">�����Ѽӹ������Ƽ�¼��<%=JLSUM%>��</td></tr>
<tr>
<td align="center" class="title1">���һ���µļ�¼</td>
</tr>
<tr><td>
<%JLSUM=JLSUM+1%>
<form name="formCont" action="insertHealingInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
  <INPUT type="hidden" name="pastefield">
  <table width="100%" class="table3">
    <tr> 
      <td><div align="center">��¼���ͣ� 
            <select name="JLLX" onChange="inputShow(-1)">
              <option value="0" selected>����</option>
              <option value="1">Ԥ��</option>
			  <option value="2">Ԥ��</option>
			  <option value="3">��Ч</option>
            </select>
          </div></td>
    </tr>   
	<tr> 
      <td id="inputCont"></td>
    </tr>
    <tr> 
      <td ><hr color="#0099CC"/></td>
    </tr>
    <tr>
      <td ><div align="center">
        <input type="submit" name="Submit2" value="���������¼��Ϣ" onClick="return AddNewRecord()">
      </div></td>
    </tr>
	</table>
</form>
</td></tr>
</table>
<div id="div0"  style="VISIBILITY: hidden;POSITION: absolute; left: 8px; top: 217px;">
	<table border="0" class="table3">
   <tr> 
      <td><div align="right">����������</div></td>
      <td><div align="left"><textarea name="txtKFFF"></textarea>
	  </div></td>
      <td width="134"><div align="right">����������</div></td>
      <td width="247"><div align="left">
          <textarea name="txtFFMS"></textarea>
      </div></td>
	</tr>
    <tr> 
      <td><div align="right">��ע��</div></td>
      <td colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"></textarea>
        </div></td>
    </tr>
  </table>
</div>
<div id="div1"  style="VISIBILITY: hidden;POSITION: absolute; left: 8px; top: 217px;">
	<table width="100%" height="122" border="0" class="table3">
     <tr> 
      <td width="17%"><div align="right">Ԥ��������</div></td>
      <td width="33%"><div align="left"><textarea name="txtYFFF"></textarea></div></td>
      <td width="17%"><div align="right">����������</div></td>
      <td width="33%"><div align="left">
          <textarea name="txtFFMS"></textarea>
      </div></td>
    </tr>
	<tr> 
      <td><div align="right">��ע��</div></td>
      <td colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
  </table>
</div>
<div id="div2"  style="VISIBILITY: hidden;POSITION: absolute; left: 8px; top: 217px;">
	<table width="100%" height="122" border="0" class="table3">
     <tr>
        <td><div align="right">Ԥ��������</div></td>
        <td><div align="left">
            <textarea name="txtYHMS" cols="60" rows="3"></textarea>
        </div></td>
	    </tr>
	<tr> 
      <td width="17%"><div align="right">��ע��</div></td>
      <td width="83%"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"></textarea>
        </div></td>
    </tr>
  </table>
</div>
<div id="div3"  style="VISIBILITY: hidden;POSITION: absolute; left: 8px; top: 217px;">
	<table width="100%" height="122" border="0" class="table3">
    <tr>
        <td><div align="right">����������</div></td>
        <td><div align="left">
            <textarea name="txtPDFF" cols="60" rows="3"></textarea>
        </div></td>
	    </tr>
	<tr> 
      <td width="17%"><div align="right">��ע��</div></td>
      <td width="83%"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"></textarea>
        </div></td>
    </tr>
  </table>
</div>
<center>
<a href="javascript:history.go(-1)">����</a>
</center>
</body>
</html>
