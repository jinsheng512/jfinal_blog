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
    			<div class="panel panel-default">
    				<div class="panel-heading">最新博文</div>
    			</div>
    			<c:forEach items="${articlePage.list}" var="article">
	    			<div class="cell topic">
						<div class="item_title">
							<h2 class="topic_title">
								<a href="article/view/${article.id}" class="startbbs topic">${article.title}</a>
							</h2>
							<div class="topic-meta">
								<span>${article.createUserName} | ${fn:substring(article.createTime, 0, 16)}</span>
							</div>
						</div>
					</div>
				</c:forEach>
    		</div>
    		<div class="col-sm-12 col-md-4">
				<%@ include file="/view/common/about.jsp"%>
    		</div>
    	</div>
    </div> 
    <%@ include file="/view/common/foot.jsp" %>
</body></html>
