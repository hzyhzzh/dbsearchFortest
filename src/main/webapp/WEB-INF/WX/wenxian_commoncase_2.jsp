<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="dbsearch.domain.Paper"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>常见案例</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="images/tablogo.ico" type="image/x-icon" />
<link href='<c:url value="/css/css.css" />' rel="stylesheet"
	type="text/css" />
<link href='<c:url value="/css/other.css" />' rel="stylesheet"
	type="text/css" />
	<link href='<c:url value="/css/index.css" />' rel="stylesheet"
	type="text/css" />
<style>
	.cjsx {
		height: 50px;
		line-height: 50px;
		color: #0269b4;
		font-weight: bold;
		margin-top: 15px;
		font-size: 25px;
		font-family: "Lucida Console", Monaco, monospace, "微软雅黑";
		text-align: center;
	}
	
	.jc_line {
		width: 100%;
		border-bottom: 1px solid #ccc;
		margin-bottom: 0px;
	}
	
	.clear {
		clear: both;
		height: 1px;
	}
	.failureExample{
		
		width:1000px;
		height:300px;
		margin:50px auto;
	}
	td{
		text-align:center;
		
	}
	a:link, a:visited {
	    color:blue;
	    text-decoration:underline;
	}    

	a:hover, a:active {
	    color:#000000;
	    text-decoration:none;
	}
	#content{
		margin:0 auto;
		width:1200px;
	}
	.container{
		background-color:white;
		border-radius:5px;
		border:1px solid #E0E0E0;
		margin:10px;
		float:left;
		text-align:left;
	}
	h5{
		background-color:#D2E9FF;
		color:#2894FF;
		font-size:14px;
		text-align:center;
		line-height:25px;
		height:25px;
		width:100px;
		margin:20px auto 0 30px;
	}
	p{
		font-size:15px;
		color:#7B7B7B;
		
		align:right;
		text-indent:0;
		margin:10px auto 20px 30px;
	}
</style>
</head>

<body>
	<div class="div_head_container">
		<jsp:include page="../YH/pagehead.jsp" flush="true" />
	</div>
	<div style=" padding-top:20px; margin:0 auto 20px auto;">
		<div style="background:url(images/commoncase_title.png)no-repeat;width:319px;height:75px;margin:0 auto;">
			<span style="color:white;font-size:37px;font-weight:bold;line-height:55px">常见失效案例</span>
		</div>
	</div>
	<div id="content">
		<div class="container" id="left"  style="width:576px">
			<h5>事故名称</h5>
			<p>Y-TZP陶瓷材料的球轴承的失效分析</p>
			<h5>事故时间</h5>
			<p>2013年</p>
			<h5>事故地点</h5>
			<p>奥地利 莱奥本</p>
		</div>
		
		<div class="container" id="right" style="width:576px; float:right;">
			<h5>失效形式</h5>
			<p>磨损</p>
			<h5>失效机理</h5>
			<p>相变，腐蚀</p>
			<h5>失效设备</h5>
			<p>小型搅拌器</p>
			
		</div>
		<div class="container" id="middle" style="width:1176px">
			<h5 style="margin:30px auto 0 auto;">失效部件</h5>
			<p style="margin:10px auto;text-align:center;">球轴承</p>
			<div style="text-align:center; margin:0 auto 30px auto;">
				<img src="images/commoncase_2.png" alt="球轴承" width="280px" height="180px" style="border-radius:5px">
			</div>
		</div>
		<div class="container" id="bottom" style="width:1176px">
			<h5>事故概览</h5>
			<p>陶瓷轴承与钢制轴承相比有很多优势，例如更高的刚度、硬度，低密度，以及减小摩擦。陶瓷轴承耐磨耐腐蚀，比钢制轴承需要更少的润滑，所以对于制药和食品工业是更好的选择。本案例是制药厂小型搅拌机的陶瓷轴承失效。这个陶瓷轴承包括氧化锆的轴承内外圈以及氮化硅的滚珠。初步观察发现，内外圈表面磨损严重而滚珠看起来并没有损坏。检查人员初步认为轴承失效是由多种摩擦机制造成的。</p>
			<h5>分析结论</h5>
			<p style="line-height:2em">
			研究人员对失效的氧化锆陶瓷轴承进行了肉眼观察、光镜与扫描电镜观察以及拉曼光谱与化学成分分析。拉曼光谱分析结果显示了应力导致的相变（四方晶体转化为单斜晶体）的发生。EDS分析得知，腐蚀可能源于对轴承的清洗处理并且促进了相变。另外，由于机械载荷的作用以及可能存在的不精确装配导致轴承滚珠运行不平稳，不断有氧化锆碎屑粘到滚珠上，这都加速了失效的进程。因此可以得出结论：氧化铱稳定的四方氧化锆多晶体陶瓷（Y-TZP）并不适合用在滚动轴承上，尤其是在高温潮湿的条件下。
			
			</p>
			<form action="WX/wenxian_viewswf" method="post">  <!-- 隐藏传name表单 -->
        		<input type="hidden" name="accidentName" id="hiddenForm" value="Y-TZP陶瓷材料的球轴承的失效分析">  
			 	<input style="margin-left:30px;margin-bottom:30px;" type="submit" name="submit" class="submit-btn"  value="点击查看细节"/>
    		</form> 
		</div>
	</div>
	<div style="clear: both;"></div>
	<div class="div_foot_container">
		<jsp:include page="../YH/pagefoot.jsp" flush="true" />
	</div>

</body>
<script type="text/javascript">

function go_for_detail(){
	alert("显示该案例的pdf");
	//location.href="/dbsearchForTest/showPaper?paperId=1400";
}
</script>
</html>