<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">
  <!-- ==============================================
       XSLT to run the topicpull transform over
       a set of files in order to generate more
       Java profiling data.
       ============================================== -->
  
  <xsl:param name="inputDir" as="xs:string"
    select="string-join(tokenize(document-uri(.), '/')[position() lt last()], '/')"
  />
  
  <xsl:template name="run">
    <xsl:variable name="inputURI" as="xs:string"
      select="concat($inputDir, '?', 'select=*.dita')"
    />
    <xsl:for-each select="collection($inputURI)">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>