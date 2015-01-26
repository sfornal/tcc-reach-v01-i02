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
	
	<xsl:param name="ou:dirname" />

	<xsl:output method="xhtml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8" />

	<xsl:template match="/document">
		
		<nav class="toc">
			<p class="toc__volume">
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="$ou:dirname" />
					</xsl:attribute>
					<xsl:value-of select="config/parameter[@name='volume_name']" />
				</xsl:element>
			</p>

			<xsl:comment> ouc:div label="articles-toc" group="Everyone" button="792" break="break" </xsl:comment>
			<xsl:comment> ouc:editor csspath="/_resources/ou/editor/mag-toc-include.css" width="1020" / </xsl:comment>
			<ol class="toc__links">
			
				<xsl:apply-templates select="articles-toc/node()" mode="copy" />

			</ol>
			<xsl:comment> /ouc:div </xsl:comment>
			
			<p class="toc__archives"><a href="/magazine/archives">Archives</a></p>
		</nav>

	</xsl:template>

	<xsl:template match="element()" mode="copy" priority="1">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="attribute()|node()" mode="copy"/>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>