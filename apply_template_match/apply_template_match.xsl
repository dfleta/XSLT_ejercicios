<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>

	<xsl:template match="/">
		<html>
			<body>
				<h2>Coches Chevrolet:</h2>
				<xsl:apply-templates /> <!-- Si eliminamos esta instrucción, no hay stream: es un select -->
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="//manufacturer[@name='Chevrolet']/car">
		<p>Carro:<!-- verde -->
			<span style="color:#00ff00">
				<xsl:value-of select="." />
			</span>
		</p>
	</xsl:template> 
	

	<!-- No es necesario indicar la ruta absoluta hasta el elemento car: el procesador
	incorpora templates por defecto para procesar todo el contenido del fichero -->
	
	<!--  si eliminamos los templates, los elementos car y faa siguen apareciendo en el 
	output stream: template match sólo da formato, nunca filtra del stream -->
	
	<xsl:template match="car">
		<!-- esta regla es menos específica que [1], por lo que los Chevrolet seran verdes -->
		<p>Carro:<!-- [2] colorao -->
			<span style="color:#ff0000">
				<xsl:value-of select="." />
			</span>
		</p>
	</xsl:template>
	  
	<xsl:template match="faa">
		<p>Sorpresa!:
			<xsl:value-of select="." />
		</p>
	</xsl:template>

	<xsl:template match="foo">
		<p>Foo:
			<span style="color:#ff0000">
				<xsl:value-of select="." />
			</span>
		</p>
	</xsl:template>

</xsl:stylesheet>