<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ɾ�����Ƽ�¼</title>
</head>

<body>
<%
	dim ID
	ID=request("ID")
	dim BJZT
	BJZT=request("BJZT")
	
	dim strSQL
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	
	'����
	if request("Type")=0 then
		strSQL="delete from C_KangF where ID="&ID
	end if
	'Ԥ��
	if request("Type")=1 then
		strSQL="delete from C_YuF where ID="&ID
	end if
	'Ԥ��
	if request("Type")=2 then
		strSQL="delete from C_YuH where ID="&ID
	end if
	'��Ч
	if request("Type")=3 then
		strSQL="delete from C_LiaoX where ID="&ID
	end if
	
	oraDB.BeginTrans
	oraDB.ExecuteSQL(strSQL)
	if Err.Number=0 then
		oraDB.CommitTrans
	else
		oraDB.Rollback
	end if
	
	oraDB.close
	set oraDB=nothing
	response.Redirect("healingInfo.asp?JBMC="&request("JBMC")&"&BJZT="&BJZT)
%>
</body>
</html>
