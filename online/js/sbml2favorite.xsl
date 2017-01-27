<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:sbml="http://www.sbml.org/sbml/level2/version4" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:irt="http://irt.insilicobio.ru/ns" exclude-result-prefixes="sbml mml">
  
  <xsl:key name="kkk" match="*" use="@id"/>

  <xsl:template match="/">
     <div>
     <h3>Selected elements</h3>
      <xsl:apply-templates select="sbml:sbml/sbml:model/node()" mode="irt"/>
     </div>
  </xsl:template>
    
  <!-- listOfCompartments annotation -->
    <xsl:template match="sbml:listOfCompartments" mode="irt">
      <p>compartment:</p>
        <xsl:apply-templates select="sbml:compartment/@id"/>
    </xsl:template>
    
  <!-- listOfSpecies annotation -->
  <xsl:template match="sbml:listOfSpecies" mode="irt">
      <p>species:</p>
      <xsl:apply-templates select="sbml:species/@id"/>
  </xsl:template>
  
  <!-- listOfReactions annotation -->
  <xsl:template match="sbml:listOfReactions" mode="irt">
      <p>reaction:</p>
      <xsl:apply-templates select="sbml:reaction/@id"/>
  </xsl:template>
  
  <!-- Notes type: just copy -->
  <xsl:template match="sbml:notes">
    <xsl:copy-of select="node()"/>
  </xsl:template>
  
  <!-- id attribute: id element -->
  <xsl:template match="sbml:compartment/@id">
    <div class="w3-card-2 irt-compartment irt-favorite irt-included">
    <xsl:attribute name="irt:ref"><xsl:value-of select="."/></xsl:attribute>
    <xsl:attribute name="id">f_<xsl:value-of select="."/></xsl:attribute>
    <xsl:value-of select="."/>
    </div>
  </xsl:template>
  
  <xsl:template match="sbml:species/@id">
    <div class="w3-card-2 irt-species irt-favorite">
    <xsl:attribute name="irt:ref"><xsl:value-of select="."/></xsl:attribute>
    <xsl:attribute name="id">f_<xsl:value-of select="."/></xsl:attribute>
    <xsl:value-of select="."/>
    </div>
  </xsl:template>
  
  <xsl:template match="sbml:reaction/@id">
    <div class="w3-card-2 irt-reaction irt-favorite">
    <xsl:attribute name="irt:ref"><xsl:value-of select="."/></xsl:attribute>
    <xsl:attribute name="id">f_<xsl:value-of select="."/></xsl:attribute>
    <xsl:value-of select="."/>
    </div>
  </xsl:template>
  
  <!-- do nothing if nothing to output-->
  <xsl:template match="*" mode="irt"/>
</xsl:stylesheet>
