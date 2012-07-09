<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html lang="zh_cn">
	<head>  
        <title>DigiFlow</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=3.0, user-scalable=yes"/>
		<meta name="format-detection" content="telephone=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" /> 
		<meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
		<link rel="apple-touch-icon-precomposed" href="icon.png" /> 
		<link rel="apple-touch-startup-image" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)" href="loading_1024_748.png"/>
		<link rel="apple-touch-startup-image" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)" href="loading_768_1004.png"/>
		<link rel="apple-touch-startup-image" media="screen and (max-device-width: 320px)" href="loading_320_480.png"/>
		<link rel="stylesheet"  href="/cssjs/jquery.mobile-1.0.1.css" />
		<link rel="stylesheet" href="/cssjs/stanford.css" />
		<script type="text/javascript">
			if(window.navigator.userAgent.match(/iPad/i) || window.navigator.userAgent.match(/iPad/i) || window.navigator.userAgent.match(/iPod/i)) {
				document.write('<link href="/view/i.css" rel="stylesheet" type="text/css">');
			}else if(window.navigator.userAgent.match(/android/i)) {
				document.write('<link href="/view/a.css" rel="stylesheet" type="text/css">');
                
			}else{
				document.write('<link href="/view/t.css" rel="stylesheet" type="text/css">');
			}
		</script>
		<script src="/cssjs/jquery.js"></script>
		<script src="/cssjs/jquery.cookie.js"></script>
		<script>
			$(document).bind("mobileinit", function(){
				$.mobile.defaultPageTransition="slide"; 
				$.mobile.loadingMessage = "载入中...";
				$.mobile.page.prototype.options.backBtnText = "后退";
			});
			function MoveIn(){
				this.path = '';
			}
			MoveIn.prototype.viewfile = function(url){
				this.path = url;
				$.mobile.changePage('/view/file.html', {
					reverse: false,
					changeHash: false
				});
			}
			MoveIn.prototype.getpath  = function(){
				return this.path;
			}
			var action = new MoveIn();
		</script>
	<script src="../cssjs/jquery.mobile-1.0.1.js"></script>
    <style>
		.ui-header{
			position:fixed;
		}
	</style>
    </head>
	<body>
		<div data-role="page" id="home" data-dom-cache="true">
			<div data-role="header" style="height:10px;">
				<h1> </h1>
			</div>
			<div data-role="content" align="center">
				<div align="center">
					<img src="/view/dflogo.png"/>
				</div>
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">欢迎您!</li>
					<li><a href="/view/digi/todosmobile/Produce/DigiFlowMobileJC.nsf/dataformserver?openform&thserver=&thdir=DFMessage&thdb=dfmsg_<%=request.getParameter("itcode") %>.nsf&thview=vwTaskUnDoneForMobile&bdoptdesname=%E5%BE%85%E5%8A%9E%E4%BB%BB%E5%8A%A1"><h3>待办事宜</h3><p></p></a></li>
					<!--
					<li><a href="/view/digi/dones/DFMessage/dfmsg_<%=request.getParameter("itcode") %>.nsf/taskByDateDownDoneView?readviewentries?login&start=1&count=5"><h3>已办事宜</h3><p></p></a></li>
					-->
					<li><a href="/view/digi/newslist/Produce/DigiFlowMobile.nsf/agGetViewData?openagent&login&0.30080900634742125&server=&dbpath=Application/DigiFlowInfoPublish.nsf&view=InfoByDateView_2&thclass=Dir01$&page=1&count=15"><h3>企业新闻</h3><p></p></a></li>
					<li><a href="/view/digi/messagelist/Produce/DigiFlowMobile.nsf/agGetViewData?openagent&login&0.6922244625974295&server=&dbpath=DFMessage/dfmsg_admin.nsf&view=vwMsgUnRdForMobile&thclass=&page=1&count=15"><h3>个人消息</h3><p></p></a></li>
				</ul>
			</div>
		</div>
		<!-- 首页面 -->
		
	</body>
</html>