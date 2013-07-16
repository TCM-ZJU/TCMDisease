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
	
	'康复
	if request("Type")=0 then
		strSQL="select * from C_KangF where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("KFFF").value=request.form("txtKFFF")
		oraRS.fields("FFMS").value=request.form("txtFFMS")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'预防
	if request("Type")=1 then
		strSQL="select * from C_YuF where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("YFFF").value=request.form("txtYFFF")
		oraRS.fields("FFMS").value=request.form("txtFFMS")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'预后
	if request("Type")=2 then
		strSQL="select * from C_YuH where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("YHMS").value=request.form("txtYHMS")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'预后
	if request("Type")=3 then
		strSQL="select * from C_LiaoX where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("PDFF").value=request.form("txtPDFF")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	response.Redirect("healingInfo.asp?JBMC="&request("JBMC")&"&BJZT="&BJZT)
%>
</body>
</html>
