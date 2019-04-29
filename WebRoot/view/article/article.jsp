<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="/view/common/head.jsp" %>
		<link href="js/ueditor143/themes/default/css/ueditor.min.css" rel="stylesheet">
	</head>
	<body>
    <!-- Fixed navbar -->
   	<%@ include file="/view/common/nav.jsp" %>
     <div class="container">
    	<div class="row">
    		<div class="col-sm-12 col-md-8">
    			<div class="box">
    				<div class="cell">
						<span class="chevron">&nbsp;›&nbsp;</span> 发表博文					
					</div>
					<div class="inner">
						<form accept-charset="UTF-8" action="article/save" class="form-horizontal" id="form_act" method="post" novalidate="novalidate">
							<input type="hidden" id="id" name="id" value="${article.id}">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="title">标题</label>
								<div class="col-sm-9">
									<input autofocus="autofocus" class="form-control" id="title" name="title" size="50" type="text" value="${article.title}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="title">分类</label>
								<div class="col-sm-9">
									<select id="cid" name="cid" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										<option value="1">Java</option>
										<option value="2">前端</option>
										<option value="3">运维</option>
										<option value="4">FTPC&MES</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="detail">内容</label>
								<div class="col-sm-9">
									<div type="text/plain" id="myEditor" style="width: 460px;height:240px;">
									</div>
								</div>
								<input type="hidden" id="content" name="content">
							</div>								
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-9">
									<span id="submit_form" class="btn btn-primary">发表</span>
								</div>
							</div>
						</form>
					</div>
    			</div>
    		</div>
    		<div class="col-sm-12 col-md-4">
    			<%@ include file="/view/common/about.jsp"%>
    		</div>
    	</div>
    </div> 
	<%@ include file="/view/common/foot.jsp" %>
  	<script src="js/ueditor143/ueditor.config.js"></script>
	<script src="js/ueditor143/ueditor.all.min.js"></script>
	<script src="js/ueditor143/ueditor.parse.min.js"></script>
	<script src="js/ueditor143/lang/zh-cn/zh-cn.js"></script>
	<script>
		window.UEDITOR_HOME_URL ="/js/ueditor/";
		$(function(){
			var cid = '${article.cid}'==''?'1':'${article.cid}';
			$('#cid').val(cid );
			var ue = UE.getEditor('myEditor');
			ue.ready(function() {
				var content = '${article.content}';
				var newContent=content.replace(/\<BR\>/gi,"\r\n");  
			    this.setContent(newContent);
			});
			$('#submit_form').click(function(){
				if($('#title').val()==''){
					alert('标题不能为空');
					return;
				}
				var content = ue.getContent();
				if(content==''||content==null){
					alert('内容不能为空');
					return;
				}
				$('#content').val(content);
				$('#form_act').submit();
			});
		})
	</script>
</body></html>