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
						<span class="chevron">&nbsp;›&nbsp;</span> 注册
					</div>
					<div class="inner">
						<form id="form_act" accept-charset="UTF-8" action="user/runRegis" class="form-horizontal" method="post" novalidate="novalidate">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="uname">用户名</label>
								<div class="col-sm-6">
									<input autofocus="autofocus" class="form-control" id="uname" name="uname" size="50" type="text" value="">
								</div>
								<span class="help-inline red">*</span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="user_password">密码</label>
								<div class="col-sm-6">
									<input class="form-control" id="pwd" name="pwd" size="50" type="password" value="">
								</div>
								 <span class="help-inline red">*</span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="email">电子邮件</label>
								<div class="col-sm-6">
									<input class="form-control" id="email" name="email" size="50" type="email">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="nickname">
									昵称
								</label>
								<div class="col-sm-6">
									<input class="form-control" id="nickname" name="nickname" size="50">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-2">
									<span id="submit_form" class="btn btn-success">注册</span>
								</div>
							</div>
						</form>
					</div>
				</div>
    		</div>
    		<div class="col-sm-12 col-md-4">
    			<div class="box">
					<div class="cell">注册说明</div>
					<div class="inner">
					  <h5>1、登录名和密码是必填项</h5>
					  <h5>2、邮箱可用于找回密码，建议填写</h5>
					  <h5>3、输入昵称，则用户信息使用昵称，否则使用用户名;昵称可以修改，用户名不能修改</h5>
					  <h5>4、输入完成后，点击回车即可提交</h5>
					  <h5>5、注册成功后会自动登录并转向首页</h5>
					</div>
				</div>
    		</div>
    	</div>
    </div> 
	<%@ include file="/view/common/foot.jsp" %>
	<script type="text/javascript" src="js/jquery-validate.js"></script>
	<script type="text/javascript">
		$(function () {
			$('#nav_reg').addClass('active');
			$('#form_act').validate({
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
					}
				},
				messages : {
					uname : {
						required : '登录名不能为空'
					},
					pwd : {
						required : '密码不能为空'
					}
				}
			});
			$('#submit_form').click(function(){
				$('#form_act').submit();
			});
	
			document.onkeydown = function(e){ 
			    var ev = document.all ? window.event : e;
			    if(ev.keyCode==13) {
			    	$('#form_act').submit();
			     }
			}
		});
	</script>
</body></html>
