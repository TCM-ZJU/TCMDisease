<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���²�֤֢��¼</title>
</head>

<body>
<%
	dim ID
	ID=request("ID")
	dim BJZT
	BJZT=request("BJZT")
	
	dim strSQL
	strSQL="select * from C_ZhenH where ID="&ID
	
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	
	oraRS.Edit
	oraRS.fields("ZHMC").value=request.form("txtZHMC")
	oraRS.fields("ZHLX").value=request.form("txtZHLX")
	oraRS.fields("BJMC").value=request.form("txtBJMC")
	oraRS.fields("ZZMC").value=request.form("txtZZMC")
	oraRS.fields("BZ").value=request.form("txtBZ")
	oraRS.fields("BJZT").value=BJZT
	
	oraRS.Update
	
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	response.Redirect("symptomInfo.asp?JBMC="&request("JBMC")&"&BJZT="&BJZT)
%>
</body>
</html>
