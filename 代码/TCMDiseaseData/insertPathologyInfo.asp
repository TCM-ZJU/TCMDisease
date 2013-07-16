<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>插入治疗步骤信息</title>
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
	'中医病机
	if request.form("BJLX")=0 then
		colfield=" ( ID,JBMC,BJMC,BW,XZ,TD,ZH,ZHMC,ZZ,BYXX,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtBJMC")&"'"
		colvalue=colvalue&",'"&request.form("txtBW")&"'"
		colvalue=colvalue&",'"&request.form("txtXZ")&"'"
		colvalue=colvalue&",'"&request.form("txtTD")&"'"
		colvalue=colvalue&",'"&request.form("txtZH")&"'"
		colvalue=colvalue&",'"&request.form("txtZHMC")&"'"
		colvalue=colvalue&",'"&request.form("txtZZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBYXX")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_ZhongYBJ"&colfield&" values"&colvalue
	end if
	'西医病机
	if request.form("BJLX")=1 then
		colfield=" ( ID,JBMC,FBJL,BLSL,ZZ,BYXX,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtFBJL")&"'"
		colvalue=colvalue&",'"&request.form("txtBLSL")&"'"
		colvalue=colvalue&",'"&request.form("txtZZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBYXX")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_XiYBJ"&colfield&"values"&colvalue
	end if
	
	oraDB.BeginTrans
	oraDB.ExecuteSQL(strSQL)
	oraDB.CommitTrans
	
	oraDB.close
	set oraDB=nothing
	
	response.Redirect("pathologyInfo.asp?JBMC="&JBMC&"&BJZT="&BJZT)
%>
</body>
</html>
