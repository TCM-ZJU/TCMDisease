<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ü�¼�����Ӻͼ�¼��Ϣ</title></title>
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function viewClick()
{
	formView.submit();
}
	
function UpdateRecord()
{
	if(confirm("ȷ��Ҫ���¼�¼��״̬��Ϣô?"))
		return true;
	else
		return false;
}
//-->
</script>
</head>

<body class="body">
<%
	dim JBMC
	dim JGDW
	dim LRRY
	JBMC=request("JBMC")
	JGDW=request("JGDW")
	LRRY=request("LRRY")
	dim ZTBZ
	ZTBZ=request("ZTBZ")
	dim ZTBZH
	dim ZTBZE
	ZTBZH=left(ZTBZ,4)
	if len(ZTBZ)-4>0 then
		ZTBZE=right(ZTBZ,len(ZTBZ)-4)
	end if
%>
<table width="800" border="0" align="center" class="table2">
	<tr><td height="22" colspan="3" class="title1"><div align="center">�ü�¼�������</div></td></tr>
	<tr>
	  <td width="133" height="22" class="title1">��¼�������ƣ�</td>
      <td width="554" ><%=request("JBMC")%></td>
      <td width="95" class="title1">���м�¼��</td>
  </tr>
	<tr>
	  <td rowspan="9"><table border="1" bordercolor="#000000">
	    <tr><td><div align="center">������Ϣ������:</div></td></tr></table></td>
	  		<td ><a href="mainInfo.asp?JBID=<%=request("JBID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">����������Ϣ</a></td>
  	        <td ><div align="center">1</div></td>
	</tr>
<%
	dim strSQL
	strSQL="select count(*) from C_ZhenH where JBMC='"&JBMC&"'"
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	dim recordNum
	recordNum = oraRS.fields(0).value
%>
	<tr>
	  <td><a  href="symptomInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">֤����Ϣ</a></td>
      <td><div align="center"><%=recordNum%></div></td>
	</tr>
<%
	strSQL="select count(*) from C_ZhongYBY where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = int(oraRS.fields(0).value)
	strSQL="select count(*) from C_XiYBY where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
%>
    <tr><td><a href="pathogenyInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">������Ϣ</a></td>
      <td><div align="center"><%=recordNum%></div></td>
    </tr>
<%
	strSQL="select count(*) from C_ZhongYBJ where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = int(oraRS.fields(0).value)
	strSQL="select count(*) from C_XiYBJ where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
%>
    <tr><td><a href="pathologyInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">������Ϣ</a></td>
      <td><div align="center"><%=recordNum%></div></td>
    </tr>	
<%
	strSQL="select count(*) from C_ZhenDFF where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = oraRS.fields(0).value
%>
    <tr><td><a href="diagnoseInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">��Ϸ�����Ϣ</a></td>
      <td><div align="center"><%=recordNum%></div></td>
    </tr>
<%
	strSQL="select count(*) from C_KangF where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = int(oraRS.fields(0).value)
	strSQL="select count(*) from C_YuF where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
	strSQL="select count(*) from C_YuH where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
	strSQL="select count(*) from C_LiaoX where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
%>
    <tr>
      <td><a href="healingInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">����Ԥ��Ԥ����Ч��Ϣ</a></td>
      <td><div align="center"><%=recordNum%></div></td>
    </tr>
<%
	strSQL="select count(*) from C_ZhenDBZ where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = int(oraRS.fields(0).value)
	strSQL="select count(*) from C_LiaoXBZ where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
%>
    <tr>
      <td><a href="standardInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">�����Ч��׼��Ϣ</a></td>
      <td><div align="center"><%=recordNum%></div></td>
    </tr>
<%
	strSQL="select count(*) from C_ChuC where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = oraRS.fields(0).value
%>
    <tr>
      <td><a href="derivationInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">������Ϣ</a></td>
      <td><div align="center"><%=recordNum%></div></td>
    </tr>
<%
	strSQL="select count(*) from C_ZhongYZL where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = int(oraRS.fields(0).value)
	strSQL="select count(*) from C_ZhenJZL where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
	strSQL="select count(*) from C_AnMZL where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
	strSQL="select count(*) from C_ZhengGZL where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
	strSQL="select count(*) from C_XiYZL where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
	strSQL="select count(*) from C_QiTZL where JBMC='"&JBMC&"'"
	oraRS.close
	set oraRS= oraDB.CreateDynaset(strSQL,0)
	recordNum = recordNum+int(oraRS.fields(0).value)
	
	oraRS.close
	set oraRS = nothing
%>
    <tr>
      <td><a href="cureInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>">������Ϣ</a></td>
      <td><div align="center"><%=recordNum%></div></td>
    </tr>
	<tr>
	  <td height="22" colspan="3" class="title1">��¼״̬��Ϣ</td>
	</tr>
	<tr><td  colspan="3">
	<form action="updateRecordInfo.asp?JBID=<%=request("JBID")%>&BJZT=<%=request("BJZT")%>>" method="post">
		<table border="1" bordercolor="#000000">
		<tr>
		<td width="92">״̬��־�� 
              <select name="txtGDZT">
			  	<option value="WJG:" <%if ZTBZH="WJG:" then response.Write("selected")%>>δ�ӹ�</option>
                <option value="WWC:" <%if ZTBZH="WWC:" then response.Write("selected")%>>δ���</option>
                <option value="YSC:" <%if ZTBZH="YSC:" then response.Write("selected")%>>Ӧɾ��</option>
                <option value="YWC:" <%if ZTBZH="YWC:" then response.Write("selected")%>>�����</option>
                <option value="YSJ:" <%if ZTBZH="YSJ:" then response.Write("selected")%>>����У</option>
				<option value="YZS:" <%if ZTBZH="YZS:" then response.Write("selected")%>>������</option>
          </select>		</td>
		<td width="293">���ɣ� 
              <textarea name="txtZYZT" cols="40"><%=ZTBZE%></textarea>
		</td>
		<td width="88">�ӹ���λ��<%=JGDW%></td>
		<td width="289">¼����Ա��<input name="txtLRRY" type="text" value="<%=LRRY%>"></td>
		</tr>
		<tr><td height="22" colspan="4"><div align="center">
		  <input type="submit" name="Submit" value="���¼�¼״̬��Ϣ" onClick="return UpdateRecord()">
		</div></td></tr>
	  </table>
	</form>
	</td></tr>
</table>

<form name="formView" action="view.asp" method="post" target="_blank">
	<input type="hidden" name="ID" value="<%=request("JBID")%>">
</form>
<center>
<a href="javascript:history.go(-1)">����</a>
</center>
</body>
</html>
