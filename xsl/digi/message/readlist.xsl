<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:variable name="start"><xsl:value-of select="//input[@name='start']/@value"/></xsl:variable>
	<xsl:variable name="count"><xsl:value-of select="//input[@name='count']/@value"/></xsl:variable>
	<xsl:variable name="total"><xsl:value-of select="//input[@name='total']/@value"/></xsl:variable>
	<xsl:variable name="currentPage"><xsl:value-of select="floor($start div $count)+1"/></xsl:variable>
	<xsl:variable name="totalPage"><xsl:value-of select="floor(($total - 1) div $count)+1"/></xsl:variable>
	<xsl:variable name="nextStart"><xsl:value-of select="($currentPage * $count) + 1"/></xsl:variable>
	<xsl:variable name="preStart"><xsl:value-of select="$nextStart - $count - $count"/></xsl:variable>

	<xsl:template match="/">
		<html>
			<head>							
				<link rel="stylesheet"  href="/cssjs/jquery.mobile-1.0.1.css" />
				<link rel="stylesheet" href="/ios/ios.css" />
				<script src="/cssjs/jquery.js"></script>
				<script src="/cssjs/jquery.cookie.js"></script>
				<script src="/view/js/cherry.js"></script>
				<script src="http://mobile.sugon.com/view/mobileBridge.js"></script>
				<script src="/cssjs/jquery.mobile-1.0.1.js"></script>
				<script>
				new cherry.bridge.NativeOperation("case","setProperty",["title","已读消息"]).dispatch();
							cherry.bridge.flushOperations();
				</script>
			</head>
			<body>
				<div id="list" data-role="page" class="type-home">
					<div data-role="content" align="center">
						<script>
							function goin(user,unid){
								var url = "/view/digi/messagerouting2/DFMessage/dfmsg_"+user+".nsf/msgByDateDownView/"+unid+"?opendocument?login";
								$.get(url, function(result){
									url = "http://mobile.sugon.com" + result;
									changePageWithBridge(url);
								});
							}
							
							

						</script>
						<ul data-role="listview" data-inset="true">
							<xsl:apply-templates select="//viewentry" />
							<xsl:if test="count(//viewentry)=0">
								<li><a>无内容</a></li>
							</xsl:if>
						</ul>
					</div><!-- /content -->
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="viewentry">
		<li>
			<a href="javascript:void(0);" onclick="goin('{//userid/text()}','{@unid}');" data-icon="arrow-r" data-iconpos="right">
				<xsl:if test="contains(entrydata[2]/.,'CDATA[')">
					<h3><xsl:value-of select="substring-before(substring-after(entrydata[2]/.,'CDATA['), ']]')"/></h3>
					<p>
						时间:<font color="#0080FF"><xsl:value-of select="substring-before(substring-after(entrydata[1]/.,'CDATA['), ']')"/></font>
					</p>
				</xsl:if>
				<xsl:if test="not(contains(entrydata[2]/.,'CDATA['))">
					<h3><xsl:value-of select="entrydata[2]/."/></h3>
					<p>
						时间:<font color="#0080FF"><xsl:value-of select="entrydata[1]/."/></font>
					</p>
				</xsl:if>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>
