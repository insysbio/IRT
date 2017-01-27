<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:sbml="http://www.sbml.org/sbml/level2/version4" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:irt="http://irt.insilicobio.ru/ns" exclude-result-prefixes="sbml mml">
  
  <xsl:key name="kkk" match="*" use="@id"/>

  <xsl:template match="/">
    <div>
      <h1>Content</h1>
      <xsl:apply-templates select="sbml:sbml/sbml:model/node()" mode="irt"/>
    </div>
  </xsl:template>
    
    <!-- listOfCompartments annotation -->
    <xsl:template match="sbml:listOfCompartments" mode="irt">
      <h2>compartment:</h2>
      <table class="w3-table w3-striped w3-border w3-hoverable w3-card-4">
      <tr class="w3-orange"><th>id</th><th>name</th><th>constant</th><th>size</th><th>units</th><th>notes</th></tr>
      <xsl:for-each select="sbml:compartment">
        <tr class="irt-covered">
          <td><xsl:apply-templates select="@id"/></td>
          <td><xsl:value-of select="@name"/></td>
          <td><xsl:value-of select="@constant"/></td>
          <td><xsl:value-of select="@size"/></td>
          <td><xsl:apply-templates select="@units" mode="irt"/></td>
          <td style="max-width:500px;"><xsl:apply-templates select="sbml:notes"/></td>
        </tr>
      </xsl:for-each>
      </table>
    </xsl:template>
    
  <!-- listOfSpecies annotation -->
  <xsl:template match="sbml:listOfSpecies" mode="irt">
      <h2>species:</h2>
      <table class="w3-table w3-striped w3-border w3-hoverable w3-card-4">
      <tr class="w3-orange"><th>id</th><th>name</th><th>mode:</th><th>initial value</th><th>units</th><th>compartment</th><th>notes</th></tr>
      <xsl:for-each select="sbml:species">
        <tr class="irt-covered">
          <td><i class="fa fa-2x"/><xsl:apply-templates select="@id"/></td>
          <td><xsl:value-of select="@name"/></td>
          <td><xsl:apply-templates select="." mode="speciesMode"/></td>
          <td><xsl:value-of select="@initialConcentration"/></td>
          <td><xsl:apply-templates select="@substanceUnits" mode="irt"/></td>
          <td><xsl:apply-templates select="@compartment"/></td>
          <td><xsl:apply-templates select="sbml:notes"/></td>
        </tr>
      </xsl:for-each>
      </table>
  </xsl:template>
  
  <!-- listOfReactions annotation -->
  <xsl:template match="sbml:listOfReactions" mode="irt">
      <h2>reaction:</h2>
      <table class="w3-table w3-striped w3-border w3-hoverable w3-card-4">
      <tr class="w3-orange"><th>id</th><th>name</th><th>reaction formula:</th><th>notes</th></tr>
      <xsl:for-each select="sbml:reaction">
        <tr class="irt-covered">
          <td><xsl:apply-templates select="@id"/></td>
          <td><xsl:value-of select="@name"/></td>
          <td style="max-width:500px;"><xsl:apply-templates select="." mode="reactionFormula"/></td>
          <td style="max-width:500px;"><xsl:apply-templates select="sbml:notes"/></td>
        </tr>
      </xsl:for-each>
      </table>
  </xsl:template>
  
  <!-- reaction formula creation -->
  <xsl:template match="sbml:reaction" mode="reactionFormula">
    <xsl:if test="count(sbml:listOfReactants/sbml:speciesReference)=0">&#8709;</xsl:if>
    <xsl:for-each select="sbml:listOfReactants/sbml:speciesReference">
    <xsl:if test="@stoichiometry!='1' and count(stoichiometry)>0"><xsl:value-of select="@stoichiometry"/>&#215;</xsl:if>
     <xsl:apply-templates select="@species"/>
       <xsl:if test="position()!=last()">+</xsl:if>
     </xsl:for-each>
       &#8658;  
    <xsl:if test="count(sbml:listOfProducts/sbml:speciesReference)=0">&#8709;</xsl:if>
    <xsl:for-each select="sbml:listOfProducts/sbml:speciesReference">
    <xsl:if test="@stoichiometry!='1' and count(stoichiometry)>0"><xsl:value-of select="@stoichiometry"/>&#215;</xsl:if>
     <xsl:apply-templates select="@species"/>
       <xsl:if test="position()!=last()">+</xsl:if>
     </xsl:for-each>
    <xsl:if test="count(sbml:listOfModifiers/sbml:modifierSpeciesReference)>0"> ~ </xsl:if>
     <xsl:for-each select="sbml:listOfModifiers/sbml:modifierSpeciesReference">
     <xsl:apply-templates select="@species"/>
       <xsl:if test="position()!=last()">, </xsl:if>
     </xsl:for-each>
  </xsl:template>

  <xsl:template match="@units" mode="irt">
    <i><xsl:apply-templates select="key('kkk',.)/@name" mode="irt"/></i>
  </xsl:template>
  
  <xsl:template match="@substanceUnits" mode="irt">
    <i><xsl:apply-templates select="key('kkk',.)/@name" mode="irt"/>/<xsl:apply-templates select="key('kkk', key('kkk',../@compartment)/@units)/@name" mode="irt"/></i>
  </xsl:template>
  
  <xsl:template match="sbml:unitDefinition/@name" mode="irt">
    <xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="sbml:species" mode="speciesMode">
   <xsl:choose>
    <xsl:when test="@constant!='true' and @boundaryCondition!='true'">
      Dynamic
    </xsl:when>
    <xsl:when test="@constant!='true' and @boundaryCondition='true'">
      Explicit
    </xsl:when>
    <xsl:otherwise>Unknown</xsl:otherwise>
  </xsl:choose>
  </xsl:template>
  
  <!-- Notes type: just copy -->
  <xsl:template match="sbml:notes">
    <xsl:copy-of select="node()"/>
  </xsl:template>
  
  <!-- SpeciesReference object: stoicheometry x species; -->
  <xsl:template match="sbml:speciesReference">
   <span class="SpeciesReference">
    <xsl:for-each select=".">
      <xsl:value-of select="@stoichiometry"/>&#215;<xsl:apply-templates select="@species"/>; 
    </xsl:for-each>
   </span>
  </xsl:template>
  
  <!-- SpeciesReference object: species; -->
  <xsl:template match="sbml:modifierSpeciesReference">
   <span class="ModifierSpeciesReference">
    <xsl:for-each select=".">
      <xsl:apply-templates select="@species"/>;
    </xsl:for-each>
   </span>
  </xsl:template>
  
  <!-- SId object: internal ref -->
  <xsl:template match="@variable|@species|@substanceUnits|@units|@compartment|@speciesType|@compartmentType|@outside">
      <xsl:value-of select="."/>
  </xsl:template>
  
  <!-- id attribute: id element -->
  <xsl:template match="sbml:compartment/@id">
    <div class="fa fa-lg irt-compartment irt-included w3-card-4">
    <xsl:attribute name="irt:ref"><xsl:value-of select="."/></xsl:attribute>
    <xsl:attribute name="id">s_<xsl:value-of select="."/></xsl:attribute>
    <xsl:value-of select="."/>
    </div>
  </xsl:template>
  
  <xsl:template match="sbml:species/@id">
    <div class="fa fa-lg irt-species w3-card-4">
    <xsl:attribute name="irt:ref"><xsl:value-of select="."/></xsl:attribute>
    <xsl:attribute name="id">s_<xsl:value-of select="."/></xsl:attribute>
    <xsl:value-of select="."/>
    </div>
  </xsl:template>
  
  <xsl:template match="sbml:reaction/@id">
    <div class="fa irt-reaction w3-card-4">
    <xsl:attribute name="irt:ref"><xsl:value-of select="."/></xsl:attribute>
    <xsl:attribute name="id">s_<xsl:value-of select="."/></xsl:attribute>
    <xsl:value-of select="."/>
    </div>
  </xsl:template>
  
  <!-- do nothing if nothing to output-->
  <xsl:template match="*" mode="irt">
    
  </xsl:template>
</xsl:stylesheet>
