<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

    <!-- Output = HTML -->
    <xsl:output method="html" indent="yes"/>

    <!-- Les variables des fichiers de sortie-->
    <xsl:variable name="home">
        <xsl:value-of select="concat('figures_infernales_home', '.html')"/>
    </xsl:variable>

    <xsl:variable name="chap1">
        <xsl:value-of select="concat('figures_infernales_chapitre_1', '.html')"/>
    </xsl:variable>

    <xsl:variable name="chap2">
        <xsl:value-of select="concat('figures_infernales_chapitre_2', '.html')"/>
    </xsl:variable>

    <xsl:variable name="chap3">
        <xsl:value-of select="concat('figures_infernales_chapitre_3', '.html')"/>
    </xsl:variable>

    <xsl:variable name="chap4">
        <xsl:value-of select="concat('figures_infernales_chapitre_4', '.html')"/>
    </xsl:variable>

    <xsl:variable name="personnages">
        <xsl:value-of select="concat('figures_infernales_liste_personnages', '.html')"/>
    </xsl:variable>

    <xsl:variable name="lieux">
        <xsl:value-of select="concat('figures_infernales_liste_lieux', '.html')"/>
    </xsl:variable>

    <xsl:variable name="lexique">
        <xsl:value-of select="concat('figures_infernales_lexique', '.html')"/>
    </xsl:variable>

    <!-- Les variables avec les chemins de retour -->

    <xsl:variable name="return_home">

        <i>
            <a href="{concat('./', $home)}">Accueil</a>
        </i>
    </xsl:variable>

    <xsl:variable name="return_perso">

        <i>
            <a href="{concat('./', $personnages)}">Consulter la liste des personnages</a>
        </i>
    </xsl:variable>

    <xsl:variable name="return_lieux">

        <i>
            <a href="{concat('./', $lieux)}">Consulter la liste des lieux</a>
        </i>
    </xsl:variable>

    <xsl:variable name="return_lexique">

        <i>
            <a href="{concat('./', $lexique)}">Consulter le lexique</a>
        </i>

    </xsl:variable>

    <xsl:variable name="return_chap1">

        <i>
            <a href="{concat('./', $chap1)}">Lire le chapitre 1</a>
        </i>
    </xsl:variable>

    <xsl:variable name="return_chap2">

        <i>
            <a href="{concat('./', $chap2)}">Lire le chapitre 2</a>
        </i>
    </xsl:variable>

    <xsl:variable name="return_chap3">

        <i>
            <a href="{concat('./', $chap3)}">Lire le chapitre 3</a>
        </i>

    </xsl:variable>

    <xsl:variable name="return_chap4">

        <i>
            <a href="{concat('./', $chap4)}">Lire le chapitre 4</a>
        </i>
    </xsl:variable>


    <!-- Variable de titre -->
    <xsl:variable name="titre">
        <xsl:value-of select="//sourceDesc//titleStmt/title[@type = 'subtitle']"/>
    </xsl:variable>

    <!-- Les variables de header et footer -->
    <!-- HEADER -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>
                <xsl:value-of select="$titre"/>
            </title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="$titre"/>
                    <xsl:text>, nouvelle issue du recueil </xsl:text>
                    <xsl:value-of select="//sourceDesc//titleStmt/title[@type = 'main']"/>
                    <xsl:text> par </xsl:text>
                    <xsl:value-of select="//titleStmt/author"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/respStmt/persName"/>
                </xsl:attribute>
            </meta>
            <link rel="icon" type="image/x-icon" href="favicon.ico"/>
            <link rel="stylesheet" type="text/css" href="style.css"/>
        </head>
    </xsl:variable>

    <!-- FOOTER -->
    <xsl:variable name="footer">
        <footer>
            <p>??dition r??alis??e par <xsl:value-of select="//titleStmt/respStmt/persName"/> ?? partir
                de l'<xsl:value-of select="replace(//respStmt/resp, 'Encodage', 'encodage')"/></p>
            <p>
                <xsl:value-of select="//licence"/>
            </p>


        </footer>
    </xsl:variable>

    <!-- Variable de la barre de navigation -->
    <xsl:variable name="body_header">
        <header>
            <a href="https://fr.wikipedia.org/wiki/Ry%C5%ABnosuke_Akutagawa">
                <img src="t%C3%A9l%C3%A9chargement.jpeg" alt="photo de Ry??nosuke Akutagawa"/>
            </a>
            <nav>
                <xsl:copy-of select="$return_home"/>
                <xsl:copy-of select="$return_chap1"/>
                <xsl:copy-of select="$return_chap2"/>
                <xsl:copy-of select="$return_chap3"/>
                <xsl:copy-of select="$return_chap4"/>
                <xsl:copy-of select="$return_perso"/>
                <xsl:copy-of select="$return_lieux"/>
                <xsl:copy-of select="$return_lexique"/>
            </nav>


        </header>
    </xsl:variable>

    <!-- Variable du titre de la page -->
    <xsl:variable name="body_titre">
        <div class="top">
            <h1>
                <xsl:value-of select="$titre"/>
            </h1>
            <h2>
                <xsl:value-of select="//sourceDesc//titleStmt/title[@type = 'main']"/>
            </h2>
            <h4 class="author">
                <xsl:value-of select="//fileDesc/titleStmt//author"/>
            </h4>
        </div>

    </xsl:variable>

    <!-- Le template qui appelle les templates -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="chapitre_1"/>
        <xsl:call-template name="chapitre_2"/>
        <xsl:call-template name="chapitre_3"/>
        <xsl:call-template name="chapitre_4"/>
        <xsl:call-template name="liste_personnages"/>
        <xsl:call-template name="liste_lieux"/>
        <xsl:call-template name="lexique"/>
    </xsl:template>

    <!-- Le template de la page d'accueil -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>

                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h4>
                            <xsl:text>
                        Bienvenue sur l'??dition en ligne de 
                    </xsl:text>
                            <xsl:value-of select="$titre"/>
                            <xsl:text> !</xsl:text>
                        </h4>
                        <div class="intro">
                            <p>
                                <b>R??sum??</b> : Yoshihid?? est un peintre ?? la cour du Seigneur de
                                Horikawa. Venez d??couvrir l'histoire envo??tante du <i>Paravent des
                                    Figures Infernales</i>, une oeuvre macabre command??e par
                                Horikawa...</p>
                        </div>
                    </main>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Les templates des chapitres -->
    <!-- CHAPITRE 1 -->
    <xsl:template name="chapitre_1">
        <xsl:result-document href="{$chap1}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>

                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3>
                            <xsl:text>Chapitre </xsl:text>
                            <xsl:value-of select="//div2[@n = '1']/head"/>
                        </h3>

                        <div class="texte">
                            <xsl:for-each select=".//div2[@n = '1']/p">
                                <p>
                                    <xsl:value-of select="."/>
                                    
                                </p>
                            </xsl:for-each>
                        </div>
                    </main>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- CHAPITRE 2 -->
    <xsl:template name="chapitre_2">
        <xsl:result-document href="{$chap2}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>

                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3>
                            <xsl:text>Chapitre </xsl:text>
                            <xsl:value-of select="//div2[@n = '2']/head"/>
                        </h3>

                        <div class="texte">
                            <xsl:for-each select=".//div2[@n = '2']/p">
                                <p>
                                    <xsl:value-of select="."/>


                                </p>
                            </xsl:for-each>
                        </div>
                    </main>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- CHAPITRE 3 -->
    <xsl:template name="chapitre_3">
        <xsl:result-document href="{$chap3}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>

                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3>
                            <xsl:text>Chapitre </xsl:text>
                            <xsl:value-of select="//div2[@n = '3']/head"/>
                        </h3>

                        <div class="texte">
                            <xsl:for-each select=".//div2[@n = '3']/p">
                                <p>
                                    <xsl:value-of select="."/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </main>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- CHAPITRE 4 -->
    <xsl:template name="chapitre_4">
        <xsl:result-document href="{$chap4}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>

                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3>
                            <xsl:text>Chapitre </xsl:text>
                            <xsl:value-of select="//div2[@n = '4']/head"/>
                        </h3>

                        <div class="texte">
                            <xsl:for-each select=".//div2[@n = '4']/p">
                                <p>
                                    <xsl:value-of select="."/>
                                </p>
                            </xsl:for-each>
                        </div>
                    </main>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Un template pour la liste des personnages -->
    <xsl:template name="liste_personnages">
        <xsl:result-document href="{$personnages}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>

                <body>
                    <xsl:copy-of select="$body_header"/>

                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <!-- Premi??re partie : la liste des personnages -->
                        <h3 class="big"> Liste des personnages </h3>
                        <div class="list">
                            <xsl:for-each select="//listPerson/person">

                                <!-- Une exception pour le personnage de Yoshihid??, qui a des surnoms -->
                                <xsl:choose>
                                    <xsl:when test="./@xml:id = 'Yoshihid??'">
                                        <p>
                                            <xsl:value-of select="./persName/surname"/>
                                            <xsl:text> </xsl:text>


                                        </p>
                                        <p class="note"> On le surnomme aussi <xsl:for-each
                                                select=".//addName">
                                                <xsl:choose>
                                                  <xsl:when test=".[text() = 'Chira Eiju']">
                                                  <i>
                                                  <xsl:value-of select="."/>.</i>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <i><xsl:value-of select="."/>, </i>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </p>


                                    </xsl:when>

                                    <!-- La r??gle pour tous les autres personnages -->
                                    <xsl:otherwise>

                                        <p>
                                            <xsl:value-of select="./persName"/>

                                        </p>

                                    </xsl:otherwise>
                                </xsl:choose>

                            </xsl:for-each>
                        </div>

                        <!-- Deuxi??me partie : le contenu de la balise <listRelation/> -->
                        <h3 class="big">Les relations entre les personnages</h3>
                        <div class="list">
                            <xsl:for-each select="//listRelation/relation">

                                <!-- J'ai d?? faire une balise <xsl:choose/> pour chaque relation car elles sont toutes diff??rentes et mon encodage ne se pr??te pas facilement ?? une seule r??gle pour toutes les relations. -->
                                <xsl:choose>
                                    <xsl:when test="./@type = 'hierarchy'">
                                        <p>
                                            <xsl:value-of select="translate(./@active, '#', ' ')"/>
                                            est le <xsl:value-of
                                                select="replace(./@name, 'lord', 'Seigneur')"/> de
                                            Yoshihid?? et sa fille. </p>
                                    </xsl:when>
                                    <xsl:when test="./@type = 'family' and ./@active = 'Horikawa'">
                                        <p>
                                            <xsl:value-of select="translate(./@active, '#', ' ')"/>
                                            a deux enfants : le prince et la princesse. </p>
                                    </xsl:when>
                                    <xsl:when test="./@type = 'family' and ./@active = 'Yoshihid??'">
                                        <p>
                                            <xsl:value-of select="translate(./@active, '#', ' ')"/>
                                            a une fille unique. </p>
                                    </xsl:when>
                                    <xsl:when test="./@type = 'possession'">
                                        <p>
                                            <xsl:value-of select="translate(./@active, '#', ' ')"/>
                                            poss??de un animal de compagnie, un singe. </p>
                                    </xsl:when>
                                    <xsl:when test="./@type = 'friendship'">
                                        <p> La fille de Yoshihid?? et le singe sont amis. </p>
                                    </xsl:when>
                                    <xsl:when test="./@type = 'work'">
                                        <p> La fille de Yoshihid?? est au service de <xsl:value-of
                                                select="translate(./@active, '#', ' ')"/>. </p>
                                    </xsl:when>
                                    <xsl:when test="./@type = 'enmity'">
                                        <p> Yoshikawa et Yoshihid?? sont ennemis. </p>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                        </div>

                    </main>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Le template pour la liste des lieux -->
    <xsl:template name="liste_lieux">
        <xsl:result-document href="{$lieux}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>

                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3 class="big"> Liste des lieux mentionn??s </h3>
                        <div class="list">
                            <xsl:for-each select=".//listPlace/place">

                                <p>
                                    <xsl:value-of select="./placeName/name"/>
                                </p>
                                <xsl:if test="./placeName/note">
                                    <p class="note">
                                        <xsl:value-of select=".//note"/>
                                    </p>
                                </xsl:if>

                            </xsl:for-each>
                        </div>
                    </main>

                    <xsl:copy-of select="$footer"/>

                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Le template pour le lexique -->
    <xsl:template name="lexique">
        <xsl:result-document href="{$lexique}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>

                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_titre"/>
                        <h3> Lexique </h3>

                        <!-- La r??gle pour afficher chaque entr??e du dictionnaire -->
                        <xsl:for-each select="//div1[@type = 'dictionnary']/div2">
                            <h4 class="lexique">
                                <xsl:value-of select="./head"/>
                            </h4>
                            <xsl:for-each select=".//entryFree">
                                <div class="dico">
                                    <xsl:if test="./form">
                                        <h5>
                                            <xsl:for-each select=".">
                                                <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:copy select=".//parent::entryFree/@source"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="./form"/>
                                                </xsl:element>
                                            </xsl:for-each> : </h5>
                                    </xsl:if>
                                    <p class="def">
                                        <xsl:value-of select="./text()"/>
                                        <xsl:value-of select="./sense"/>

                                        <!-- La r??gle pour afficher des liens qui renvoient aux chapitres concern??s. -->

                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:choose>
                                                  <xsl:when test="./parent::div3/@n = '1'">
                                                  <xsl:text>./</xsl:text>
                                                  <xsl:value-of select="$chap1"/>
                                                  </xsl:when>
                                                  <xsl:when test="./parent::div3/@n = '2'">
                                                  <xsl:text>./</xsl:text>
                                                  <xsl:value-of select="$chap2"/>
                                                  </xsl:when>
                                                  <xsl:when test="./parent::div3/@n = '3'">
                                                  <xsl:text>./</xsl:text>
                                                  <xsl:value-of select="$chap3"/>
                                                  </xsl:when>
                                                  <xsl:when test="./parent::div3/@n = '4'">
                                                  <xsl:text>./</xsl:text>
                                                  <xsl:value-of select="$chap4"/>
                                                  </xsl:when>
                                                </xsl:choose>
                                            </xsl:attribute>
                                            <xsl:value-of select="parent::div3/@n"/>
                                        </a>

                                    </p>
                                </div>
                            </xsl:for-each>
                        </xsl:for-each>

                        <!-- Une r??gle ?? part pour le contenu de la balise <listObject/> qui n'a pas la m??me structure que le reste du dictionnaire -->

                        <xsl:for-each
                            select="//div1[@type = 'dictionnary']/div2/div3/head[text() = 'Les oeuvres de Yoshihid??']">
                            <h4 class="lexique">
                                <xsl:value-of select="."/>
                            </h4>
                            <div class="dico">
                                <xsl:for-each select="./following-sibling::listObject//objectName">
                                    <p class="def">
                                        <xsl:value-of select="."/>
                                    </p>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:choose>
                                                <xsl:when test="./parent::div3/@n = '1'">
                                                  <xsl:text>./</xsl:text>
                                                  <xsl:value-of select="$chap1"/>
                                                </xsl:when>
                                                <xsl:when test="./parent::div3/@n = '2'">
                                                  <xsl:text>./</xsl:text>
                                                  <xsl:value-of select="$chap2"/>
                                                </xsl:when>
                                                <xsl:when test="./parent::div3/@n = '3'">
                                                  <xsl:text>./</xsl:text>
                                                  <xsl:value-of select="$chap3"/>
                                                </xsl:when>
                                                <xsl:when test="./parent::div3/@n = '4'">
                                                  <xsl:text>./</xsl:text>
                                                  <xsl:value-of select="$chap4"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <xsl:value-of select="parent::div3/@n"/>
                                    </a>

                                </xsl:for-each>
                            </div>
                        </xsl:for-each>
                    </main>



                    <xsl:copy-of select="$footer"/>

                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
