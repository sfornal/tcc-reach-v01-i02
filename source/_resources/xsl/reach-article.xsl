<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "http://commons.omniupdate.com/dtd/standard.dtd">
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ou="http://omniupdate.com/XSL/Variables"
	xmlns:ouc="http://omniupdate.com/XSL/Variables"
	xmlns="http://www.w3.org/1999/xhtml"
	exclude-result-prefixes="xs ou ouc">
	
	<xsl:import href="ou-variables.xsl" />
	<xsl:import href="template-matches.xsl" />
	<xsl:import href="functions.xsl"/>
	
	<xsl:strip-space elements="*" />
	
	<xsl:output method="xhtml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8" />
			
	<xsl:template match="/document">
		<xsl:variable name="empty_string" select="''" />
		<xsl:if test="$ouc:action = 'pub'">				
				<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>@ Page Language="C#" AutoEventWireup="true" <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;%</xsl:text>@ Import Namespace="OUC" <xsl:text disable-output-escaping="yes">%&gt;</xsl:text>
		</xsl:if>

		<xsl:text disable-output-escaping="yes">
			&lt;!DOCTYPE html &gt;
			&lt;!--[if lt IE 7]&gt;&lt;html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"&gt;&lt;![endif]--&gt;
			&lt;!--[if IE 7]&gt;&lt;html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en" class="no-js lt-ie9 lt-ie8"&gt;&lt;![endif]--&gt;
			&lt;!--[if IE 8]&gt;&lt;html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en" class="no-js lt-ie9"&gt;&lt;![endif]--&gt;
			&lt;!--[if gt IE 8]&gt;&lt;!--&gt;
		</xsl:text>
		
		<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en" class="no-js">
		
		<xsl:text disable-output-escaping="yes">&lt;!--&lt;![endif]--&gt;</xsl:text>

			<head>			
				<meta charset="utf-8" />
		        <title><xsl:value-of select="title" /> - TCC Reach Magazine</title>
				
				<xsl:variable name="og-title" select="title" />
				<meta property="og:title" content="{$og-title}" />
				<meta property="og:site_name" content="TCC Reach Magazine" />
				<meta property="og:url" content="http://www.tccd.edu{$ou:path}" />
				
				<xsl:variable name="og-descr" select="metadata/meta[@name='Description']/@content" />
				<meta property="og:description" content="{$og-descr}" />
				
				<xsl:variable name="og-image" select="config/parameter[@name='article_header_image']" />
				<meta property="og:image" content="http://www.tccd.edu{$og-image}" />

				<meta property="article:author" content="https://www.facebook.com/TarrantCountyCollege" />
		
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />

				<xsl:apply-templates select="metadata/node()" mode="copy" />
		
				<link rel="shortcut icon" href="/favicon.ico" />
				<link rel="stylesheet" href="/_resources/css/tcc-reach.css" />
		
				<script src="/_resources/js/vendor/modernizr.min.js"></script>
				<xsl:text disable-output-escaping="yes">&lt;!--[if lt IE 9]&gt;</xsl:text>
					<script src="/_resources/js/vendor/respond.min.js"></script>
				<xsl:text disable-output-escaping="yes">&lt;![endif]--&gt;</xsl:text>
			</head>

			<body>
				<xsl:comment>#include virtual="/_resources/includes/analytics.inc" </xsl:comment>

				<xsl:comment>#include virtual="/_resources/includes/common-header.inc" </xsl:comment>

				<div class="page-wrap" id="top">
					
					<xsl:text disable-output-escaping="yes">&lt;!--[if lte IE 10]&gt;</xsl:text>
						<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
					<xsl:text disable-output-escaping="yes">&lt;![endif]--&gt;</xsl:text>

					<header role="banner" class="masthead">
						<h1 class="masthead__headline"><a href="/magazine/" title="TCC Reach Magazine"><img src="/images/magazine/Reach-Title-Black.png" alt="Tarrant County College Reach Magazine logo" /></a></h1>
						<h2 class="masthead__tagline">
							<xsl:value-of select="config/parameter[@name='volume_name']" />
							<br/>
							<xsl:value-of select="config/parameter[@name='volume_semester']" />
						</h2>
					</header>
					
					<div class="toc-area" id="toc">
						<a role="button" href="#toc" class="toc-expand" title="Reveal the table of contents">Table of Contents</a>
						<xsl:comment>#include file="../side-nav-toc.inc" </xsl:comment>
					</div>


					<div class="header-image">
						<xsl:element name="img">
							<xsl:attribute name="src">
								<xsl:value-of select="config/parameter[@name='article_header_image']" />
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="config/parameter[@name='article_header_image_descr']" />
							</xsl:attribute>
						</xsl:element>
					</div>

					<section role="main" class="article-page">
						
						<xsl:element name="article">
							<xsl:if test="sidebar/normalize-space(.) = $empty_string">		
								<xsl:attribute name="class">no-sidebar</xsl:attribute>
							</xsl:if>						
							
							<h1><xsl:value-of select="title" /></h1>
							
							<xsl:if test="config/parameter[@name='article_subhead']/normalize-space(.) != $empty_string">
								<h2 class="subhead"><xsl:value-of select="config/parameter[@name='article_subhead']" /></h2>
							</xsl:if>
							
							<xsl:if test="config/parameter[@name='article_byline']/normalize-space(.) != $empty_string">
								<h3 class="byline">By <xsl:value-of select="config/parameter[@name='article_byline']" /></h3>
							</xsl:if>
							
							<xsl:apply-templates select="content/node()" mode="copy" />

						</xsl:element>
						

						<xsl:if test="$ouc:action != 'pub' or sidebar/normalize-space(.) != $empty_string">
							<aside role="complimentary" class="center-text">
							
								<xsl:apply-templates select="sidebar/node()" mode="copy" />

							</aside>
						</xsl:if>

					</section>


					<xsl:comment>#include virtual="/_resources/includes/common-footer.inc" </xsl:comment>

					<xsl:comment> com.omniupdate.ob </xsl:comment><xsl:comment> /com.omniupdate.ob </xsl:comment>

				</div>

				<xsl:comment>#include virtual="/_resources/includes/common-scripts.inc" </xsl:comment>
	   			
	    		<script type="text/javascript" src="/_resources/js/tcc-reach.min.js"></script>

			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="element()" mode="copy" priority="1">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="attribute()|node()" mode="copy"/>
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>
