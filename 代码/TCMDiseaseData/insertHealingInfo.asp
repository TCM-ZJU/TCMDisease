<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������Ʋ�����Ϣ</title>
</head>

<body>
<%
	dim JBMC
	JBMC=request("JBMC")
	dim BJZT
	BJZT=request("BJZT")
	
	dim strSQL
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	
	dim colfield
	dim colvalue
	'����
	if request.form("JLLX")=0 then
		colfield=" ( ID,JBMC,KFFF,FFMS,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtKFFF")&"'"
		colvalue=colvalue&",'"&request.form("txtFFMS")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_KangF"&colfield&" values"&colvalue
	end if
	'Ԥ��
	if request.form("JLLX")=1 then
		colfield=" ( ID,JBMC,YFFF,FFMS,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtYFFF")&"'"
		colvalue=colvalue&",'"&request.form("txtFFMS")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_YuF"&colfield&"values"&colvalue
	end if
	'Ԥ��
	if request.form("JLLX")=2 then
		colfield=" ( ID,JBMC,YHMS,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtYHMS")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_YuH"&colfield&"values"&colvalue
	end if
	'��Ч
	if request.form("JLLX")=3 then
		colfield=" ( ID,JBMC,PDFF,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtPDFF")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_LiaoX"&colfield&"values"&colvalue
	end if
	
	oraDB.BeginTrans
	oraDB.ExecuteSQL(strSQL)
	oraDB.CommitTrans
	
	oraDB.close
	set oraDB=nothing
	
	response.Redirect("healingInfo.asp?JBMC="&JBMC&"&BJZT="&BJZT)
%>
</body>
</html>
