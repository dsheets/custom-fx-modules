<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="*|node()">
  <xsl:copy>
    <xsl:copy-of select="@*" />
    <xsl:apply-templates select="node()" />
  </xsl:copy>
</xsl:template>

<xsl:template match="title" mode="strip">
  <xsl:copy-of select="text()|*/text()" />
</xsl:template>

<xsl:template match="title">
  <h3><xsl:apply-templates select="node()"/></h3>
</xsl:template>

<xsl:template match="proposal">
  <html>
    <head>
      <title><xsl:apply-templates select="title" mode="strip" /></title>
      <style type="text/css">
        #version { margin-bottom: 1em; }
        #abstract { font-style: italic; }
      </style>
    </head>
    <body>
      <h1><xsl:apply-templates select="title/*|title/text()" /></h1>
      <h2>
        <xsl:apply-templates select="author/text()" />,
        <xsl:apply-templates select="organization/text()" />
      </h2>
      <article>
        <div id="version">
          <xsl:apply-templates select="date/text()" />;
          revision <xsl:apply-templates select="revision/text()" />
        </div>
        <div id="abstract">
          <xsl:apply-templates select="article/abstract/node()" />
        </div>
        <xsl:apply-templates select="article/section" />
      </article>
    </body>
  </html>
</xsl:template>
  
</xsl:stylesheet>
