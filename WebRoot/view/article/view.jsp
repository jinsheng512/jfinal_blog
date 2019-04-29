<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="/view/common/head.jsp" %>
		<link rel="stylesheet" href="js/ueditor143/third-party/SyntaxHighlighter/shCoreDefault.css">
	</head>
	<body>
    <!-- Fixed navbar -->
   	<%@ include file="/view/common/nav.jsp" %>

    <div class="container">
    	<div class="row">
    		<div class="col-sm-12 col-md-8">
    			<div class="box">
    				<div class="cell">
						<a href="">首页</a>
						<span class="chevron">››&nbsp;</span>
						查看博文
						<c:if test="${isAuthor}">
							<span class="pull-right">
								<a href="article/${article.id}">编辑博文</a>
							</span> 
						</c:if>
						<h1 id="topic_title">${article.title}</h1>
						<small class="topic-meta">
							发布人：${article.createUserName}&nbsp;&nbsp;
							发布时间：${fn:substring(article.createTime,0,16)}							</small>
					</div>
					<div class="inner">
						<div class="content topic_content">
							<%request.setAttribute("vEnter", "\r\n"); %>
							${fn:replace(article.content, "<br>", vEnter)}
						</div>
					</div>
    			</div>
    		</div>
    		<div class="col-sm-12 col-md-4">
    			<%@ include file="/view/common/about.jsp"%>
    			<div class="box">
					<div class="box-header">
						<div class="pull-right">
							<a href="#reply" class="dark jump_to_comment">跳到评论</a>
						</div>
						<span id="comments"></span> 评论
					</div>
					<div class="fix_cell" id="saywrap">
						<div id="clist">
						</div>
					</div>
				</div>
				<div class="box">
					<div class="box-header">
					<div class="pull-right">
					<a href="#top" class="dark back_to_top">回到顶部</a>
					</div>
					想说点什么吗，请吧，别客气
					</div>
					<div class="inner row">
						<div class="form-group">
							<div class="col-md-12" id="textContain">
								<textarea class="form-control" id="reply_content" name="comment" rows="5"></textarea>
							</div>
						</div>
						<div class="col-sm-9">
							<input class="btn btn-primary" style="margin-top:10px;" data-disable-with="正在提交" type="submit" id="comment-submit" value="发送">
						 	<span id="msg"></span>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </div> 
    <%@ include file="/view/common/foot.jsp" %>
    <script src="js/ueditor143/third-party/SyntaxHighlighter/shCore.js"></script>
    
	<script>
		$(function(){
			SyntaxHighlighter.all();
			//获取评论列表
			$.ajax({
				url : '/antsblog/comment',
				type : 'post',
				data : {objCode: 1,objId: ${article.id}},
				dataType : 'json',
				success : function(data){ 	
					count=0;
					$(data).each(function(i,val) {
						var createUserName=val.createUserName;
						var	html="<div class='cell hoverable reply' id='comment_988'>"+
									"<div class='row'>"+
									"<div class='col-xs-12 col-sm-12 col-md-12 paddingleft15'>"+
										"<span class='pull-right' id='r1'>"+
										"<a href='#reply' class='clickable startbbs' data-mention='"+createUserName+"' onclick=replyOne('"+createUserName+"')>回复</a></span>"+
										"<strong>"+createUserName+"</strong>";
										if(val.createTime!=null){
											html+="<span>&nbsp;&nbsp;"+val.createTime.substring(0,16)+"</span>";
										}
										html+="<div class='content reply_content'>"+val.content+"</div>"+
									"</div>"+
									"</div>"+
								 "</div>";
						$('#clist').append(html);
						count++;
					});
					$('#comments').html(count);
				}
			});
			$('#comment-submit').click(function(){
				var uid='<%=session.getAttribute("uid")%>';
				var uname='<%=session.getAttribute("uname")%>';
				if(uid==''||uid=='null'){
					alert('请先登录吧，不然我不知道你是哪个哦');
					return;
				}
				var content=$('#reply_content').val();
				if(content==''){
					alert('写点什么吧，评论内容不能为空');
					return;
				}
				$('#comment-submit').attr('disabled','disabled');
				setTimeout(function(){
					$('#comment-submit').removeAttr('disabled');
					},10000);
				$.ajax({
					url : '/antsblog/comment/add',
					type : 'post',
					data : {objCode: 1,objId:${article.id},content:content},
					dataType : 'json',
					success : function(r){ 	
						if(r.success){
							var	html="<div class='cell hoverable reply' id='comment_988'>"+
										"<div class='row'>"+
										"<div class='col-xs-11 col-sm-11 col-md-11 paddingleft15'>"+
											"<span class='pull-right' id='r1'>"+
											"<a href='#reply' class='clickable startbbs' data-mention='"+uname+"' onclick=replyOne('"+uname+"')>回复</a></span>"+
											"<strong>"+uname+"</strong>"+
											"<span>&nbsp;&nbsp;刚刚</span>"+
											"<div class='content reply_content'>"+content+"</div>"+
										"</div>"+
										"</div>"+
									 "</div>";
							$('#clist').append(html);
							count++;
							$('#comments').html(count);
							$('#reply_content').val('');
						}
						alert(r.msg);
					}
				});
			});
		});
		function replyOne(username){
		    var replyContent = $("#reply_content");
		    var oldContent = replyContent.val();
		    var prefix = "@" + username + " ";
		    var newContent = '';
			if(oldContent.length > 0){
			    if (oldContent != prefix) {
			        newContent = oldContent + "\n" + prefix;
			    }
			} else {
			    newContent = prefix;
			}
			replyContent.focus();
			replyContent.val(newContent);
		}
	</script>
</body></html>