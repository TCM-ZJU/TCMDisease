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
	'中医病因
	if request.form("BYLX")=0 then
		colfield=" ( ID,JBMC,BYMC,ZBTD,ZBTJ,ZH,XZ,ZZ,BJ,QTZBYS,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtBYMC")&"'"
		colvalue=colvalue&",'"&request.form("txtZBTD")&"'"
		colvalue=colvalue&",'"&request.form("txtZBTJ")&"'"
		colvalue=colvalue&",'"&request.form("txtZH")&"'"
		colvalue=colvalue&",'"&request.form("txtXZ")&"'"
		colvalue=colvalue&",'"&request.form("txtZZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBJ")&"'"
		colvalue=colvalue&",'"&request.form("txtQTZBYS")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_ZhongYBY"&colfield&" values"&colvalue
	end if
	'西医病因
	if request.form("BYLX")=1 then
		colfield=" ( ID,JBMC,BYMC,ZBTD,ZZ,BJ,CRY,CRTJ,FBDQ,FBNL,FBL,FBXGYS,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtBYMC")&"'"
		colvalue=colvalue&",'"&request.form("txtZBTD")&"'"
		colvalue=colvalue&",'"&request.form("txtZZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBJ")&"'"
		colvalue=colvalue&",'"&request.form("txtCRY")&"'"
		colvalue=colvalue&",'"&request.form("txtCRTJ")&"'"
		colvalue=colvalue&",'"&request.form("txtFBDQ")&"'"
		colvalue=colvalue&",'"&request.form("txtFBNL")&"'"
		colvalue=colvalue&",'"&request.form("txtFBL")&"'"
		colvalue=colvalue&",'"&request.form("txtFBXGYS")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_XiYBY"&colfield&"values"&colvalue
	end if
	
	oraDB.BeginTrans
	oraDB.ExecuteSQL(strSQL)
	oraDB.CommitTrans
	
	oraDB.close
	set oraDB=nothing
	
	response.Redirect("pathogenyInfo.asp?JBMC="&JBMC&"&BJZT="&BJZT)
%>
</body>
</html>
