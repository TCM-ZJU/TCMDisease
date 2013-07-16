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
	'诊断标准
	if request.form("BZLX")=0 then
		colfield=" ( ID,JBMC,BZMC,BZJBFL,BZDM,BZZDRQ,BZQCDW,BZRDJSWYH,BZJZDW,BLXZBZ,BYXFXBZ,LCFXBZ,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtBZMC")&"'"
		colvalue=colvalue&",'"&request.form("txtBZJBFL")&"'"
		colvalue=colvalue&",'"&request.form("txtBZDM")&"'"
		colvalue=colvalue&",'"&request.form("txtBZZDRQ")&"'"
		colvalue=colvalue&",'"&request.form("txtBZQCDW")&"'"
		colvalue=colvalue&",'"&request.form("txtBZRDJSWYH")&"'"
		colvalue=colvalue&",'"&request.form("txtBZJZDW")&"'"
		colvalue=colvalue&",'"&request.form("txtBLXZBZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBYXFXBZ")&"'"
		colvalue=colvalue&",'"&request.form("txtLCFXBZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_ZhenDBZ"&colfield&" values"&colvalue
	end if
	'疗效标准
	if request.form("BZLX")=1 then
		colfield=" ( ID,JBMC,BZMC,BZJBFL,BZDM,BZZDRQ,BZQCDW,BZRDJSWYH,BZJZDW,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtBZMC")&"'"
		colvalue=colvalue&",'"&request.form("txtBZJBFL")&"'"
		colvalue=colvalue&",'"&request.form("txtBZDM")&"'"
		colvalue=colvalue&",'"&request.form("txtBZZDRQ")&"'"
		colvalue=colvalue&",'"&request.form("txtBZQCDW")&"'"
		colvalue=colvalue&",'"&request.form("txtBZRDJSWYH")&"'"
		colvalue=colvalue&",'"&request.form("txtBZJZDW")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_LiaoXBZ"&colfield&"values"&colvalue
	end if
	
	oraDB.BeginTrans
	oraDB.ExecuteSQL(strSQL)
	oraDB.CommitTrans
	
	oraDB.close
	set oraDB=nothing
	
	response.Redirect("standardInfo.asp?JBMC="&JBMC&"&BJZT="&BJZT)
%>
</body>
</html>
