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
			<head></head>
			<body>
				<div id="list" data-role="page" class="type-home">
					<div data-role="header">
						<a data-icon="home" data-role="button" data-rel="back">返回</a>
						<h1>待办事宜</h1>
					</div><!-- /header -->
				
					<div data-role="content" align="center">
						<script>
							function changepage(url){
								$.mobile.changePage(url, {changeHash:true, type: "post"});
							}
						</script>
						<ul data-role="listview" data-inset="true">
							<xsl:apply-templates select="//table[@id='datalist']//tr[position()&gt;1]" />
							<xsl:if test="count(//table[@id='datalist']//tr[position()&gt;1])=0">
								<li><a>无内容</a></li>
							</xsl:if>
						</ul>
					</div><!-- /content -->
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="tr">
		<li>
			<a  href="javascript:void(0)" onclick="changepage('/view/digi/contentmobile{td[4]/a/@href}')" data-icon="arrow-r" data-iconpos="right">
				<h3><xsl:value-of select="td[2]/."/></h3>
				<p>
					时间:<font color="#0080FF"><xsl:value-of select="td[1]/."/></font>
					状态:<font color="#0080FF"><xsl:value-of select="td[3]/."/></font>
				</p>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>