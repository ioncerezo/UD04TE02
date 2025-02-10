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
                <h1>ATRACCIONES</h1>
                <table>
                    <tr>
                        <th>ATRACCION</th>
                        <th>EDAD MINIMA</th>
                        <th>PESO MAXIMO</th>
                    </tr>

                    <!-- Se recorre cada nodo 'atraccion'  -->
                    <xsl:for-each select="//atraccion">
                    
                    <!-- Se crea una variable para generar un el nombre en snake_case -->
                    <xsl:variable name="link" select="translate(nombre, ' ', '_')" />

                        <tr>
                            <td>
                                <!-- Enlace a Wikipedia basado en el nombre de la atracción -->
                                <a href="https://es.wikipedia.org/wiki/{$link}" target="_blank">
                                <xsl:value-of select="nombre"/>
                                </a>
                            </td>
                            
                            <!-- Se extraen los valores de edad mínima y peso máximo -->
                            <td><xsl:value-of select="restricciones/edadMinima"/></td>
                            <td><xsl:value-of select="restricciones/pesoMaximo"/></td>
                        </tr>
                    </xsl:for-each>

                </table>			
            </main>
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>