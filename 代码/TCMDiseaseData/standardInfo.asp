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
			str="div" + document.forms("formCont").BZLX[document.forms("formCont").BZLX.selectedIndex].value;
		eval("inputCont.innerHTML="+str+".innerHTML");
	}
	
function AddNewRecord()
{
	if(confirm("ȷ��Ҫ�����¼�¼ô?"))
	{
		if (document.forms("formCont").txtBZMC.value=="")
		{
			alert("��׼���Ʋ���Ϊ��!");
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
		if (document.forms(num).txtBZMC.value=="")
		{
			alert("��׼���Ʋ���Ϊ��!");
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
	strSQL="select * from C_ZhenDBZ where JBMC='"&JBMC&"'"
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
<td class="title1"><%=JBMC%>-������ص���ϱ�׼��¼�б�<%=oraRS.RecordCount%>��</td>
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
	<form action="updateStandardInfo.asp?Type=0&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
	<tr> 
      <td width="118"><div align="right">��׼���ƣ�</div></td>
      <td width="253"><div align="left"><textarea name="txtBZMC"><%=oraRS.fields("BZMC")%></textarea>
	  </div></td>
      <td><div align="right">��׼������ࣺ</div></td>
      <td><div align="left">
          <textarea name="txtBZJBFL"><%=oraRS.fields("BZJBFL")%></textarea>
      </div></td>
	</tr>
    <tr>
      <td><div align="right">��׼���룺</div></td>
      <td><div align="left">
          <textarea name="txtBZDM" cols="20" rows="3"><%=oraRS.fields("BZDM")%></textarea>
          <input name="button" type="button" class="button1" onClick="showStandard('JiXing','Right','txtYFJX','<%=JLSUM%>');" value="����ѡ��" />
      </div></td> 
      <td width="162"><div align="right">��׼�ƶ����ڣ�</div></td>
      <td width="237"><div align="left">
          <textarea name="txtBZZDRQ" rows="3"><%=oraRS.fields("BZZDRQ")%></textarea>
        </div></td>
    </tr>
    <tr>
      <td><div align="right">��׼��ݵ�λ��</div></td>
      <td><div align="left">
          <textarea name="txtBZQCDW" rows="3"><%=oraRS.fields("BZQCDW")%></textarea>
      </div></td> 
      <td><div align="right">��׼�϶�����ίԱ�᣺</div></td>
      <td><div align="left">
          <textarea name="txtBZRDJSWYH" cols="20" rows="3"><%=oraRS.fields("BZRDJSWYH")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
        </div></td>
    </tr>
    <tr>
      <td><div align="right">��׼���Ƶ�λ��</div></td>
      <td><div align="left">
          <textarea name="txtBZJZDW" cols="20" rows="3"><%=oraRS.fields("BZJZDW")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
      </div></td>
      <td><div align="right">����ѡ���׼��</div></td>
      <td><div align="left">
          <textarea name="txtBLXZBZ" cols="20" rows="3"><%=oraRS.fields("BLXZBZ")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
      </div></td>
    </tr>
    <tr>
      <td><div align="right">�ٴ����ͱ�׼��</div></td>
      <td><div align="left">
          <textarea name="txtLCFXBZ" cols="20" rows="3"><%=oraRS.fields("LCFXBZ")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
      </div></td>
      <td><div align="right">��ԭѧ���ͱ�׼��</div></td>
      <td><div align="left">
          <textarea name="txtBYXFXBZ" cols="20" rows="3"><%=oraRS.fields("BYXFXBZ")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
      </div></td>
    </tr>
    <tr> 
      <td><div align="right">��ע��</div></td>
      <td colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
	<tr>
    	  <td colspan="4"><div align="center"><input type="submit" name="Submit" value="���¸�����ϱ�׼��¼" onClick="return UpdateRecord(<%=JLSUM%>)">
		  <input type="button" value="ɾ��������ϱ�׼��¼" onClick="if (confirm('ȷ��Ҫɾ����¼ô��')) { window.location='delStandardInfo.asp?Type=0&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
    	  </div></td>
	</tr>	  
	</table>
	</form>
</td></tr>
<%
		oraRS.movenext
	loop
	oraRS.close
	
	strSQL="select * from C_LiaoXBZ where JBMC='"&JBMC&"'"
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<tr>
<td class="title1"><%=JBMC%>-������ص���Ч��׼��¼�б�<%=oraRS.RecordCount%>��</td>
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
	<form action="updateStandardInfo.asp?Type=1&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
      <tr>
        <td><div align="right">��׼���ƣ�</div></td>
        <td><div align="left">
            <textarea name="txtBZMC"><%=oraRS.fields("BZMC")%></textarea>
        </div></td>
        <td><div align="right">��׼������ࣺ</div></td>
        <td><div align="left">
            <textarea name="txtBZJBFL"><%=oraRS.fields("BZJBFL")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td><div align="right">��׼���룺</div></td>
        <td><div align="left">
            <textarea name="txtBZDM" cols="20" rows="3"><%=oraRS.fields("BZDM")%></textarea>
            <input name="button" type="button" class="button1" onClick="showStandard('JiXing','Right','txtYFJX','<%=JLSUM%>');" value="����ѡ��" />
        </div></td>
        <td><div align="right">��׼�ƶ����ڣ�</div></td>
        <td><div align="left">
            <textarea name="txtBZZDRQ" rows="3"><%=oraRS.fields("BZZDRQ")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td><div align="right">��׼��ݵ�λ��</div></td>
        <td><div align="left">
            <textarea name="txtBZQCDW" rows="3"><%=oraRS.fields("BZQCDW")%></textarea>
        </div></td>
        <td><div align="right">��׼�϶�����ίԱ�᣺</div></td>
        <td><div align="left">
            <textarea name="txtBZRDJSWYH" cols="20" rows="3"><%=oraRS.fields("BZRDJSWYH")%></textarea>
            <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
        </div></td>
      </tr>
      <tr>
        <td><div align="right">��׼���Ƶ�λ��</div></td>
        <td colspan="3"><div align="left">
            <textarea name="txtBZJZDW" cols="60" rows="3"><%=oraRS.fields("BZJZDW")%></textarea>
        </div></td>
      </tr>
	<tr> 
      <td width="17%"><div align="right">��ע��</div></td>
      <td width="83%" colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
	<tr>
    	  <td colspan="4"><div align="center"><input type="submit" name="Submit" value="���¸�����Ч��׼��¼" onClick="return confirm('ȷ��Ҫ���¼�¼ô��')">
		  <input type="button" value="ɾ��������Ч��׼��¼" onClick="if (confirm('ȷ��Ҫɾ����¼ô��')) { window.location='delStandardInfo.asp?Type=1&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
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

<tr><td align="center" class="title1">�����Ѽӹ��ı�׼��¼��<%=JLSUM%>��</td></tr>
<tr>
<td align="center" class="title1">���һ���µı�׼��Ϣ��¼</td>
</tr>
<tr><td>
<%JLSUM=JLSUM+1%>
<form name="formCont" action="insertStandardInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
  <INPUT type="hidden" name="pastefield">
  <table width="100%" class="table3">
    <tr> 
      <td><div align="center">��׼���ͣ� 
            <select name="BZLX" id="BZLX" onChange="inputShow(-1)">
              <option value="0" selected>��ϱ�׼</option>
              <option value="1">��Ч��׼</option>
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
        <input type="submit" name="Submit2" value="���������׼��Ϣ" onClick="return AddNewRecord()">
      </div></td>
    </tr>
	</table>
</form>
</td></tr>
</table>
<div id="div0"  style="VISIBILITY: hidden;POSITION: absolute; left: 8px; top: 217px;">
	<table border="0" class="table3">
   <tr> 
      <td width="118"><div align="right">��׼���ƣ�</div></td>
      <td width="253"><div align="left"><textarea name="txtBZMC"></textarea>
	  </div></td>
      <td><div align="right">��׼������ࣺ</div></td>
      <td><div align="left">
          <textarea name="txtBZJBFL"></textarea>
      </div></td>
	</tr>
    <tr>
      <td><div align="right">��׼���룺</div></td>
      <td><div align="left">
          <textarea name="txtBZDM" cols="20" rows="3"></textarea>
          <input name="button" type="button" class="button1" onClick="showStandard('JiXing','Right','txtYFJX','<%=JLSUM%>');" value="����ѡ��" />
      </div></td> 
      <td width="162"><div align="right">��׼�ƶ����ڣ�</div></td>
      <td width="237"><div align="left">
          <textarea name="txtBZZDRQ" rows="3"></textarea>
        </div></td>
    </tr>
    <tr>
      <td><div align="right">��׼��ݵ�λ��</div></td>
      <td><div align="left">
          <textarea name="txtBZQCDW" rows="3"></textarea>
      </div></td> 
      <td><div align="right">��׼�϶�����ίԱ�᣺</div></td>
      <td><div align="left">
          <textarea name="txtBZRDJSWYH" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
        </div></td>
    </tr>
    <tr>
      <td><div align="right">��׼���Ƶ�λ��</div></td>
      <td><div align="left">
          <textarea name="txtBZJZDW" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
      </div></td>
      <td><div align="right">����ѡ���׼��</div></td>
      <td><div align="left">
          <textarea name="txtBLXZBZ" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
      </div></td>
    </tr>
    <tr>
      <td><div align="right">�ٴ����ͱ�׼��</div></td>
      <td><div align="left">
          <textarea name="txtLCFXBZ" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
      </div></td>
      <td><div align="right">��ԭѧ���ͱ�׼��</div></td>
      <td><div align="left">
          <textarea name="txtBYXFXBZ" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
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
        <td><div align="right">��׼���ƣ�</div></td>
        <td><div align="left">
            <textarea name="txtBZMC"></textarea>
        </div></td>
        <td><div align="right">��׼������ࣺ</div></td>
        <td><div align="left">
            <textarea name="txtBZJBFL"></textarea>
        </div></td>
      </tr>
      <tr>
        <td><div align="right">��׼���룺</div></td>
        <td><div align="left">
            <textarea name="txtBZDM" cols="20" rows="3"></textarea>
            <input name="button" type="button" class="button1" onClick="showStandard('JiXing','Right','txtYFJX','<%=JLSUM%>');" value="����ѡ��" />
        </div></td>
        <td><div align="right">��׼�ƶ����ڣ�</div></td>
        <td><div align="left">
            <textarea name="txtBZZDRQ" rows="3"></textarea>
        </div></td>
      </tr>
      <tr>
        <td><div align="right">��׼��ݵ�λ��</div></td>
        <td><div align="left">
            <textarea name="txtBZQCDW" rows="3"></textarea>
        </div></td>
        <td><div align="right">��׼�϶�����ίԱ�᣺</div></td>
        <td><div align="left">
            <textarea name="txtBZRDJSWYH" cols="20" rows="3"></textarea>
            <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="����ѡ��" />
        </div></td>
      </tr>
      <tr>
        <td><div align="right">��׼���Ƶ�λ��</div></td>
        <td colspan="3"><div align="left">
            <textarea name="txtBZJZDW" cols="60" rows="3"></textarea>
        </div></td>
      </tr>
	<tr> 
      <td width="17%"><div align="right">��ע��</div></td>
      <td width="83%" colspan="3"><div align="left">
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
