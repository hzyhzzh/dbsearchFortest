<%@page import="ch.qos.logback.core.joran.conditional.ElseAction"%>
<%@page import="dbsearch.service.impl.DiagnoseFieldService"%>
<%@page import="dbsearch.domain.DiagnoseField"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>失效自诊</title>

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
<script type="text/javascript" src="js/spin.min.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<link href="css/mricode.pagination.css" rel="stylesheet" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/tablogo.ico" type="image/x-icon" />
<link href="css/admin_login.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.classification{
			width:500px;
			height:70px;
			line-height:70px;
			margin:20px auto;
		}
		
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
		.button1{
			border-radius: 5px; 
			font-size: 15px;
			font-weight:bold;
			/*background-color: white;*/
			background:url(images/button1w.png)no-repeat;
			color:#0080FF;
			/*border-color:#0080FF;*/
			margin:0 30px;
			padding:5px 27.5px;
			 -webkit-transition-duration: 0.4s;
    		transition-duration: 0.4s;
    		
		}
		.button1:hover {
    		background:url(images/button1b.png);
    		color:white; 
		}
		.button2{
			border-radius: 15px;
			font-size: 15px;
			font-weight:bold;
			background-color: white;
			color:#2894FF;
			border-color:#2894FF;
			padding:5px 12.5px;
			/*background:url(images/button2w.png)no-repeat;*/
			 -webkit-transition-duration: 0.4s;
    		transition-duration: 0.4s;
		}
		.button2:hover{
			/*background-color: #2894FF;*/
			background:url(images/button2b.png)no-repeat;
    		color:white; 
		} 
		
		.content{
			
			width:1200px;
		    height:800px;
		    margin:0 auto;
		}
		.container{
			background-color:white;
			border-radius:5px;
			border:1px solid #E0E0E0;
			margin:10px;
			float:left;
			text-align:left;
		}
		.leftside{
			/*border:1px solid blue;*/
			border-right:1px solid #E0E0E0;
		    float:left;
		    width:360px;
		    height:300px;
		    margin:50px 0 40px 20px;
		}
		.leftcontent{
			margin:0 auto;
			height:100%;
			vertical-align:middle;
		}
		
		.rightside{
			/*border:1px solid blue;*/
		    float:left;
		    width:360px;
		    height:300px;
		    margin:50px 0 40px 0;
		}
		h4{
			font-size:15px;
			text-align:center;
			color:#5B5B5B;
		}
		.steps{
			 
			 width:70px;
			 height:500px;
			 margin:80px 10px auto 50px;
			 text-align:center;
			 position:relative;
			 float:left;
		}
		.steps div{
			margin:20px auto;
			position:absolute;
			width:46px;
			height:52px;
			left:12.5px;
			background:url(images/stepsw.png);
		}
		.steps span{
			color:white;
			font-size:30px;
			font-weight:bold;
			padding-top:10px;
			line-height:1.7em;
		}
		.stepswords{
			 
			 width:70px;
			 height:500px;
			 margin:80px auto auto 0;
			 text-align:center;
			 position:relative;
			 float:left;
		}
		.stepswords span{
			font-size:15px;
			color:#5B5B5B;
			font-weight:bold;
			line-height:100px;
		}
	</style>
</head>

<body>
	<div style="height: 50px; text-align: left; font-size: 13px;">
		<jsp:include page="../YH/pagehead.jsp" flush="true" />
	</div>
	<div class="classification">
		<form>
			<input id="fieldclassify" type="button" class="button1" value="领域分类" onclick="">
			<input id="materialclassify" type="button" class="button1" value="材料分类" onclick="">
			<%
			if(request.getParameter("materialname")!=null & request.getParameter("failurequipment")!=null)
			{
				String fieldname=(String)request.getParameter("materialname"); 
				fieldname = new String(fieldname.getBytes("iso-8859-1"),"UTF-8");
			
				String failurequipment=(String)request.getParameter("failurequipment"); 
				failurequipment = new String(failurequipment.getBytes("iso-8859-1"),"UTF-8");
			%>
		 	<input  id="failurebehaviour" type ="hidden" value="">
		 	<input  id="fieldname" type ="hidden" value=<%=fieldname%>>
		 	<input  id="failurequipment" type ="hidden" value=<%=failurequipment%>>
		 	<%
		 	}
		 	%>
		 	
		</form>		
	</div>

	<div class="content">
	
		<div class="container" style="width:257px;height:588px;">
			<div class="steps">
				<img src="images/stepsline.png" >
				<div id="step_pic1" style="top:0;">
					<span>1</span>
				</div>
				<div id="step_pic2" style="top:100px;">
					<span>2</span>
				</div>
				<div id="step_pic3" style="top:200px;background:url(images/stepsb.png);">
					<span>3</span>
				</div>
				<div id="step_pic4" style="top:300px;">
					<span>4</span>
				</div>
			</div>
			<div class="stepswords">
				<span  id="step_wd1" >选择材料</span>
				<span id="step_wd2" >选择设备</span>
				<span id="step_wd3" style="color:#2894FF">失效形式</span>
				<span id="step_wd4">诊断结果</span>		
			</div>
		
		
		</div>
		
		
		<div class="container" style="width:885px;height:588px;">
			<div style="border:1px solid #2894FF;margin:100px auto; width:760px;height:400px">
				<div class="leftside">
					<h4 style="margin-top:70px;">请选择失效形式</h4>
					<div style="margin:0 auto;text-align:center;line-height:2em;font-size:14px;color:#7B7B7B;">
						<form>
						<%				
							List<DiagnoseField> BehaveList;
							BehaveList = (List<DiagnoseField>) request.getAttribute("BehaveList");
							for(int i = 0;i<BehaveList.size();++i)
							{
						%>
							 <input type="radio" name="equipment" value=<%= BehaveList.get(i).getName()%> onclick="chred(this);">
									 <%=BehaveList.get(i).getName()%><br>

		 				<%
							}
		 				%>
		 				</form> 
		 				
		 				
					</div>
				</div>
				<div class="rightside" id="step1hthk" style="display:block">
					
					<div style="margin-top:100px;text-align:center;">
						<div style="margin-top:60px;">
							<input type="submit" value="上一步" class="button2" onclick="step3_step2()"> 
						</div>
						<div style="margin-top:30px;">
							<input type="submit" value="下一步" class="button2" onclick="step3_step4()"> 
						</div>
						<div id="wait_gif"></div>
					</div>
				</div>
			</div>
		</div>
	
		
	</div>
	<div style="clear: both;"></div>
	<div class="div_foot_container">
		<jsp:include page="../YH/pagefoot.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$("#fieldclassify").click(function(){
	location.href = "/dbsearchForTest/YH/selfanalysis"
	
});
$("#materialclassify").click(function(){
	location.href = "/dbsearchForTest/YH/selfanalysis_Material"	
});



var opts = {
		  lines: 7 // The number of lines to draw
		, length: 2 // The length of each line
		, width: 14 // The line thickness
		, radius: 21 // The radius of the inner circle
		, scale: 1 // Scales overall size of the spinner
		, corners: 1 // Corner roundness (0..1)
		, color: '#000' // #rgb or #rrggbb or array of colors
		, opacity: 0.25 // Opacity of the lines
		, rotate: 0 // The rotation offset
		, direction: 1 // 1: clockwise, -1: counterclockwise
		, speed: 0.9 // Rounds per second
		, trail: 60 // Afterglow percentage
		, fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
		, zIndex: 2e9 // The z-index (defaults to 2000000000)
		, className: 'spinner' // The CSS class to assign to the spinner
		, top: '50%' // Top position relative to parent
		, left: '50%' // Left position relative to parent
		, shadow: false // Whether to render a shadow
		, hwaccel: false // Whether to use hardware acceleration
		, position: 'absolute' // Element positioning
		}
	
	
	
	
	function step3_step2(){
		location.href="/dbsearchForTest/YH/selfanalysis_Material";
	}
	function step3_step4(){
		if($("#failurebehaviour").val()=="")
		{
			alert("请选择失效形式")
		}
		else
		{	
			var target = document.getElementById('wait_gif')
			var spinner = new Spinner().spin()
			target.appendChild(spinner.el)
			var b= "/dbsearchForTest/YH/selfanalysis_Material4?materialname="+$("#fieldname").val()+"&"+"failurequipment="+$("#failurequipment").val()+"&"+"failurebehaviour="+$("#failurebehaviour").val()
			location.href=b;
		}
		
		
	}	
	function chred(ele){
		$("#failurebehaviour").val(ele.value)
	}

</script>
</html>