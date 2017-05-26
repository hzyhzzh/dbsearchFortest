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
		.button2{
			border-radius: 15px;
			font-size: 15px;
			font-weight:bold;
			/*background-color: white;*/
			color:#2894FF;
			/*border-color:#2894FF;*/
			padding:5px 12.5px;
			background:url(images/button2w.png)no-repeat;
			 -webkit-transition-duration: 0.4s;
    		transition-duration: 0.4s;
		}
		.button2:hover{
			/*background-color: #2894FF;*/
			background:url(images/button2b.png)no-repeat;
    		color:white; 
		}
		.button3{
			border-radius: 15px;
			font-size: 15px;
			font-weight:bold;
			color:#2894FF;		
			padding:5px 20.5px;
			background:url(images/button2w.png)no-repeat;
			 -webkit-transition-duration: 0.4s;
    		transition-duration: 0.4s;
		}
		.button3:hover{	
			background:url(images/button2b.png)no-repeat;
    		color:white; 
		}
		.content{
			
		    width:1200px;
		    height:300px;
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
		p{
			font-size:14px;
			color:#7B7B7B;
			text-align:center;
			margin:0 auto;
			line-height:2em;
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
			<input type="button" class="button1" value="领域分类" onclick="">
			<input type="button" class="button1" value="材料分类" onclick="">
		</form>		
	</div>
	
	<div class="content">
		<div class="container" style="width:257px;height:588px;">
			
			<div class="steps">
				<img src="images/stepsline.png" >
				<div id="step_pic1" style="top:0;background:url(images/stepsb.png);">
					<span>1</span>
				</div>
				<div id="step_pic2" style="top:100px;">
					<span>2</span>
				</div>
				<div id="step_pic3" style="top:200px;">
					<span>3</span>
				</div>
				<div id="step_pic4" style="top:300px;">
					<span>4</span>
				</div>
			</div>
			<div class="stepswords">
				<span  id="step_wd1" style="color:#2894FF">选择领域</span>
				<span id="step_wd2">选择设备</span>
				<span id="step_wd3">失效形式</span>
				<span id="step_wd4">诊断结果</span>		
			</div>
		</div>
		<div class="container" style="width:885px;height:588px;">
			<div style="border:1px solid #2894FF;margin:100px auto; width:760px;height:400px">
				<div class="leftside">
					<form>
						<table class="leftcontent">
							<tbody>
								<tr>
									<td><input type="button" class="button2" value="航天航空" onclick="step1_step2hthk()"></td>
								</tr>	
								<tr>	
									<td><input type="button" class="button2" value="石油化工" onclick="step1_step2syhg()"></td>
								</tr>
								<tr>	
									<td><input type="button" class="button2" value="其他领域" onclick="step1_step2qtly()"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="rightside" id="step1" style="display:block">
					<h4 style="margin:90px auto 10px auto">请您的设备所属领域</h4>
					<div style="margin:0 auto">
						<p style="margin:auto auto auto 10px">请点击左侧按钮选择您的设备所属的行业领域，或点击上方的材料分类选择您设备的材料。</p>
					</div>
				</div>

		
				<div class="rightside" id="step2hthk" style="display:none">
					<h4 style="margin-top:40px;">请选择失效设备</h4>
					<div style="margin:0 auto;text-align:center;line-height:2em;font-size:14px;color:#7B7B7B;">
						
						<form>
							 <input type="radio" name="equipment" value="fdj" onclick="chred(this);">发动机<br>
							 <input type="radio" name="equipment" value="qlj" onclick="chred(this);">起落架<br>
							 <input type="radio" name="equipment" value="jy" onclick="chred(this);">机翼<br>
							 <input type="radio" name="equipment" value="qt" onclick="chred(this);">其他<br><br>
							 <input type="button" value="下一步" class="button3" onclick="step2_step3()">
		 				</form> 
		 				
					</div>
				</div>
				<div class="rightside" id="step2syhg" style="display:none">
					<h4 style="margin-top:40px;">请选择部件</h4>
					<div style="margin:0 auto;text-align:center;line-height:2em;font-size:14px;color:#7B7B7B;">
						<form>
							 <input type="radio" name="equipment" value="cg">储罐<br>
							 <input type="radio" name="equipment" value="cl">齿轮<br><br>
							 <input type="submit" value="下一步" class="button3">
							
			 			</form> 
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

	function step1_step2hthk(){
		document.getElementById("step1").style.display="none";
		document.getElementById("step2hthk").style.display="block";
		document.getElementById("step2syhg").style.display="none";
		document.getElementById("step_pic1").style.background="url(images/stepsw.png)";
		document.getElementById("step_pic2").style.background="url(images/stepsb.png)";
		document.getElementById("step_wd1").style.color="#5B5B5B";
		document.getElementById("step_wd2").style.color="#2894FF";
	}
	function step1_step2syhg(){
		document.getElementById("step1").style.display="none";
		document.getElementById("step2hthk").style.display="none";
		document.getElementById("step2syhg").style.display="block";
		document.getElementById("step_pic1").style.background="url(images/stepsw.png)";
		document.getElementById("step_pic2").style.background="url(images/stepsb.png)";
		document.getElementById("step_wd1").style.color="#5B5B5B";
		document.getElementById("step_wd2").style.color="#2894FF";
	}	
	function step2_step3(){
		location.href="/dbsearchForTest/YH/selfanalysis3";
	}
	function chred(ele){
		var f = ele.checked;
		ele.parentNode.style.background="red";
		var radios = document.getElementsByName(ele.name);
		for(var i = 0; i<radios.length; i++){
		if(radios[i].checked == false){
		radios[i].parentNode.style.background="#fff";
		}
		}
		}
</script>
</html>