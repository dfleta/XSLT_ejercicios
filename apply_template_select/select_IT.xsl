<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<html>
			<body>
				<h2>La bella Italia:</h2>
				<xsl:apply-templates select="//cd[title[@lang='IT']]/child::*"/>
				<!-- solo los elementos hijo de aquellos cd's cantados en italiano -->
			</body>
		</html>
	</xsl:template>

	<!-- el orden en el que aparecen los elementos en el stream obviamente no se determina con match -->
	<xsl:template match="artist">
		<p>Artista:
			<span style="color:#ff0000">
				<xsl:value-of select="." />
			</span>
		</p>
	</xsl:template> 

	<xsl:template match="*">
		<!-- cualquier otro elemento que no sea artist -->
		<p>Título:
		<span style="color:#ff0000">
			<xsl:value-of select="." />
		</span>
		</p>
	</xsl:template>

</xsl:stylesheet>