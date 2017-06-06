<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="dbsearch.domain.Paper"%>
<%@ page language="java" import="java.util.Map.Entry" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@	taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>诊断结果案例参考</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery.js"></script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/pptBox.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<link href="css/mricode.pagination.css" rel="stylesheet" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/tablogo.ico" type="image/x-icon" />
<link href="css/admin_login.css" rel="stylesheet" type="text/css" />

<style>
body {
	text-align: center;
}

span {
	cursor: pointer;
}

.title_div {
	width: auto;
	height: 0px;
	line-height: 60px;
	margin-left: 15px;
	margin-right: 15px;
	margin-bottom: 5px;
	border-bottom: solid 1px rgb(200, 200, 200);
	padding: 0px 0px 0px 10px;
}

.td_img {
	rowspan: 1;
	padding-bottom: 20px;
	padding-top: 20px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 30%;
}

.ele_div {
	width: auto;
	height: auto;
	line-height: 70px;
	margin-left: 15px;
	margin-right: 15px;
	margin-bottom: 5px;
	border-bottom: dashed 1px rgb(200, 200, 200);
	padding: 0px 0px 0px 10px;
}


</style>
</head>



<body>
	<div class="div_head_container">
		<jsp:include page="../YH/pagehead.jsp" flush="true" />
	</div>
	<div style=" padding-top:20px; margin:0 auto 20px auto;">
		<div style="background:url(images/commoncase_title.png)no-repeat;width:319px;height:75px;margin:0 auto;">
			<span style="color:white;font-size:37px;font-weight:bold;line-height:55px">相关案例</span>
		</div>
	</div>
	<%
	String list = request.getParameter( "list");
	if(list!= "")
	{
		String[] caseList = list.split(",");
		List<Paper> resultList;		
		resultList = (List<Paper>) request.getAttribute("resultList");
		%>
		<div id="list" style="width:80%;margin:0 auto;" >
		<%
		
		for(int j =0;j<caseList.length;++j)
			for(int i =0;i<resultList.size();++i)
				if(resultList.get(i).getId()!= Integer.parseInt(caseList[j]))
					continue;
				else
				{
		%>
		
		<div class="ele_div">
				<table style="width: 100%; table-layout: fixed; border: 0;">
					<tr>
						<td rowspan="1"><img alt="" src="images/pdf.png" width="20px"
							height="20px"> <a onclick="showPaper(<%=resultList.get(i).getId() %>>)"><%=resultList.get(i).getAccidentName() %>
						</a> <span
							style="color: #1C86EE; font-size: 13px; background: #EAEAEA"><%=resultList.get(i).getFailureBehave() %></span>
						</td>																
						<td><span
							style="margin-right: 60px; float:right; color: #BABABA; font-size: 15px;"><%=resultList.get(i).getUploadTime() %></span>
						</td>



					</tr>
					<tr>
						<td colspan="2">
							<table style="width: 95%; table-layout: fixed; border: 0;">
								<tr>
									<td class="td_img"><img height="120px" width="180px"
										src="images/gjss<%=resultList.get(i).getId() % 6 + 1%>.png" /></td>
									<td
										style="width: 45%; height: 50px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<%=resultList.get(i).getAccidentDescription() %>

									</td>
									<td  >
										<table style="width: 100%;height: 100%">
											<tr style="font-size: 6px; color: #ADADAD">
												<td style="text-align:center" height= "30px" width="100%" rowspan="1" valign="bottom">
													<%=resultList.get(i).getFailureEquipment() %></td>
												
											</tr>
											
											<tr>
											<tr style="font-size: 6px; color: #ADADAD">
												<td style="text-align:center" height= "30px" width="100%" rowspan="1" valign="bottom">
													上传者:<%=resultList.get(i).getOwner() %></td>
												
											</tr>
											
											<tr>
											<td style="text-align:center" height= "40px"><input type="button"
													name="submit"
													class="submit-btn" value="查看概要"
													onclick="showPaper(<%=resultList.get(i).getId() %>)" /></td>
											</tr>
											
										</table>
									</td>
								</tr>
							</table>
						</td>


					<tr>
						<td width="15px"></td>

					</tr>
				</table>
			</div>
		
		
		
		
		
		
		<%
				}
		%>
		</div>
		<% 
		
	}
	else
	{
	%>
	<div style="padding: 20px;">---抱歉，无参考案例---</div>
	<%
	}
	%>
	
	



	<div style="clear: both;"></div>
	<div class="div_foot_container">
		<jsp:include page="../YH/pagefoot.jsp" flush="true" />
	</div>







</body>
<script type="text/javascript">
function showPaper(id){
	window.location.href = "/dbsearchForTest/showPaper?paperId="+id;
}

</script>
</html>