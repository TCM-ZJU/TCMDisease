<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ӳ�֤֢��¼</title>
</head>

<body>
<%
	dim JBMC
	JBMC=request("JBMC")
	dim BJZT
	BJZT=request("BJZT")
	
	dim strSQL
	strSQL="insert into C_ChuC( ID,JBMC,ZZ,ZZDW,CBS,CBLX,MC,DD,SJ,BZ,BJZT ) values"
	strSQL=strSQL&"( -1,'"&JBMC&"','"&request.Form("txtZZ")&"','"&request.Form("txtZZDW")&"','"&request.Form("txtCBS")&"','"&request.Form("txtCBLX")&"','"&request.Form("txtMC")&"','"&request.Form("txtDD")&"','"&request.Form("txtSJ")&"','"&request.Form("txtBZ")&"',"&BJZT&")"
	'response.Write(strSQL)
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	
	oraDB.BeginTrans
	oraDB.ExecuteSQL(strSQL)
	oraDB.CommitTrans
	
	oraDB.close
	set oraDB=nothing
	response.Redirect("derivationInfo.asp?JBMC="&JBMC&"&BJZT="&BJZT)
%>
</body>
</html>
