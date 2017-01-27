<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:l2v4="http://www.sbml.org/sbml/level2/version4" 
  xmlns:l2v5="http://www.sbml.org/sbml/level3/version1/core" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:mml="http://www.w3.org/1998/Math/MathML" 
  xmlns:irt="http://irt.insilicobio.ru/ns"
  exclude-result-prefixes="xhtml">
  
  <xsl:output method="xml"/>
  <xsl:strip-space elements="*" />
  
  <!-- PARAMETERS -->
  <xsl:param name="unitDefinitions" select="false()"/> <!-- include unitDefinitions and attribute -->
  <xsl:param name="speciesTypes" select="false()"/> <!-- include speciesTypes and attribute -->
  <xsl:param name="annotation" select="false()"/> <!-- include annotation -->
  <xsl:param name="notes" select="false()"/> <!-- include notes -->
  
  <xsl:template match="@*|*">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- rename namespace of sbml -->
  <xsl:template match="l2v4:*">
    <xsl:element name="{local-name(.)}" namespace="http://www.sbml.org/sbml/level3/version1/core">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template>
  
  <!-- elements regulated by parameters -->
  <xsl:template match="l2v4:listOfUnitDefinitions">
   <xsl:if test="$unitDefinitions">
    <xsl:element name="{local-name(.)}" namespace="http://www.sbml.org/sbml/level3/version1/core">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
   </xsl:if>
  </xsl:template>
  
  <xsl:template match="@units | @substanceUnits">
   <xsl:if test="$unitDefinitions">
    <xsl:copy/>
   </xsl:if>
  </xsl:template>
  
  <xsl:template match="l2v4:listOfSpeciesTypes"/> <!-- exclude speciesTypes -->
  
  <xsl:template match="@speciesType"/> <!-- exclude speciesTypes -->
  
  <xsl:template match="@outside"/> <!-- exclude outside in compartment -->
  
  <xsl:template match="l2v4:annotation">
   <xsl:if test="$annotation">
    <xsl:element name="{local-name(.)}" namespace="http://www.sbml.org/sbml/level3/version1/core">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
   </xsl:if>
  </xsl:template>
  
  <!-- mark for included elements -->
  <xsl:template match="l2v4:*[@included='true']/l2v4:annotation/irt:references">
    <xsl:copy>
      <xsl:element name="included" namespace="http://irt.insilicobio.ru/ns"/>
      <xsl:if test="$annotation"><xsl:apply-templates select="@*|node()"/></xsl:if>
    </xsl:copy>
  </xsl:template>
  
  <!-- search species for changes in @boundaryCondition false -> true -->
  <xsl:template match="@boundaryCondition[not(../@included='true')]">
    <xsl:attribute name="boundaryCondition">
      <xsl:value-of select="'true'"/>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="l2v4:notes">
   <xsl:if test="$notes">
    <xsl:element name="{local-name(.)}" namespace="http://www.sbml.org/sbml/level3/version1/core">
     <xsl:element name="p"> <!-- add p element in xhtml namespace for sbml consistancy -->
      <xsl:apply-templates select="@*|node()"/>
     </xsl:element>
    </xsl:element>
   </xsl:if>
  </xsl:template>
  
  <xsl:template match="/l2v4:sbml">
    <xsl:element name="sbml" namespace="http://www.sbml.org/sbml/level3/version1/core">
      <xsl:attribute name="level">3</xsl:attribute>
      <xsl:attribute name="version">1</xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="l2v4:model">
    <xsl:element name="model" namespace="http://www.sbml.org/sbml/level3/version1/core">
      <xsl:attribute name="name">Model generated using IRT navigator v1.1  </xsl:attribute>
      <xsl:apply-templates select="@*|node()"/>
      <xsl:call-template name="modelNotes"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="modelNotes">
    <!-- <xsl:element name="notes" namespace="http://www.sbml.org/sbml/level3/version1/core">???</xsl:element> -->
  </xsl:template>
    
  <!-- deleting unncesessary elements -->
  <xsl:template match="
    @touched |
    @chosen |
    @mentioned |
    @included |
    @covered
  "/>
  
  <!-- do not copy elements without mentioned or included flag -->
  <xsl:template match="
    //l2v4:model/*/*[not(@mentioned='true' or @included='true')]
  "/>
  
  <!-- do not copy empty listOf... elements -->
  <xsl:template match="
    //l2v4:model/l2v4:*[not(*/@mentioned='true' or */@included='true')]
  "/>
  
  
</xsl:stylesheet>
