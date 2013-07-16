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
	
	'中医病因
	if request("Type")=0 then
		strSQL="select * from C_ZhongYBY where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("BYMC").value=request.form("txtBYMC")
		oraRS.fields("ZBTD").value=request.form("txtZBTD")
		oraRS.fields("ZBTJ").value=request.form("txtZBTJ")
		oraRS.fields("ZH").value=request.form("txtZH")
		oraRS.fields("XZ").value=request.form("txtXZ")
		oraRS.fields("ZZ").value=request.form("txtZZ")
		oraRS.fields("BJ").value=request.form("txtBJ")
		oraRS.fields("QTZBYS").value=request.form("txtQTZBYS")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'西医病因
	if request("Type")=1 then
		strSQL="select * from C_XiYBY where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("BYMC").value=request.form("txtBYMC")
		oraRS.fields("ZBTD").value=request.form("txtZBTD")
		oraRS.fields("ZZ").value=request.form("txtZZ")
		oraRS.fields("BJ").value=request.form("txtBJ")
		oraRS.fields("CRY").value=request.form("txtCRY")
		oraRS.fields("CRTJ").value=request.form("txtCRTJ")
		oraRS.fields("FBDQ").value=request.form("txtFBDQ")
		oraRS.fields("FBNL").value=request.form("txtFBNL")
		oraRS.fields("FBL").value=request.form("txtFBL")
		oraRS.fields("FBXGYS").value=request.form("txtFBXGYS")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	response.Redirect("pathogenyInfo.asp?JBMC="&request("JBMC")&"&BJZT="&BJZT)
%>
</body>
</html>
