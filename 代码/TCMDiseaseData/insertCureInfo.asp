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
	'中药治疗
	if request.form("ZLLX")=0 then
		colfield=" ( ID,JBMC,ZHMC,FM,YFJX,GYFS,ZZ,YWXX,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtZHMC")&"'"
		colvalue=colvalue&",'"&request.form("txtFM")&"'"
		colvalue=colvalue&",'"&request.form("txtYFJX")&"'"
		colvalue=colvalue&",'"&request.form("txtGYFS")&"'"
		colvalue=colvalue&",'"&request.form("txtZZ")&"'"
		colvalue=colvalue&",'"&request.form("txtYWXX")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_ZhongYZL"&colfield&" values"&colvalue
	end if
	'针灸治疗
	if request.form("ZLLX")=1 then
		colfield=" ( ID,JBMC,ZHMC,SF,FF,QX,CS,JL,ZX,CX,ZZ,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtZHMC")&"'"
		colvalue=colvalue&",'"&request.form("txtSF")&"'"
		colvalue=colvalue&",'"&request.form("txtFF")&"'"
		colvalue=colvalue&",'"&request.form("txtQX")&"'"
		colvalue=colvalue&",'"&request.form("txtCS")&"'"
		colvalue=colvalue&",'"&request.form("txtJL")&"'"
		colvalue=colvalue&",'"&request.form("txtZX")&"'"
		colvalue=colvalue&",'"&request.form("txtCX")&"'"
		colvalue=colvalue&",'"&request.form("txtZZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_ZhenJZL"&colfield&"values"&colvalue
	end if
	'按摩治疗
	if request.form("ZLLX")=2 then
		colfield=" ( ID,JBMC,ZHMC,SF,FF,SJ,CS,JL,ZX,CX,ZZ,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtZHMC")&"'"
		colvalue=colvalue&",'"&request.form("txtSF")&"'"
		colvalue=colvalue&",'"&request.form("txtFF")&"'"
		colvalue=colvalue&",'"&request.form("txtSJ")&"'"
		colvalue=colvalue&",'"&request.form("txtCS")&"'"
		colvalue=colvalue&",'"&request.form("txtJL")&"'"
		colvalue=colvalue&",'"&request.form("txtZX")&"'"
		colvalue=colvalue&",'"&request.form("txtCX")&"'"
		colvalue=colvalue&",'"&request.form("txtZZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_AnMZL"&colfield&"values"&colvalue
	end if
	'正骨治疗
	if request.form("ZLLX")=3 then
		colfield=" ( ID,JBMC,ZHMC,SF,FF,SJ,CS,ZZ,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtZHMC")&"'"
		colvalue=colvalue&",'"&request.form("txtSF")&"'"
		colvalue=colvalue&",'"&request.form("txtFF")&"'"
		colvalue=colvalue&",'"&request.form("txtSJ")&"'"
		colvalue=colvalue&",'"&request.form("txtCS")&"'"
		colvalue=colvalue&",'"&request.form("txtZZ")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_ZhengGZL"&colfield&"values"&colvalue
	end if
	'西药治疗
	if request.form("ZLLX")=4 then
		colfield=" ( ID,JBMC,YWMC,YWJX,GYFS,GYSJ,YWCFXX,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtYWMC")&"'"
		colvalue=colvalue&",'"&request.form("txtYWJX")&"'"
		colvalue=colvalue&",'"&request.form("txtGYFS")&"'"
		colvalue=colvalue&",'"&request.form("txtGYSJ")&"'"
		colvalue=colvalue&",'"&request.form("txtYWCFXX")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_XiYZL"&colfield&"values"&colvalue
	end if
	'其他治疗
	if request.form("ZLLX")=5 then
		colfield=" ( ID,JBMC,LFMS,BZ,BJZT) "
		colvalue=" ( -1,'"&JBMC&"','"&request.form("txtLFMS")&"'"
		colvalue=colvalue&",'"&request.form("txtBZ")&"',"&BJZT&") "
		strSQL="insert into C_QiTZL"&colfield&"values"&colvalue
	end if
	
	oraDB.BeginTrans
	oraDB.ExecuteSQL(strSQL)
	oraDB.CommitTrans
	
	oraDB.close
	set oraDB=nothing
	
	response.Redirect("cureInfo.asp?JBMC="&JBMC&"&BJZT="&BJZT)
%>
</body>
</html>
