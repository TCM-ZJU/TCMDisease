<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<title>Ȩ�޼��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
	dim ID
	ID=request.Form("JBID")
	dim user
	user=Session("UserAccount")
	dim strSQL
	strSQL="select JBMC,BJZT,LRRY,LRRQ,JGDW,ZTBZ from C_JiB where ID="&ID
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	dim JBMC
	dim LRuser
	dim LRUnit
	dim ZTBZ
	JBMC=oraRS.fields("JBMC").value
	LRuser=oraRS.fields("LRRY").value
	LRUnit=oraRS.fields("JGDW").value
	ZTBZ=oraRS.fields("ZTBZ").value
	
	dim strSQLT
	dim oraRST
	strSQLT="select CLEVEL,DESCRIPTION from CUSER where CUSER='"&user&"'"
	set oraRST=oraDB.CreateDynaset(strSQLT,0)
	dim Unit
	dim Authority
	Unit=oraRST.fields("DESCRIPTION").value
	Authority=oraRST.fields("CLEVEL").value
	oraRST.close
	set oraRST=nothing
	
	if request.Form("Type")=0 then 
		if oraRS.fields("BJZT").value>=2 then
			oraRS.close
			set oraRS=nothing
			oraDB.close
			set oraDB=nothing
%>
	����Ȩ�ӹ�����У�����ݼ�¼
	<a href="javascript:history.go(-1)">����</a>	
<%		
		else 
			if Unit<>LRUnit and Unit<>"������" then
				oraRS.close
				set oraRS=nothing
				oraDB.close
				set oraDB=nothing
%>
	����Ȩ�ӹ�������λ�ӹ������ݼ�¼
	<a href="javascript:history.go(-1)">����</a>
<%
			else
					
				if  not IsNull(oraRS.fields("LRRY").value) then
					if oraRS.fields("LRRY").value=user then
						oraRS.close
						set oraRS=nothing
						oraDB.close
						set oraDB=nothing
						response.Redirect("recordInfo.asp?JBID="&ID&"&JBMC="&JBMC&"&BJZT=1&JGDW="&LRUnit&"&LRRY="&LRuser&"&ZTBZ="&ZTBZ)
					else
						oraRS.close
						set oraRS=nothing
						oraDB.close
						set oraDB=nothing
%>
	����Ȩ�ӹ����˼ӹ������ݼ�¼
	<a href="javascript:history.go(-1)">����</a>
<%					
					end if
				else
					oraRS.close
					set oraRS=nothing
					oraDB.close
					set oraDB=nothing
					response.Redirect("recordInfo.asp?JBID="&ID&"&JBMC="&JBMC&"&BJZT=1&JGDW="&LRUnit&"&LRRY="&user&"&ZTBZ="&ZTBZ)
				end if
			end if
		end if
	else
		if Authority=0 then
			oraRS.close
			set oraRS=nothing
			oraDB.close
			set oraDB=nothing
%>
	����Ȩ��У���ݼ�¼
	<a href="javascript:history.go(-1)">����</a>
<%
		else
			if oraRS.fields("BJZT").value>=3 then
				oraRS.close
				set oraRS=nothing
				oraDB.close
				set oraDB=nothing
%>
	����Ȩ��У����������ݼ�¼
	<a href="javascript:history.go(-1)">����</a>
<%
			else
				if Unit<>LRUnit and Unit<>"������" then	
					oraRS.close
					set oraRS=nothing
					oraDB.close
					set oraDB=nothing
%>
	����Ȩ��У������λ�ӹ������ݼ�¼
	<a href="javascript:history.go(-1)">����</a>
<%
				else
					oraRS.close
					set oraRS=nothing
					oraDB.close
					set oraDB=nothing
					response.Redirect("recordInfo.asp?JBID="&ID&"&JBMC="&JBMC&"&BJZT=2&JGDW="&LRUnit&"&LRRY="&LRuser&"&ZTBZ="&ZTBZ)
				end if
			end if
		end if
	end if	
%>
</body>
</html>
