<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@	taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page language="java" import="dbsearch.service.impl.DiagnoseFieldService"%>
<%@ page language="java" import="dbsearch.domain.DiagnoseField"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		
		<table width="100%" id="" border="0" class="t1" align="center" cellpadding="0"
	        cellspacing="0" align="left">
	        <tr>
	            <th width="100%" align="center" colspan="3">
	            	添加类别
	            </th>
	        </tr>
	        <tr border="none">
	        	<td width="20%" height="60px;" align="center">
	        		<input type="radio" name="insCate" value="1" checked="checked"onchange="rdChange()">
	        		<span style="padding-left:5px;">添加领域</span>
	        	</td>
	        	<td width="20%" height="60px;" align="center">
	        		<input type="radio" name="insCate" value="2"  onchange="rdChange()">
	        		<span style="padding-left:5px;">添加材料分类</span>
	        	</td>
	        	<td width="40%"  align="center">
	        		<input type="text" id="str_insert_name" 
	        			style="height:30px;line-height:30px;width:200px;">
	        	</td>
	        </tr>
	        	
	
	        <tr border="none">
	        	<td width="40%" height="60px;" align="center">
	        		<input type="radio" name="insCate" value="3" onchange="rdChange()">
	        		<span style="padding-left:5px;">添加子关键词</span>
	        	</td>
	        	<td align="center">
	        		<select id="sltCate" style="height:30px;line-height:30px;align:center;display:none;">
	        			<option style="align:center;" value="">--请选择父关键词--</option>
	        		<%!
			 			List<List<DiagnoseField>> menuList;
	        		DiagnoseFieldService categoryService;
	        		DiagnoseField tempCategory;
			 		%>
	        		<%
			 			menuList=(List<List<DiagnoseField>>)request.getAttribute("fieldList");
	        			System.out.println(menuList.size());
			 			List<DiagnoseField> subList;
			 			if(!menuList.isEmpty()){
				 			for(int i=0;i<menuList.size()-1;i++){
				 				subList=menuList.get(i);
				 				tempCategory=subList.get(0);//一级标题
				 	%>
						<option style="align:center;" value="<%=tempCategory.getId() %>"><%=tempCategory.getName() %></option>
					<%
				 			}
				 		}	
					%>
						<option style="align:center;" value="3">失效形式</option>
					</select>
	        	</td>
	        </tr>
	    </table>
	    <div id="warningArea"></div>
	    <div style="padding:10px;">
			<input value="确认" type="button" class="s_btn" onclick=" doInsCate()">
			<input value="返回" type="button" class="s_btn" style="margin-left:40px;" onclick="doReturn()">
		</div>	
	<script type="text/javascript">
	function rdChange() {
		var selectedvalue = $("input[name='insCate']:checked").val();
		if (selectedvalue == 1 || selectedvalue == 2) {
			$("#sltCate").hide();
		}else {
			$("#sltCate").show();
		}
	}
	function doInsCate(){
		var selectedvalue = $("input[name='insCate']:checked").val();
		var parentId;
		var strCate=$("#str_insert_name").val();
		
		if(strCate==null||strCate.trim()==""){
			warning("请填写领域或材料名称！");
			return;
		}
		if (selectedvalue == 1) {
			parentId=1;	
		}
		if (selectedvalue == 2) {
			parentId=2;	
		}
		else {
			parentId=$("#sltCate").val();
			if(parentId==null||parentId==""){
				warning("请选择父关键词！");
				return;
			}
		}
		
		var url = "/dbsearchForTest/insField";
		var data = {
			"name" : strCate,
			"parent":parentId
			
		};
		$.ajax({
			type : "post",
			async : false, //同步请求
			url : url,
			data : data,
			success : function(dates) {
				$("#gly_main__fieldmanage").html(dates);//要刷新的div
				alert("添加成功");
			},
			error : function() {
				
			}
		});
	}
	
	
	
	
	
	function doReturn(){
		var url = "/dbsearchForTest/YH/diagnosefieldmanage";
		var data = {
			
		};
		$.ajax({
			type : "post",
			async : false, //同步请求
			url : url,
			data : data,
			success : function(dates) {
				$("#gly_main_fieldmanage").html(dates);//要刷新的div
			},
			error : function() {
				
			}
		});
	}

	function warning(str){
		document.getElementById("warningArea").innerHTML="Warning: "+str;
		document.getElementById("warningArea").style.display="block";
	}
	$("#warningArea").click( function() { 
		document.getElementById("warningArea").style.display="none";
	}); 
	</script>
</body>
</html>