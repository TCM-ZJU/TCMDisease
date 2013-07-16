<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>治疗信息加工页面</title>
<link href="common.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!--
	function windowOnload(stepnum) 
    {			 
		inputShow(stepnum);		
	}
	function inputShow(stepnum)
	{
		var str;
		if (stepnum !=-1)
			str="div"+stepnum;
		else
			str="div" + document.forms("formCont").BZLX[document.forms("formCont").BZLX.selectedIndex].value;
		eval("inputCont.innerHTML="+str+".innerHTML");
	}
	
function AddNewRecord()
{
	if(confirm("确定要加入新记录么?"))
	{
		if (document.forms("formCont").txtBZMC.value=="")
		{
			alert("标准名称不能为空!");
			return false;
		}
		return true;
	}
	else
		return false;
}
function UpdateRecord(num)
{
	if(confirm("确定要更新记录么?"))
	{
		if (document.forms(num).txtBZMC.value=="")
		{
			alert("标准名称不能为空!");
			return false;
		}
		return true;
	}
	else
		return false;
}

var standard;
function showStandard(strTable,strPos,txtTarget,strnum)
{
	var num = parseInt(strnum);
	var left;
	
	if (strPos=="left")
		left=screen.width-280;
	else
		left=0;

	document.forms(num).pastefield.value=txtTarget;

	if (standard=='[object]')
		standard.close();
			
	standard=window.open("/starch/wizard.asp?table="+strTable+"&formNum="+num,"standard","width=310,height=500,left="+left+",top=25,toolbar=no,scrollbars=yes");
	
	if ((document.forms(num).window!=null) && (!standard.opener))
		standard.opener=document.forms(num).window;
		
	standard.focus();
}

-->
</script>
</head>

<body class="body" onLoad="return windowOnload(0)" onUnload="if (standard=='[object]') standard.close();">
<%
	dim JBMC
	JBMC=request.QueryString("JBMC")
	
	dim strSQL
	strSQL="select * from C_ZhenDBZ where JBMC='"&JBMC&"'"
	dim oraDB
	set oraDB=OraSession.GetDatabaseFromPool(60)
	dim oraRS 
	set oraRS=oraDB.CreateDynaset(strSQL,0)
	
	Dim JLSUM
	JLSUM= 0
%>
<form>
<INPUT type="hidden" name="pastefield">
</form>
<table width="800" border="0" align="center" class="table2">
<tr>
<td class="title1"><%=JBMC%>-已有相关的诊断标准记录列表：<%=oraRS.RecordCount%>条</td>
</tr>
<%		
	Dim JLNUM
	JLNUM= 0    	
	oraRS.MoveFirst
    Do Until oraRS.EOF
		JLNUM= JLNUM+1
		JLSUM= JLSUM+1
%>
<tr><td class="title1"><%response.Write(JLNUM)%></td></tr>
<tr><td>
	<form action="updateStandardInfo.asp?Type=0&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
	<tr> 
      <td width="118"><div align="right">标准名称：</div></td>
      <td width="253"><div align="left"><textarea name="txtBZMC"><%=oraRS.fields("BZMC")%></textarea>
	  </div></td>
      <td><div align="right">标准级别分类：</div></td>
      <td><div align="left">
          <textarea name="txtBZJBFL"><%=oraRS.fields("BZJBFL")%></textarea>
      </div></td>
	</tr>
    <tr>
      <td><div align="right">标准代码：</div></td>
      <td><div align="left">
          <textarea name="txtBZDM" cols="20" rows="3"><%=oraRS.fields("BZDM")%></textarea>
          <input name="button" type="button" class="button1" onClick="showStandard('JiXing','Right','txtYFJX','<%=JLSUM%>');" value="辅助选词" />
      </div></td> 
      <td width="162"><div align="right">标准制定日期：</div></td>
      <td width="237"><div align="left">
          <textarea name="txtBZZDRQ" rows="3"><%=oraRS.fields("BZZDRQ")%></textarea>
        </div></td>
    </tr>
    <tr>
      <td><div align="right">标准起草单位：</div></td>
      <td><div align="left">
          <textarea name="txtBZQCDW" rows="3"><%=oraRS.fields("BZQCDW")%></textarea>
      </div></td> 
      <td><div align="right">标准认定技术委员会：</div></td>
      <td><div align="left">
          <textarea name="txtBZRDJSWYH" cols="20" rows="3"><%=oraRS.fields("BZRDJSWYH")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
        </div></td>
    </tr>
    <tr>
      <td><div align="right">标准监制单位：</div></td>
      <td><div align="left">
          <textarea name="txtBZJZDW" cols="20" rows="3"><%=oraRS.fields("BZJZDW")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
      </div></td>
      <td><div align="right">病例选择标准：</div></td>
      <td><div align="left">
          <textarea name="txtBLXZBZ" cols="20" rows="3"><%=oraRS.fields("BLXZBZ")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
      </div></td>
    </tr>
    <tr>
      <td><div align="right">临床分型标准：</div></td>
      <td><div align="left">
          <textarea name="txtLCFXBZ" cols="20" rows="3"><%=oraRS.fields("LCFXBZ")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
      </div></td>
      <td><div align="right">病原学分型标准：</div></td>
      <td><div align="left">
          <textarea name="txtBYXFXBZ" cols="20" rows="3"><%=oraRS.fields("BYXFXBZ")%></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
      </div></td>
    </tr>
    <tr> 
      <td><div align="right">备注：</div></td>
      <td colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
	<tr>
    	  <td colspan="4"><div align="center"><input type="submit" name="Submit" value="更新该条诊断标准记录" onClick="return UpdateRecord(<%=JLSUM%>)">
		  <input type="button" value="删除该条诊断标准记录" onClick="if (confirm('确定要删除记录么？')) { window.location='delStandardInfo.asp?Type=0&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
    	  </div></td>
	</tr>	  
	</table>
	</form>
</td></tr>
<%
		oraRS.movenext
	loop
	oraRS.close
	
	strSQL="select * from C_LiaoXBZ where JBMC='"&JBMC&"'"
	set oraRS=oraDB.CreateDynaset(strSQL,0)
%>
<tr>
<td class="title1"><%=JBMC%>-已有相关的疗效标准记录列表：<%=oraRS.RecordCount%>条</td>
</tr>
<%	
	JLNUM= 0    	
	oraRS.MoveFirst
    Do Until oraRS.EOF
		JLNUM= JLNUM+1
		JLSUM= JLSUM+1
%>
<tr><td class="title1"><%response.Write(JLNUM)%></td></tr>
<tr><td>
	<form action="updateStandardInfo.asp?Type=1&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
	<INPUT type="hidden" name="pastefield">
	<table width="100%" class="table3">
      <tr>
        <td><div align="right">标准名称：</div></td>
        <td><div align="left">
            <textarea name="txtBZMC"><%=oraRS.fields("BZMC")%></textarea>
        </div></td>
        <td><div align="right">标准级别分类：</div></td>
        <td><div align="left">
            <textarea name="txtBZJBFL"><%=oraRS.fields("BZJBFL")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td><div align="right">标准代码：</div></td>
        <td><div align="left">
            <textarea name="txtBZDM" cols="20" rows="3"><%=oraRS.fields("BZDM")%></textarea>
            <input name="button" type="button" class="button1" onClick="showStandard('JiXing','Right','txtYFJX','<%=JLSUM%>');" value="辅助选词" />
        </div></td>
        <td><div align="right">标准制定日期：</div></td>
        <td><div align="left">
            <textarea name="txtBZZDRQ" rows="3"><%=oraRS.fields("BZZDRQ")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td><div align="right">标准起草单位：</div></td>
        <td><div align="left">
            <textarea name="txtBZQCDW" rows="3"><%=oraRS.fields("BZQCDW")%></textarea>
        </div></td>
        <td><div align="right">标准认定技术委员会：</div></td>
        <td><div align="left">
            <textarea name="txtBZRDJSWYH" cols="20" rows="3"><%=oraRS.fields("BZRDJSWYH")%></textarea>
            <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
        </div></td>
      </tr>
      <tr>
        <td><div align="right">标准监制单位：</div></td>
        <td colspan="3"><div align="left">
            <textarea name="txtBZJZDW" cols="60" rows="3"><%=oraRS.fields("BZJZDW")%></textarea>
        </div></td>
      </tr>
	<tr> 
      <td width="17%"><div align="right">备注：</div></td>
      <td width="83%" colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"><%=oraRS.fields("BZ")%></textarea>
        </div></td>
    </tr>
	<tr>
    	  <td colspan="4"><div align="center"><input type="submit" name="Submit" value="更新该条疗效标准记录" onClick="return confirm('确定要更新记录么？')">
		  <input type="button" value="删除该条疗效标准记录" onClick="if (confirm('确定要删除记录么？')) { window.location='delStandardInfo.asp?Type=1&ID=<%=oraRS.fields("ID")%>&JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>';}">
    	  </div></td>
	</tr>	
  </table>
  </form>
</td></tr>
<%
		oraRS.movenext
	loop
	oraRS.close
%>

<tr><td align="center" class="title1">以上已加工的标准记录共<%=JLSUM%>条</td></tr>
<tr>
<td align="center" class="title1">添加一条新的标准信息记录</td>
</tr>
<tr><td>
<%JLSUM=JLSUM+1%>
<form name="formCont" action="insertStandardInfo.asp?JBMC=<%=JBMC%>&BJZT=<%=request("BJZT")%>" method="post">
  <INPUT type="hidden" name="pastefield">
  <table width="100%" class="table3">
    <tr> 
      <td><div align="center">标准类型： 
            <select name="BZLX" id="BZLX" onChange="inputShow(-1)">
              <option value="0" selected>诊断标准</option>
              <option value="1">疗效标准</option>
            </select>
          </div></td>
    </tr>   
	<tr> 
      <td id="inputCont"></td>
    </tr>
    <tr> 
      <td ><hr color="#0099CC"/></td>
    </tr>
    <tr>
      <td ><div align="center">
        <input type="submit" name="Submit2" value="添加这条标准信息" onClick="return AddNewRecord()">
      </div></td>
    </tr>
	</table>
</form>
</td></tr>
</table>
<div id="div0"  style="VISIBILITY: hidden;POSITION: absolute; left: 8px; top: 217px;">
	<table border="0" class="table3">
   <tr> 
      <td width="118"><div align="right">标准名称：</div></td>
      <td width="253"><div align="left"><textarea name="txtBZMC"></textarea>
	  </div></td>
      <td><div align="right">标准级别分类：</div></td>
      <td><div align="left">
          <textarea name="txtBZJBFL"></textarea>
      </div></td>
	</tr>
    <tr>
      <td><div align="right">标准代码：</div></td>
      <td><div align="left">
          <textarea name="txtBZDM" cols="20" rows="3"></textarea>
          <input name="button" type="button" class="button1" onClick="showStandard('JiXing','Right','txtYFJX','<%=JLSUM%>');" value="辅助选词" />
      </div></td> 
      <td width="162"><div align="right">标准制定日期：</div></td>
      <td width="237"><div align="left">
          <textarea name="txtBZZDRQ" rows="3"></textarea>
        </div></td>
    </tr>
    <tr>
      <td><div align="right">标准起草单位：</div></td>
      <td><div align="left">
          <textarea name="txtBZQCDW" rows="3"></textarea>
      </div></td> 
      <td><div align="right">标准认定技术委员会：</div></td>
      <td><div align="left">
          <textarea name="txtBZRDJSWYH" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
        </div></td>
    </tr>
    <tr>
      <td><div align="right">标准监制单位：</div></td>
      <td><div align="left">
          <textarea name="txtBZJZDW" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
      </div></td>
      <td><div align="right">病例选择标准：</div></td>
      <td><div align="left">
          <textarea name="txtBLXZBZ" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
      </div></td>
    </tr>
    <tr>
      <td><div align="right">临床分型标准：</div></td>
      <td><div align="left">
          <textarea name="txtLCFXBZ" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
      </div></td>
      <td><div align="right">病原学分型标准：</div></td>
      <td><div align="left">
          <textarea name="txtBYXFXBZ" cols="20" rows="3"></textarea>
          <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
      </div></td>
    </tr>
    <tr> 
      <td><div align="right">备注：</div></td>
      <td colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"></textarea>
        </div></td>
    </tr>
  </table>
</div>
<div id="div1"  style="VISIBILITY: hidden;POSITION: absolute; left: 8px; top: 217px;">
	<table width="100%" height="122" border="0" class="table3">
     <tr>
        <td><div align="right">标准名称：</div></td>
        <td><div align="left">
            <textarea name="txtBZMC"></textarea>
        </div></td>
        <td><div align="right">标准级别分类：</div></td>
        <td><div align="left">
            <textarea name="txtBZJBFL"></textarea>
        </div></td>
      </tr>
      <tr>
        <td><div align="right">标准代码：</div></td>
        <td><div align="left">
            <textarea name="txtBZDM" cols="20" rows="3"></textarea>
            <input name="button" type="button" class="button1" onClick="showStandard('JiXing','Right','txtYFJX','<%=JLSUM%>');" value="辅助选词" />
        </div></td>
        <td><div align="right">标准制定日期：</div></td>
        <td><div align="left">
            <textarea name="txtBZZDRQ" rows="3"></textarea>
        </div></td>
      </tr>
      <tr>
        <td><div align="right">标准起草单位：</div></td>
        <td><div align="left">
            <textarea name="txtBZQCDW" rows="3"></textarea>
        </div></td>
        <td><div align="right">标准认定技术委员会：</div></td>
        <td><div align="left">
            <textarea name="txtBZRDJSWYH" cols="20" rows="3"></textarea>
            <input name="button3" type="button" class="button1" onClick="showStandard('GongXiao','Right','txtZZ','<%=JLSUM%>');" value="辅助选词" />
        </div></td>
      </tr>
      <tr>
        <td><div align="right">标准监制单位：</div></td>
        <td colspan="3"><div align="left">
            <textarea name="txtBZJZDW" cols="60" rows="3"></textarea>
        </div></td>
      </tr>
	<tr> 
      <td width="17%"><div align="right">备注：</div></td>
      <td width="83%" colspan="3"><div align="left">
          <textarea name="txtBZ" cols="60" rows="3"></textarea>
        </div></td>
    </tr>
  </table>
</div>
<center>
<a href="javascript:history.go(-1)">返回</a>
</center>
</body>
</html>
