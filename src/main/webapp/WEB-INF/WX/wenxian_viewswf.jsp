<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
	<%@page import="dbsearch.domain.Paper"%>
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

<title>文档预览</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8 ">
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
<script type="text/javascript" src="js/flexpaper_flash.js"></script>
<script type="text/javascript" src="js/swfobject/swfobject.js"></script>  
<link rel="shortcut icon" href="images/tablogo.ico" type="image/x-icon" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<style type="text/css" media="screen">   
            html, body  { height:100%; }  
            body { margin:0; padding:0; overflow:auto; }     
            #flashContent { display:none; }  
        </style>  
</head>

<body>
   <%
   	String filepath = request.getParameter("file");
    //String user = (String)request.getAttribute("user");
    request.setCharacterEncoding("UTF-8");
    String accidentName = request.getParameter("accidentName");
    System.out.println(accidentName);
    if(accidentName !=null)
    {
 	  List<Paper> resultList = (List<Paper>)request.getAttribute("resultList");
 	   for(int i=0;i<resultList.size();i++){
 		   if(resultList.get(i).getAccidentName().equals(accidentName))
 		   {
 			   filepath= resultList.get(i).getFilePath().replace("docx", "swf");
 			   break;
 		   }
 	   }
    }
    
    if(filepath == null)
    {
    	%>
    	<input value="数据库中无此参考案例">
    
    <% 
    	return;
    }
    %>
   	<script type="text/javascript">   
   	var user = "<%=session.getAttribute("user")%>";
	if (accidentName==null || user == null || user == "null") {
		alert("请先登陆")
		location.href="/dbsearchForTest/index";
	} 
   	</script>   
   <div class="div_head_container">
		<jsp:include page="../YH/pagehead.jsp" flush="true" />
	</div>
	  
	<div style=" padding-top:20px; margin:0 auto 20px auto;">
		<div style="background:url(images/commoncase_title.png)no-repeat;width:319px;height:75px;margin:0 auto;">
			<span style="color:white;font-size:37px;font-weight:bold;line-height:55px">案例全文</span>
		</div>
	</div>
	
	<div style=" padding-top:20px; margin:0 auto 20px auto;">  
	  
	       <div id="flashContent">   
	  		</div>   
	   </div> 
	
	
			<input id="paper_name" type="hidden" value=<%=filepath%> >
	<div style="clear: both;"></div>
	<div class="div_foot_container">
		<jsp:include page="../YH/pagefoot.jsp" flush="true" />
	</div>		
			
			

</body>
<script type="text/javascript">   
			var path ="uploaded/"+$("#paper_name").val()
            //<!-- For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. -->   
            var swfVersionStr = "10.0.0";  
            //<!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->  
         /*    var xiSwfUrlStr = "playerProductInstall.swf"; */  
            var xiSwfUrlStr = "";  //值可以任意  
              
            var flashvars = {   
                  SwfFile : escape(path),   //swf文件路径（lucene4.6和页面同一个位置）     
                  Scale : 0.6,   
                  ZoomTransition : "easeOut",  
                  ZoomTime : 0.5,  
                  ZoomInterval : 0.1,  
                  FitPageOnLoad : false,  
                  FitWidthOnLoad : true,  
                  PrintEnabled : true,  
                  FullScreenAsMaxWindow : false,  
                  ProgressiveLoading : true,  
                    
                  PrintToolsVisible : true,  
                  ViewModeToolsVisible : true,  
                  ZoomToolsVisible : true,  
                  FullScreenVisible : true,  
                  NavToolsVisible : true,  
                  CursorToolsVisible : true,  
                  SearchToolsVisible : true,  
                    
                  localeChain: "en_US"  
                  };  
                    
             var params = {  
                  
                }  
            params.quality = "high";  
            params.bgcolor = "#ffffff";  
            params.allowscriptaccess = "sameDomain";  
            params.allowfullscreen = "true";  
            var attributes = {};  
            attributes.id = "FlexPaperViewer";  
            attributes.name = "FlexPaperViewer";  
            swfobject.embedSWF(  
                "FlexPaperViewer.swf", "flashContent",   
                "1024", "768",  
                swfVersionStr, xiSwfUrlStr,   
                flashvars, params, attributes);  
            swfobject.createCSS("#flashContent", "display:block;text-align:center;");  
        </script>   
</html>
