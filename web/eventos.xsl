<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-system="about:legacy-compat" />
    
    <!-- Plantilla principal que se aplica al nodo raíz del XML -->
    <xsl:template match="/gestionParque">
        
        <!-- Se define una variable con el año de los eventos a mostrar -->
        <xsl:variable name="año_actual" select="'2024'" />
        
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>
            
            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="gastrobar.xml">Gastrobar</a>
                    <a href="atracciones.xml">Atracciones</a>
                    <a href="eventos.xml">Eventos</a>
                </header>
                
                <main>
                    <h1>Eventos del 2024</h1>
                    
                    <!-- Se seleccionan solo los eventos cuyo año es 2024 -->
                    <xsl:apply-templates select="eventos/evento[substring(fechaHora, 1, 4) = $año_actual]">
                        <!-- Se ordenan los eventos por mes de manera descendente -->
                        <xsl:sort select="substring(fechaHora, 6, 2)" order="descending" data-type="number" />
                    </xsl:apply-templates>
                    
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Plantilla para cada evento -->
    <xsl:template match="eventos/evento">
        <article class="eventos">
            <!-- Se muestra la descripción del evento y el número de comentarios -->
            <h4><xsl:value-of select="descripcion"/> - <xsl:value-of select="count(comentarios/comentario)"/> Comentarios</h4>
            <ul>
                <!-- Se aplican las plantillas a los comentarios del evento -->
                <xsl:apply-templates select="comentarios/comentario"/>
            </ul>
        </article>
    </xsl:template>
    
    <!-- Plantilla para cada comentario -->
    <xsl:template match="comentarios/comentario">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
</xsl:stylesheet>
