<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<html lang="zh_cn">
			<head>							
				<link rel="stylesheet"  href="/cssjs/jquery.mobile-1.0.1.css" />
				<link rel="stylesheet" href="/ios/ios.css" />
				<script src="/cssjs/jquery.js"></script>
				<script src="/cssjs/jquery.cookie.js"></script>
				<script src="/view/js/cherry.js"></script>
				<script src="http://mobile.sugon.com/view/mobileBridge.js"></script>
				<script src="/cssjs/jquery.mobile-1.0.1.js"></script>
			</head>
			<body>
				<div id="notice" data-role="page">
					<div data-role="content" align="center">
						<script>
							var StMsgDB = "<xsl:value-of select='translate(//input[@name="StMsgDB"]/@value, "\", "/")' />";
							var StMsgParentId = "<xsl:value-of select='translate(//input[@name="StMsgParentId"]/@value,"\","/")' />";
							<xsl:choose>
								<xsl:when test="contains(//input[@name='StMsgDB']/@value, 'DigiFlowMeetingRoomMng.nsf')">
									var domain = "/view/digi/meettingroom/";
									var url = domain + StMsgDB + "/0/" + StMsgParentId + "?opendocument&amp;login";
									
									changePageWithBridge("http://mobile.sugon.com" + url);
								</xsl:when>
								<xsl:when test="contains(//input[@name='StMsgDB']/@value, 'DigiFlowCarMng.nsf')">
									var domain = "/view/digi/carmanager/";
									var url = domain + StMsgDB + "/0/" + StMsgParentId + "?opendocument&amp;login";
									
									changePageWithBridge("http://mobile.sugon.com" + url);
								</xsl:when>
								<xsl:otherwise>
									alert('移动办公流程尚未实现！');
								</xsl:otherwise>
							</xsl:choose>
						</script>
						<ul data-role="listview" data-inset="true">
							<li data-role="list-divider"></li>
							<li>
								<div style="width:100%" align="center">
									<h3>页面跳转</h3>
								</div>
							</li>
							<li data-role="list-divider"></li>
						</ul>
					</div><!-- /content -->
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
