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
	
	'中药治疗
	if request("Type")=0 then
		strSQL="select * from C_ZhongYZL where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("ZHMC").value=request.form("txtZHMC")
		oraRS.fields("FM").value=request.form("txtFM")
		oraRS.fields("YFJX").value=request.form("txtYFJX")
		oraRS.fields("GYFS").value=request.form("txtGYFS")
		oraRS.fields("ZZ").value=request.form("txtZZ")
		oraRS.fields("YWXX").value=request.form("txtYWXX")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'针灸治疗
	if request("Type")=1 then
		strSQL="select * from C_ZhenJZL where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("ZHMC").value=request.form("txtZHMC")
		oraRS.fields("SF").value=request.form("txtSF")
		oraRS.fields("FF").value=request.form("txtFF")
		oraRS.fields("QX").value=request.form("txtQX")
		oraRS.fields("CS").value=request.form("txtCS")
		oraRS.fields("JL").value=request.form("txtJL")
		oraRS.fields("ZX").value=request.form("txtZX")
		oraRS.fields("CX").value=request.form("txtCX")
		oraRS.fields("ZZ").value=request.form("txtZZ")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'按摩治疗
	if request("Type")=2 then
		strSQL="select * from C_AnMZL where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("ZHMC").value=request.form("txtZHMC")
		oraRS.fields("SF").value=request.form("txtSF")
		oraRS.fields("FF").value=request.form("txtFF")
		oraRS.fields("SJ").value=request.form("txtSJ")
		oraRS.fields("CS").value=request.form("txtCS")
		oraRS.fields("JL").value=request.form("txtJL")
		oraRS.fields("ZX").value=request.form("txtZX")
		oraRS.fields("CX").value=request.form("txtCX")
		oraRS.fields("ZZ").value=request.form("txtZZ")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'正骨治疗
	if request("Type")=3 then
		strSQL="select * from C_ZhengGZL where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("ZHMC").value=request.form("txtZHMC")
		oraRS.fields("SF").value=request.form("txtSF")
		oraRS.fields("FF").value=request.form("txtFF")
		oraRS.fields("SJ").value=request.form("txtSJ")
		oraRS.fields("CS").value=request.form("txtCS")
		oraRS.fields("ZZ").value=request.form("txtZZ")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'西药治疗
	if request("Type")=4 then
		strSQL="select * from C_XiYZL where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("YWMC").value=request.form("txtYWMC")
		oraRS.fields("YWJX").value=request.form("txtYWJX")
		oraRS.fields("GYFS").value=request.form("txtGYFS")
		oraRS.fields("GYSJ").value=request.form("txtGYSJ")
		oraRS.fields("YWCFXX").value=request.form("txtYWCFXX")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	'其它治疗
	if request("Type")=5 then
		strSQL="select * from C_QiTZL where ID="&ID
		set oraRS=oraDB.CreateDynaset(strSQL,0)
		oraRS.Edit
		oraRS.fields("LFMS").value=request.form("txtLFMS")
		oraRS.fields("BZ").value=request.form("txtBZ")
		oraRS.fields("BJZT").value=BJZT
		oraRS.Update
	end if
	
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	response.Redirect("cureInfo.asp?JBMC="&request("JBMC")&"&BJZT="&BJZT)
%>
</body>
</html>
