<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>更新治疗步骤信息</title>
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
	dim oraRS 
	
	'诊断标准
	if request("Type")=0 then
		strSQL="select * from C_ZhenDBZ where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("BZMC").value=request.form("txtBZMC")
		oraRS.fields("BZJBFL").value=request.form("txtBZJBFL")
		oraRS.fields("BZDM").value=request.form("txtBZDM")
		oraRS.fields("BZZDRQ").value=request.form("txtBZZDRQ")
		oraRS.fields("BZQCDW").value=request.form("txtBZQCDW")
		oraRS.fields("BZRDJSWYH").value=request.form("txtBZRDJSWYH")
		oraRS.fields("BZJZDW").value=request.form("txtBZJZDW")
		oraRS.fields("BLXZBZ").value=request.form("txtBLXZBZ")
		oraRS.fields("BYXFXBZ").value=request.form("txtBYXFXBZ")
		oraRS.fields("LCFXBZ").value=request.form("txtLCFXBZ")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'疗效标准
	if request("Type")=1 then
		strSQL="select * from C_LiaoXBZ where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("BZMC").value=request.form("txtBZMC")
		oraRS.fields("BZJBFL").value=request.form("txtBZJBFL")
		oraRS.fields("BZDM").value=request.form("txtBZDM")
		oraRS.fields("BZZDRQ").value=request.form("txtBZZDRQ")
		oraRS.fields("BZQCDW").value=request.form("txtBZQCDW")
		oraRS.fields("BZRDJSWYH").value=request.form("txtBZRDJSWYH")
		oraRS.fields("BZJZDW").value=request.form("txtBZJZDW")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	response.Redirect("standardInfo.asp?JBMC="&request("JBMC")&"&BJZT="&BJZT)
%>
</body>
</html>
