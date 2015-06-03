<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<html>
			<head>
				<title>Using the mode attribute</title>
			</head>
			<body style="font-family: sans-serif;">
				<table style="text-align: center;" border="1">
					<tr style="font-weight: bold; font-size: 150%;">
						<td width="30%">Default mode</td>
						<td width="30%">Blue mode</td>
						<td width="30%">Red mode</td>
					</tr>
					<tr>
						<td>
							<p>
								<xsl:apply-templates select="cars/manufacturer" />  <!-- verde -->
								<!--  The first template doesn’t have a mode attribute, 
								so it is the default template  -->
							</p>
						</td> 
						<td>

							<p>
								<xsl:apply-templates mode="blue" select="cars/manufacturer" />
							</p>
						</td>
						<td>
							<p>
								<xsl:apply-templates mode="red" select="cars/manufacturer" />
							</p>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="manufacturer">  <!-- verde -->
	<!--  doesn’t have a mode attribute, so it applies
			to the default mode. When we use <xsl:apply-templates mode="#default" ...> ,
			this template is the one that gets invoked. -->
		<span style="color: green; font-style: italic; font-size: 125%;">
		<!-- Si eliminamos apply-templates, eliminamos del el valor de car del streaming de salida  -->
			<xsl:apply-templates select="car" />
		</span>
	</xsl:template>
	
	<xsl:template match="manufacturer" mode="blue">
		<span style="color: blue; font-weight: bold;">
			<xsl:apply-templates select="car" />
			<!--  FOO no aparece porque no pasa el filtro apply-templates select="car" -->			
		</span>
	</xsl:template>
	
	<xsl:template match="manufacturer" mode="red">
		<span
			style="color: red; font-family: monospace; font-weight: bold;
font-size: 150%;">
			<xsl:apply-templates select="car" />
			<!--  FOO no aparece porque no pasa el filtro apply-templates select="car" -->
		</span>
	</xsl:template>
	
	<!--  si eliminamos template match="car", sólo eliminamos el formato al valor de car, pero 
	siguen presenten en el streaming de salida -->
	<xsl:template match="car">
		<xsl:value-of select="." />
		<br />
	</xsl:template>
	
	<!--  Has de modificar el horroroso código HTML de este ejemplo del libro para crear una tabla óptima
	desde el punto de vista semántico y del código (CSS y HTML). 
		Aplica los estilos desde una hora de estilos CSS externa (y no embebidos en el HTML como en el ejemplo). -->

</xsl:stylesheet>