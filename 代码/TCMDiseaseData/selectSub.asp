<%@ Language=VBScript %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>������¼ѡ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function OKOnclick()
{
	var len,condition="";
	if(document.forms("formCont").chkTitle.checked)
		condition="JBMC like '%"+document.forms("formCont").txtTitle.value+"%' and ";
	if(document.forms("formCont").chkPerson.checked)
		condition=condition+"LRRY='"+document.forms("formCont").txtPerson.value+"' and ";
	if(document.forms("formCont").chkDate.checked)
		condition=condition+"LRRQ"+document.forms("formCont").comDate.value+"TO_DATE('"+document.forms("formCont").txtDate.value+"','YYYY-MM-DD') and ";
	if(document.forms("formCont").chkLabel.checked)
		condition=condition+"ZTBZ like '"+document.forms("formCont").txtLabel.value+document.forms("formCont").txtLabelend.value+"%' and ";
	if(document.forms("formCont").chkState.checked)
		condition=condition+"BJZT='"+document.forms("formCont").txtState.value+"' and ";
	if(document.forms("formCont").chkUnit.checked)
		condition=condition+"JGDW='"+document.forms("formCont").txtUnit.value+"' and ";
	if(condition.length!=0)
	{
		len=condition.length-4;
		condition=condition.substring(0,len);
	}
	if(document.forms("formCont").chkReverse[1].checked)
	{
		condition="not ("+condition+")";
	}
	document.forms("formCont").Condition.value = condition;
	//alert(condition);
	formCont.submit();
}
//-->
</script>
</head>

<body class="body">
<center>
<form name="formCont" action="subList.asp?offset=1" method="post">
	<table width="600" border="0" align="center" class="table1">
      <tr> 
        <td colspan="2" class="title1">ѡ��¼�����У�ļ���</td>
      </tr>
      <tr> 
        <td width="147"><div align="right"> 
            <input type="checkbox" name="chkTitle" value="checkbox">
            �������ƣ�</div></td>
        <td width="439"><input name="txtTitle" type="text" size="40"></td>
      </tr>
      <tr> 
        <td><div align="right"> 
            <input type="checkbox" name="chkPerson" value="checkbox">
            ¼����Ա��</div></td>
        <td><input type="text" name="txtPerson"></td>
      </tr>
      <tr> 
        <td height="21"> <div align="right"> 
            <input type="checkbox" name="chkDate" value="checkbox">
            ¼�����ڣ�</div></td>
        <td><select name="comDate">
            <option value="&lt;" selected>����</option>
            <option value="=">��ֵ</option>
            <option value="&gt;">����</option>
          </select> <input type="text" name="txtDate">
          (YYYY-MM-DD)</td>
      </tr>
      <tr> 
        <td height="21"><div align="right"> 
            <input type="checkbox" name="chkLabel" value="checkbox">
            ״̬��־��</div></td>
        <td><select name="txtLabel">
			<option value="WJG:">δ�ӹ�</option>
            <option value="WWC:">δ���</option>
            <option value="YSC:">Ӧɾ��</option>
            <option value="YWC:">�����</option>
            <option value="YSJ:">����У</option>
			<option value="YZS:">������</option>
          </select>
          <input type="text" name="txtLabelend"></td>
      </tr>
      <tr> 
        <td height="21"> <div align="right"> 
            <input type="checkbox" name="chkState" value="checkbox">
            �ӹ�״̬��</div></td>
        <td><select name="txtState">
            <option value="0" selected>δ�ӹ�</option>
            <option value="1">�Ѽӹ�</option>
            <option value="2">�ѳ���</option>
          </select></td>
      </tr>
      <tr> 
        <td><div align="right"> 
            <input type="checkbox" name="chkUnit" value="checkbox">
            �ӹ���λ��</div></td>
        <td><select name="txtUnit">
            <option value="����">����</option>
			<option value="����">����</option>
            <option value="����1">����1</option>
            <option value="����2">����2</option>
            <option value="������">������</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="�Ͼ�">�Ͼ�</option>
            <option value="ɽ��">ɽ��</option>
            <option value="����">����</option>
            <option value="�Ϻ�">�Ϻ�</option>
            <option value="����ҩ">����ҩ</option>
            <option value="����ҽ">����ҽ</option>
            <option value="�㽭">�㽭</option>
            <option value="����">����</option>
			<option value="�پ�">�پ�</option>
			<option value="�ӱ�">�ӱ�</option>			
            <option value="δ����">δ����</option>
          </select></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
		<input name="chkReverse" type="radio" value="yes" checked>��������ѡ������
		<input name="chkReverse" type="radio" value="no">����������ѡ������(����)</div></td>
      </tr>
      <tr> 
        <td colspan="2"><div align="center"> 
            <input name="OK" type="button" class="button1" value="ȷ��" onClick="return OKOnclick()">
            <input name="Cancel" type="reset" class="button1" value="ȡ��">
            <input name="Condition" type="hidden" value="">
          </div></td>
      </tr>
    </table>
</form>
</center>
<hr color="#6699CC">
<center><BR><FONT size=2>TCM Online Co. Ltd.</FONT></center>
<SCRIPT language=JavaScript src="fresh/connect.js"></SCRIPT>
<SCRIPT language=JavaScript>
	createConnect("connectForClinic");
</SCRIPT>
</body>
</html>
