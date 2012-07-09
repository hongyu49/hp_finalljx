<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<html lang="zh_cn">
			<head></head>
			<body>
				<div id="notice" data-role="page">
					<div data-role="header">
						<a data-icon="home" data-role="button" data-rel="back" data-direction="reverse">返回</a>
						<h1>跳转中</h1>
					</div><!-- /header -->
					<div data-role="content" align="center">
						<script>
							var StMsgDB = "<xsl:value-of select='translate(//input[@name="StMsgDB"]/@value, "\", "/")' />";
							var StMsgParentId = "<xsl:value-of select='translate(//input[@name="StMsgParentId"]/@value,"\","/")' />";
							<xsl:choose>
								<xsl:when test="contains(//input[@name='StMsgDB']/@value, 'DigiFlowMeetingRoomMng.nsf')">
									var domain = "/view/digi/meettingroom/";
									var url = domain + StMsgDB + "/0/" + StMsgParentId + "?opendocument&amp;login";
									$.mobile.changePage(url, {
										reverse: false,
										changeHash: false
									});
								</xsl:when>
								<xsl:when test="contains(//input[@name='StMsgDB']/@value, 'DigiFlowCarMng.nsf')">
									var domain = "/view/digi/carmanager/";
									var url = domain + StMsgDB + "/0/" + StMsgParentId + "?opendocument&amp;login";
									$.mobile.changePage(url, {
										reverse: false,
										changeHash: false
									});
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
