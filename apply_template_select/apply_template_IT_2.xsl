<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

		<xsl:template match="/">
		  <html>
			  <body>
				  <h2>My CD Collection</h2> 
				  <!-- Del stream filtramos solo los cd's en italiano--> 
				  <xsl:apply-templates select="//cd[title[@lang='IT']]"/>  
			  </body>
		  </html>
		</xsl:template>

		
		<xsl:template match="title">
		  <p>Title: 
		  	<span style="color:#ff0000">
		 	<xsl:value-of select="."/></span>
		  </p>
		</xsl:template>
		
		<xsl:template match="artist">
		  <p>Artist: 
		  	<span style="color:#00ff00">
		  	<xsl:value-of select="."/></span>
		  </p>
		</xsl:template>

		<!-- El resto de hijos de cd siguen en el stream sin aplicar formato -->

</xsl:stylesheet>

