<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>更新记录状态信息</title>
</head>

<body>
<%
	dim ID
	ID=request("JBID")
	dim BJZT
	BJZT=request("BJZT")
	
	dim strSQL
	strSQL="select JBMC,LRRY,JGDW,ZTBZ from C_JiB where ID="&ID
	
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	
	dim JBMC
	dim LRuser
	dim LRUnit
	dim ZTBZ
	
	JBMC=oraRS.fields("JBMC").value
	LRuser=request.form("txtLRRY")
	LRUnit=oraRS.fields("JGDW").value
	ZTBZ=request.form("txtGDZT")&request.form("txtZYZT")
	dim user
	user=Session("UserAccount")
	
	oraRS.Edit
	oraRS.fields("ZTBZ").value=ZTBZ
	oraRS.Update
	
	if  IsNull(oraRS.fields("LRRY")) then
		oraDB.BeginTrans
		strSQL="update C_JiB set LRRY='" & LRuser & "',LRRQ=SYSDATE where ID="&ID
		oraDB.ExecuteSQL(strSQL)
		oraDB.CommitTrans
	end if
	
	oraRS.close
	set oraRS=nothing
	oraDB.close
	set oraDB=nothing
	response.Redirect("recordInfo.asp?JBID="&ID&"&JBMC="&JBMC&"&BJZT="&BJZT&"&JGDW="&LRUnit&"&LRRY="&LRuser&"&ZTBZ="&ZTBZ)
	
%>
</body>
</html>
