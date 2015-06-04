<?xml version="1.0" encoding="UTF-8"?>

<!-- Ejemplo pag. 387 libro XSLT -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="html" />

	<xsl:template match="report">
		<html>
			
			<head>
				<xsl:call-template name="report-title">
					<xsl:with-param name="in-heading" select="true()" />		
					<xsl:with-param name="title" select="title" />
					
					<!--  Llamamos por promera vez al template report-title:
					  mediante los parámetros modificamos su comportamiento en función
					  de la posición del documento desde la que es llamado. -->
					
					<!--  Podemos pasarle parámetros a los templates.
						  En XSLT 2.0, the <xsl:param> element has a required attribute. It is a fatal error to
						  call a template without passing values for all of the required parameters. -->
					
					<!-- El parámetro in-heading indica si estamos en la sección head del documento html.
						 El segundo parámetro es el título del report -->
					
					<!-- Función true() pág. 851 libro XSLT: no existe "true" o "false" -->
					
					<!-- with-param defines a parameter to be passed to a template. 
						 When the template is invoked, values can be passed in for the parameter.
						 If the <xsl:with-param> element is empty and has a select attribute, 
						 the value of the parameter is the value of the select attribute.  -->
					
				</xsl:call-template>
			</head>
			
			<body>
				<xsl:call-template name="insert-header" />
				
				<xsl:call-template name="report-title">
				<!--  Llamamos por segunda vez al template report-title:
					  mediante los parámetros modificamos su comportamiento en función
					  de la posición del documento desde la que es llamado. -->
								
					<xsl:with-param name="in-heading" select="false()" />
					<xsl:with-param name="title" select="title" />
				
					<!-- El parámetro in-heading indica si estamos en la sección head del documento html.
						 El segundo parámetro es el título del report -->
					
					<!-- No es necesaria indicar la ruta absoluta hasta el elemento título: 
					el procesador incorpora templates por defecto para procesar todo el
					 contenido del fichero -->
				
				</xsl:call-template>
				<table cellpadding="5">
					<xsl:call-template name="table-heading" />
					<xsl:apply-templates select="brand" />
				</table>
				<xsl:call-template name="insert-footer" />
			</body>
			
		</html>
	</xsl:template>
	
	
	<xsl:template name="report-title">
		<xsl:param name="in-heading" />
		<xsl:param name="title" />
		
		<!-- xsl:param pag 489  
			Defines the name and value of a parameter to be used in a stylesheet. 
			This element can appear as a top-level element or inside the <xsl:template> element. 
			If the xsl:param appears as a top-level element, it is a global parameter, 
			visible to all areas of the stylesheet. 
			The default value of the parameter can be defined in one of two ways: 
			specified in the select attribute or defined inside the xsl:param element itself  -->
				
		<xsl:choose>
			<xsl:when test="$in-heading">
			<!--  Según el valor de in-heading, el template genera un elemento html <title>
					o <h1> -->
				<title>
					<xsl:value-of select="$title" />
				</title>
			</xsl:when>
			<xsl:otherwise>
				<h1>
					<xsl:value-of select="$title" />
				</h1>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="table-heading">
		<tr>
			<td style="background: black; color: white; font-weight: bold;">
				Brand</td>
			<td style="background: black; color: white; font-weight: bold;">
				Sales</td>
		</tr>
	</xsl:template>
	
	<xsl:template name="insert-header">
		<header style="font-size: 75%; font-style: italic;">
			This confidential report is the property of DougCo, Inc.
		</header>
		<hr />
	</xsl:template>
	
	<xsl:template name="insert-footer">
		<hr />
		<p style="font-size: 75%; font-style: italic;">
			© Copyright 2008, DougCo, Inc.
		</p>
	</xsl:template>
	
	<xsl:template match="brand">
		<tr>
			<td>
				<xsl:value-of select="name" />
			</td>
			<td>
				<xsl:value-of select="units" />
			</td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>