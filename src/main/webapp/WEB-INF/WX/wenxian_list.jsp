<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="dbsearch.domain.Paper"%>
<%@ page language="java" import="dbsearch.service.impl.UserService"%>
<%@ page language="java" import="java.lang.Math.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'wenxian_list.jsp' starting page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8 ">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
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
	<div
		style="width: 90%; background-color: rgb(255, 255, 255); border: solid 1px rgb(200, 200, 200); margin-bottom: 30px; margin-left: 2px;">
		<%
			List<Paper> resultList;
		%>
		<%
			resultList = (List<Paper>) request.getAttribute("resultList");
			if (resultList.isEmpty()) {
		%>
		<div style="padding: 20px;">---无查询结果---</div>
		<%
			} else {
		%>
		<table width="100%" height="50px" border="0">
			<tr>
				<td width="10px" align="left"></td>
				<td><span onclick="time_order()">按时间排序&nbsp; <image
							id="tAs" height="15px" src="images/ascending.png"> <image
							id="tDs" height="15px" style="display:none;"
							src="images/Descending.png"></span></td>
				<td><span onclick="download_order()">按下载量排序&nbsp; <image
							id="dAs" height="15px" src="images/ascending.png"> <image
							id="dDs" height="15px" style="display:none;"
							src="images/Descending.png"></span></td>

			</tr>
		</table>
		<div class="title_div"></div>

		<c:forEach var="paperItem" items="${resultList}" varStatus="status">
			<div class="ele_div">
				<table style="width: 100%; table-layout: fixed; border: 0;">
					<tr>
						<td rowspan="1"><img alt="" src="images/pdf.png" width="20px"
							height="20px"> <a onclick="showPaper(${paperItem.id})">${paperItem.accidentName}
						</a> <span
							style="color: #1C86EE; font-size: 13px; background: #EAEAEA">${fn:substring(paperItem.failureBehave, 0,10)}</span>
						</td>
						<td><span
							style="margin-right: 60px; float:right; color: #BABABA; font-size: 15px;">${fn:substring(paperItem.uploadTime, 0, 10)}</span>
						</td>



					</tr>
					<tr>
						<td colspan="2">
							<table style="width: 95%; table-layout: fixed; border: 0;">
								<tr>
									<td class="td_img"><img height="120px" width="180px"
										src="images/gjss${paperItem.id % 6+1}.png" /></td>
									<td
										style="width: 45%; height: 50px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										${paperItem.accidentDescription}

									</td>
									<td  >
										<table style="width: 100%;height: 100%">
											<tr style="font-size: 6px; color: #ADADAD">
												<td style="text-align:center" height= "30px" width="100%" rowspan="1" valign="bottom">
													${paperItem.failureEquipment}</td>
												
											</tr>
											
											<tr>
											<tr style="font-size: 6px; color: #ADADAD">
												<td style="text-align:center" height= "30px" width="100%" rowspan="1" valign="bottom">
													上传者:${paperItem.getOwner().getEmail()}</td>
												
											</tr>
											
											<tr>
											<td style="text-align:center" height= "40px"><input type="button"
													name="submit"
													class="submit-btn" value="查看概要"
													onclick="showPaper(${paperItem.id})" /></td>
											</tr>
											
										</table>
									</td>
								</tr>
							</table>
						</td>

						<!-- 		</tr>
					<tr style="font-size:2px;color:#7B7B7B">
						<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${paperItem.accidentDescription}
							
						</td> -->
					</tr>
					<!-- <tr style="font-size: 6px; color: #ADADAD">
						<td width="100%" rowspan="1" valign="bottom">
							${paperItem.failureEquipment} &nbsp;|&nbsp上传者:;
							${paperItem.getOwner().getEmail()}</td>
						<td><input type="button"
							style="margin-right: 100px; float: right" name="submit"
							class="submit-btn" value="查看概要"
							onclick="showPaper(${paperItem.id})" /></td>
					</tr>-->
					<tr>
						<td width="15px"></td>

					</tr>
				</table>
			</div>
		</c:forEach>
		<%
			}
		%>
	</div>
</body>
<script type="text/javascript">
var time_click = 1
var download_click = 1
function showPaper(id){
	window.location.href = "/dbsearchForTest/showPaper?paperId="+id;
}
function time_order(){
	time_click = (time_click + 1)%2
	if(!time_click){
		$("#tDs").show();
		$("#tAs").hide();
	}
	else{
		$("#tAs").show()
		$("#tDs").hide();
	}
	
}
function download_order(){
	download_click = (download_click + 1)%2
	if(!download_click){
		$("#dDs").show();
		$("#dAs").hide();
	}
	else{
		$("#dAs").show()
		$("#dDs").hide();
	}
	
}


</script>
</html>
