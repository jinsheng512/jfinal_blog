<%@ page language="java" pageEncoding="utf-8"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="">清宇技术社区</a>
		</div>
	    <div id="navbar" class="navbar-collapse collapse" style="height: 1px;">
			<ul class="nav navbar-nav">
				<li><a href="">首页</a></li>
				<li><a href="article">发表博文</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<% if(session.getAttribute("uname")==null){ %>
					<li id="nav_login"><a href="user/login">登录</a></li>
					<li id="nav_reg"><a href="user/register">注册</a></li>
				<% } else { %>
	                <li><a>欢迎&nbsp;<%=session.getAttribute("uname") %></a></li>
	                <li><a href="user/logout">注销</a></li>
	        	<% }  %>
      	  	</ul>
	    </div>
	  </div>
</nav>