<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="cc.movein.mda.system.control.Query"%>
<html lang="zh_cn">
	<head></head>
	<body>
		<div data-role="page" class="type-home">
			<div data-role="header">
				<a data-role="button" data-rel="back" data-direction="reverse">返回</a>
				<h1><span id="imgtitle" style="width:100%;" align="center"></span></h1>
			</div><!-- /header --> 
			<div data-role="content" align="center" style="margin:0;padding:0;">
				<!--
				<link rel="stylesheet"  href="/cssjs/scrollview/jquery.mobile.scrollview.css" />
				<script src="/cssjs/scrollview/jquery.easing.1.3.js"></script>
				<script src="/cssjs/scrollview/jquery.mobile.scrollview.js"></script>
				<script src="/cssjs/scrollview/scrollview.js"></script>
				-->
				<%
				Query q = Query.getInstance(request);
				String path = q.getContent();
				path = path.replace("\\", "/");
				String type = q.getContentType();
				boolean ispage = false;
				if(type.indexOf("image")!=-1){
					%>
					<div style="width:100%" align="center" style="margin:0;padding:0;">
						<img src="/view<%=path%>" width="100%"/>
					</div>
					<%
				}else if(type.indexOf(".png")!=-1){
					%>
					<div style="width:100%" align="center" style="margin:0;padding:0;">
						<img src="/view<%=path%>" width="100%"/>
					</div>
					<%
				}else if(type.indexOf("application/pdf")!=-1 || type.indexOf("application/msword")!=-1 || type.indexOf("application/octet-stream")!=-1 || type.indexOf("application/vnd.ms-powerpoint")!=-1){
					ispage = true;
					%>
					<div data-scroll="true" align="center">
						<img id="imgcontent" src="<%=q.getRequest().getRequestURI() %>?data-page=1" width="120%"/>
					</div>
					<%
				}
				%>
				<script>
					var isshowed = false;
					var currentPage = 1;
					var total = <%=q.getPageSize() %>;
					var path = "<%=q.getRequest().getRequestURI() %>";
					$("#imgtitle").html("第"+currentPage+"页/共" + total + "页");
					function changeimg(){
						$("#imgcontent").attr("src", "");
						$("#imgtitle").html("第"+currentPage+"页/共" + total + "页");
						if(path.indexOf('?')==-1){
							$("#imgcontent").attr("src", path + "?data-page=" + currentPage+"&data-cache=true").one('load',function(){$.mobile.hidePageLoadingMsg();});
						}else{
							$("#imgcontent").attr("src", path + "&data-page=" + currentPage+"&data-cache=true").one('load',function(){$.mobile.hidePageLoadingMsg();});
						}
					}
					function prewpage(){
						if(currentPage > 1){
							$.mobile.showPageLoadingMsg();
							currentPage = currentPage - 1;
							changeimg();
						}
					}
					function nextpage(){
						if(currentPage < total){
							$.mobile.showPageLoadingMsg();
							currentPage = currentPage + 1;
							changeimg();
						}
					}
				</script>
			</div><!-- /content -->
			<%if(ispage){%>
				<div data-role="footer">
					<div data-role="navbar">
						<ul>
							<li><a data-iconpos="top" data-icon="arrow-l" href="javascript:void(0);" onclick="prewpage();"></a></li>
							<li><a data-iconpos="top" data-icon="arrow-r" href="javascript:void(0);" onclick="nextpage();"></a></li>
						</ul>
					</div>
				</div>
				<!-- /footer -->
			<%}%>
		</div>
	</body>
</html>