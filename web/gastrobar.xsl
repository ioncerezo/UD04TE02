<?xml version="1.0" encoding="UTF-8"?>

<!--
    Nombre: Ion Cerezo
    Fecha: 10/02/2025
    Módulo: Desarrollo de aplicaciones web.
    UD: 04
    Asignatura: Lenguaje de marcas y Sistemas de gestión de la información
    Nombre del ejercicio:Tarea evaluativa 2. XSLT
    Tarea autoevaluativa: https://docs.google.com/document/d/1kqMt0Lj7MybFKydH98z9QcqLF6bdA4JeO9Y1tZT-1pU/edit?usp=sharing
    Código en vivo: https://ud-05-te-01.vercel.app/
    Repositorio: https://github.com/ioncerezo/UD05TE01
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-system="about:legacy-compat" />
    
    <!-- Plantilla principal que aplica la transformación al documento XML de gestionParque -->
    <xsl:template match="/gestionParque">
        
        <!-- Variable que almacena el prefijo para identificar nuevos elementos -->
        <xsl:variable name="prefijo_nuevo_item" select="'A'" />
        
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

                <main id="gastrobar">
                    <h1>ENTRANTES</h1>
                    
                    <!-- Itera sobre los platos que tienen la categoría 'Entrante' -->
                    <xsl:for-each select="//platos/plato[@categoria = 'Entrante']">
                        <xsl:variable name="id_codigo" select="substring(@codigo, 1, 1)"/>

                        <article class="articulo">
                            <img src="../img/{foto}" class="imagen"/>
                            
                            <!-- Mostrar icono de novedad si el código empieza por 'A' -->
                            <xsl:if test="$id_codigo = $prefijo_nuevo_item">
                                <img src="../img/icono-novedad.png" class="novedad-icono"/>
                            </xsl:if>
                            
                            <h2><xsl:value-of select="nom_plato"/></h2>
                            <h3><xsl:value-of select="precio"/>€</h3>
                        </article>
                    </xsl:for-each>
                    
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
                
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>
