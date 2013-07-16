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
	
	'中医病机
	if request("Type")=0 then
		strSQL="select * from C_ZhongYBJ where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("BJMC").value=request.form("txtBJMC")
		oraRS.fields("BW").value=request.form("txtBW")
		oraRS.fields("XZ").value=request.form("txtXZ")
		oraRS.fields("TD").value=request.form("txtTD")
		oraRS.fields("ZH").value=request.form("txtZH")
		oraRS.fields("ZHMC").value=request.form("txtZHMC")
		oraRS.fields("ZZ").value=request.form("txtZZ")
		oraRS.fields("BYXX").value=request.form("txtBYXX")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'西医病机
	if request("Type")=1 then
		strSQL="select * from C_XiYBJ where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("FBJL").value=request.form("txtFBJL")
		oraRS.fields("BLSL").value=request.form("txtBLSL")
		oraRS.fields("ZZ").value=request.form("txtZZ")
		oraRS.fields("BYXX").value=request.form("txtBYXX")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	response.Redirect("pathologyInfo.asp?JBMC="&request("JBMC")&"&BJZT="&BJZT)
%>
</body>
</html>
