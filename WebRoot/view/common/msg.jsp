<%@ page language="java" pageEncoding="utf-8"%>
<base href="${base_path}/" />
<%=request.getAttribute("msg") %>
<script type="text/javascript">
	window.setTimeout("window.location='<%=request.getAttribute("redirectPage")%>'",1000); 
</script>
