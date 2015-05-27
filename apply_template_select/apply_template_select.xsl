<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h2>Coches Volkswagen:</h2>
				<xsl:apply-templates select="//manufacturer[@name='Volkswagen']" />
				<xsl:comment>Filtro sólo los fabricados por Volkswagen: el resto desaparecen del stream</xsl:comment>
				<!-- Filtro sólo los fabricados por Volkswagen: el resto desaparecen del stream -->
			</body>
		</html>
	</xsl:template>

	<xsl:template match="car">
		<p>Carro:
		<span style="color:#ff0000">
			<xsl:value-of select="." />
		</span>
		</p>
	</xsl:template>

	<xsl:template match="faa"> <!-- template match sólo da formato, nunca filtra del stream -->
		<p>Sorpresa:
			<xsl:value-of select="." />
		</p>
	</xsl:template>

</xsl:stylesheet>