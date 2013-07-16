<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>更新病证症记录</title>
</head>

<body>
<%
	dim ID
	ID=request("ID")
	dim BJZT
	BJZT=request("BJZT")
	
	dim strSQL
	strSQL="select * from C_ChuC where ID="&ID
	
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	
	oraRS.Edit
	oraRS.fields("ZZ").value=request.form("txtZZ")
	oraRS.fields("ZZDW").value=request.form("txtZZDW")
	oraRS.fields("CBS").value=request.form("txtCBS")
	oraRS.fields("CBLX").value=request.form("txtCBLX")
	oraRS.fields("MC").value=request.form("txtMC")
	oraRS.fields("DD").value=request.form("txtDD")
	oraRS.fields("SJ").value=request.form("txtSJ")
	oraRS.fields("BZ").value=request.form("txtBZ")
	oraRS.fields("BJZT").value=BJZT
	
	oraRS.Update
	
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	response.Redirect("derivationInfo.asp?JBMC="&request("JBMC")&"&BJZT="&BJZT)
%>
</body>
</html>
