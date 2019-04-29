<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="en">
	<head>
	<%@ include file="/view/common/head.jsp" %>
	</head>
	<body>
    <!-- Fixed navbar -->
   	<%@ include file="/view/common/nav.jsp" %>

    <div class="container">
    	<div class="row">
    		<div class="col-sm-12 col-md-8">
    			<div class="box">
					<div class="cell">
						<span class="chevron">&nbsp;›&nbsp;</span> 登录
					</div>
					<div class="inner">
						<form accept-charset="UTF-8" action="user/runLogin" class="form-horizontal" id="form_login" method="post" novalidate="novalidate">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="uname">用户名</label>
								<div class="col-sm-6">
									<input autofocus="autofocus" class="form-control" id="uname" name="uname" size="50" type="text" value="">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="user_password">密码</label>
								<div class="col-sm-6">
									<input class="form-control" id="pwd" name="pwd" size="50" type="password" value="">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<span id="submit_form" class="btn btn-primary">登录</span>
								</div>
							</div>
						</form>
					</div>
				</div>
    		</div>
    		<div class="col-sm-12 col-md-4">
    			<div class="box">
					<div class="cell">登录说明</div>
					<div class="inner">
					  <h5>1、登录名和密码是必填项</h5>
					  <h5>2、如果您注册时有输入昵称，则登陆和报名后显示昵称，否则显示登录名</h5>
					  <h5>3、输入完成后，点击回车即可正确提交</h5>
					  <h5>4、登录成功后会转向首页</h5>
					</div>
				</div>
    		</div>
    	</div>
    </div> 
    <%@ include file="/view/common/foot.jsp" %>
    <script type="text/javascript" src="js/jquery-validate.js"></script>
    <script type="text/javascript">
	    $(function () {
	    	$('#nav_login').addClass('active');
	    	$('#form_login').validate({
	    		errorElement : 'span',
	    		success : function (label) {
	    			label.addClass('success');
	    		},
	    		rules : {
	    			uname : {
	    				required : true,
	    			},
	    			pwd : {
	    				required : true,
	    			},
	    		},
	    		messages : {
	    			uname : {
	    				required : '登录名不能为空',
	    			},
	    			pwd : {
	    				required : '密码不能为空'
	    			},
	    		}
	    	});
	    	$('#submit_form').click(function(){
	    		$('#form_login').submit();
	    	});
	    	document.onkeydown = function(e){ 
	    	    var ev = document.all ? window.event : e;
	    	    if(ev.keyCode==13) {
	    	    	$('#form_login').submit();
	    	     }
	    	};
	    });
    </script>
</body></html>
