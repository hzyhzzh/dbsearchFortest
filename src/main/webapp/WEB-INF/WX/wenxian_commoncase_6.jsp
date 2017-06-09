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
			<p>储罐失效</p>
			<h5>事故时间</h5>
			<p>不详</p>
			<h5>事故地点</h5>
			<p>斯洛伐克</p>
		</div>
		
		<div class="container" id="right" style="width:576px; float:right;">
			<h5>失效形式</h5>
			<p>变形（倒塌）</p>
			<h5>失效机理</h5>
			<p>塑性变形、制造缺陷</p>
			<h5>失效设备</h5>
			<p>热水储罐</p>
			
		</div>
		<div class="container" id="middle" style="width:1176px">
			<h5 style="margin:30px auto 0 auto;">失效部件</h5>
			<p style="margin:10px auto;text-align:center;">热水储罐罐顶</p>
			<div style="text-align:center; margin:0 auto 30px auto;">
				<img src="images/commoncase_6.png" alt="热水储罐罐顶" width="280px" height="180px" style="border-radius:5px">
			</div>
		</div>
		<div class="container" id="bottom" style="width:1176px">
			<h5>事故概览</h5>
			<p>原本设计用于重油存储的两个具有相同结构立式非受压型储罐在服役约30年后用来储存热水（温度为65-95℃）。储罐经过结构调整，增加必要的工艺设备后投入运行。在运行两周后，储罐的罐顶发生倒塌</p>
			<h5>分析结论</h5>
			<p style="line-height:2em"}>
			通过外观检查、诊断法、分析、建模、应力计算和实验模拟的循环在和分析，可以得出以下结论：
			（1）环板没有达到所需的宽度，建议直径超过12.5米储罐的环板宽度应为500mm。
			（2）虽然直径为15米的储罐的设计在罐顶可以没有加劲结构，且该案例中的储罐罐顶有这样的结构。然而，按照常规在这种结构中应该设计更多的多边形环钢结构。
			（3）储罐筒壁上新老钢带的连接不应在一条经线上（缺陷），其偏移量应为厚度的一半。
			（4）储罐筒壁上新老钢带之间不恰当地焊接也是导致储罐倒塌失效的原因之一。
			（5）筒壁第一级钢带和圆盘之间的连接是最重要的焊接。罐顶壳体和罐顶外环钢架之间的焊接连接存在问题（腐蚀和泄露）严重影响储罐的安全运行。
			（6）实验还证实储罐的几何缺陷导致承载部件受到高应力。只有在应急模式下才可以进行进一步的操作，并且需要定期检查和防止腐蚀，特别是在罐的外侧。
			（7）实验测量证实了所有分析和数值计算的结果。其结果表明增加储罐的排水速率（约超过50t/h）将极大地降低液面上方的蒸汽压力，这会导致在这样的压力下控制系统进行错误的运行从而导致储罐罐顶失败。

			
			</p>
			<form action="WX/wenxian_viewswf" method="post">  <!-- 隐藏传name表单 -->
        		<input type="hidden" name="accidentName" id="hiddenForm" value="储罐失效">  
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