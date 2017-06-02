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
			<input type="button" class="button1" value="材料分类" onclick="step3_step4()">
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
				<div id="step_pic3" style="top:200px;">
					<span>3</span>
				</div>
				<div id="step_pic4" style="top:300px;background:url(images/stepsb.png);">
					<span>4</span>
				</div>
			</div>
			<div class="stepswords">
				<span  id="step_wd1" >选择领域</span>
				<span id="step_wd2">选择设备</span>
				<span id="step_wd3">失效形式</span>
				<span id="step_wd4" style="color:#2894FF">诊断结果</span>		
			</div>
		</div>
		<% 
						int paper_id = 5;
						String fieldname=(String)request.getParameter("fieldname");//失效领域
						fieldname = new String(fieldname.getBytes("iso-8859-1"),"utf-8");
						String failurequipment=(String)request.getParameter("failurequipment");//失效部件
						failurequipment = new String(failurequipment.getBytes("iso-8859-1"),"utf-8");
						String failurebehaviour=(String)request.getParameter("failurebehaviour");; //失效形式
						failurebehaviour = new String(failurebehaviour.getBytes("iso-8859-1"),"utf-8");
						
						int sum = 0;
						List<Paper> resultList;		
						resultList = (List<Paper>) request.getAttribute("resultList");
						Map<String,Integer> items = new HashMap<String,Integer>();
						
						for(int i =0;i<resultList.size();++i)
						{
							String failureequipment = resultList.get(i).getFailureEquipment();
							String failurebehave = resultList.get(i).getFailureBehave();
							String failurecause = resultList.get(i).getFailureCause();
							if(failureequipment.contains(fieldname) 
									& failureequipment.contains(failurequipment)
									& failurebehave.contains(failurebehaviour))
							{
								sum ++;
								if(!items.containsKey(failurecause))
									{
										items.put(failurecause, new Integer(1));
										paper_id = resultList.get(i).getId();
									}
								else
								{
									 int count = items.get(failurecause);
									 count +=1;
									 items.put(failurecause, new Integer(count));
								}
								
							}
									
						}
						


					List<Entry<String,Integer>> list = new ArrayList<Entry<String,Integer>>(items.entrySet());					

					Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
					    public int compare(Map.Entry<String, Integer> o1,
					            Map.Entry<String, Integer> o2) {
					        return (o2.getValue() - o1.getValue());
					    }
					});
					%>
		<input  id="fieldname" type ="hidden" value=<%=fieldname%>>
		<input  id="failurequipment" type ="hidden" value=<%=failurequipment%>>
		<div class="container" style="width:885px;height:588px;">
			<div style="border:1px solid #2894FF;margin:100px auto; width:760px;height:400px">
				<div class="leftside">
					<h4 style="margin-top:100px;">可能是以下失效</h4>
					<%
					if(list.size()!=0 ){
						int size = list.size()<3?list.size():3;
				
						for(int i =0;i<size;++i){
					%>
					<p><%=list.get(i).getKey()%>.......<%=(float)list.get(i).getValue()/sum * 100%>%</p>
					<%
						}
					}
					else{	
						%>
						<p>应力腐蚀开裂.........30%</p>
						<%
					}
					%>	
				</div>
				
					
				<div class="rightside" id="step1hthk" style="display:block">
					
					<h4>应力腐蚀开裂</h4>
					<p>应力腐蚀开裂与材料、应力、及环境三方面的影响因素密切相关，因此也是从这三个方面采取措施。</p>
					<h4>改进措施</h4>
					<p>a.合理选材和提高金属材料的质量。<br>
					   b.控制和降低应力。<br>
					   c.改善环境条件，采取保护措施。
					</p>
					
					<div style="margin-top:20px;text-align:center;">
						<input type="submit" value="上一步" class="button3" onclick="step4_step3()"> 
						<input type="submit" value="案例参考" class="button2" onclick="gofor_a_example()"> 
						<input type="submit" value="返回首页" class="button2" onclick="step4_step0()"> 
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
	function step4_step3(){
		location.href="/dbsearchForTest/YH/selfanalysis3?fieldname="+$("#fieldname").val()+"&"+"failurequipment="+$("#failurequipment").val();
	}	
	function step4_step0(){
		location.href="/dbsearchForTest/YH/selfanalysis";
	}
	function gofor_a_example(){
		
		location.href="/dbsearchForTest/showPaper?paperId=<%=paper_id%>";
	}

	
	
	
</script>
</html>