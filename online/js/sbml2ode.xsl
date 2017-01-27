<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:l1v1="http://www.sbml.org/sbml/level2/version1"
  xmlns:l1v2="http://www.sbml.org/sbml/level2/version2"
  xmlns:l1v3="http://www.sbml.org/sbml/level2/version3"
  xmlns:sbml="http://www.sbml.org/sbml/level2/version4"
  xmlns:l1v4="http://www.sbml.org/sbml/level2/version4"
  xmlns:l1v5="http://www.sbml.org/sbml/level2/version5"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:mml="http://www.w3.org/1998/Math/MathML"
  exclude-result-prefixes="sbml l1v1 l1v2 l1v3 l1v4 l1v5">
  
  <xsl:output method="html" omit-xml-declaration="yes"/>
  
  <xsl:key name="keyId" match="*" use="@id"/>

  <!-- top element -->
  <xsl:template match="/">
    <div>
      <xsl:if test="count(//sbml:species[@included='true' or @mentioned='true'])=0"><h2>Nothing to show</h2> <p>You should select some elements from the database before creating ODE.</p></xsl:if>
      <xsl:apply-templates select="//sbml:species[@included='true' or @mentioned='true']" mode="ode"/>
    </div>
  </xsl:template>
    
    <!-- summary for species -->
    <xsl:template match="sbml:species" mode="ode">
      <h4><xsl:value-of select="@name"/> (<xsl:value-of select="@id"/>)</h4>
      <!--<p>substanceUnits: <xsl:value-of select="@substanceUnits"/></p>-->
      <p><xsl:apply-templates select="." mode="ode.math"/></p>
      <p><xsl:apply-templates select="." mode="ode.initial"/></p>
      <hr/>
    </xsl:template>
    
    <!-- explicit equation -->
    <xsl:template match="sbml:species[@boundaryCondition='true']" mode="ode.math">
      <mml:math>
        <mml:apply>
          <mml:eq/>
          
                <mml:apply>
                  <mml:ci><xsl:value-of select="@id"/></mml:ci>
                  <mml:ci>t</mml:ci>
                </mml:apply>
            
            <mml:apply>
              <mml:plus/>
              <xsl:apply-templates select="//sbml:assignmentRule[@variable=current()/@id]/mml:math/mml:*"/>
            </mml:apply>
        </mml:apply>
      </mml:math>
    </xsl:template>
    
    <!-- constant species -->
    <xsl:template match="sbml:species[not(@included='true')]" mode="ode.math">
      <mml:math>
        <mml:apply>
          <mml:eq/>
          
                <mml:apply>
                  <mml:ci><xsl:value-of select="@id"/></mml:ci>
                  <mml:ci>t</mml:ci>
                </mml:apply>
            
                <mml:cn><xsl:value-of select="@initialConcentration"/></mml:cn>
        </mml:apply>
      </mml:math>
    </xsl:template>
    
    <!-- differential equation -->
    <xsl:template match="sbml:species[not(@boundaryCondition='true') and @included='true']" mode="ode.math">
      <mml:math>
        <mml:apply>
          <mml:eq/>
          <mml:apply>
            <mml:times/>
            <mml:ci><xsl:value-of select="@compartment"/></mml:ci>
            <mml:apply>
              <mml:diff/>
              <mml:bvar>
                <mml:ci>t</mml:ci>
              </mml:bvar>
                <mml:apply>
                  <mml:ci><xsl:value-of select="@id"/></mml:ci>
                  <mml:ci>t</mml:ci>
                </mml:apply>
            </mml:apply>
          </mml:apply>
            <mml:apply>
              <mml:plus/>
              <xsl:apply-templates select="//sbml:reaction[@included='true']/*/sbml:speciesReference[@species=current()/@id]" mode="ode.math"/>
              <xsl:if test="count(//sbml:reaction[@included='true']/*/sbml:speciesReference[@species=current()/@id])=0"><mml:cn>0</mml:cn></xsl:if>
            </mml:apply>
        </mml:apply>
      </mml:math>
    </xsl:template>
    
    <!-- initial value -->
    <xsl:template match="sbml:species[not(@boundaryCondition='true') and @included='true']" mode="ode.initial">
      <mml:math>
        <mml:apply>
          <mml:eq/>
            <mml:apply>
                <mml:ci><xsl:value-of select="@id"/></mml:ci>
                <mml:cn>0</mml:cn>
            </mml:apply>
              <mml:cn><xsl:value-of select="@initialConcentration"/></mml:cn>
        </mml:apply>
      </mml:math>
    </xsl:template>
    
    <!-- RHS of differential equation -->
    <xsl:template match="sbml:listOfProducts/sbml:speciesReference[not(@stoichiometry!='1')]" mode="ode.math">
        <mml:ci><xsl:value-of select="../../@id"/></mml:ci>
    </xsl:template>
    
    <xsl:template match="sbml:listOfReactants/sbml:speciesReference[not(@stoichiometry!='1')]" mode="ode.math">
      <mml:apply>
        <mml:minus/>
        <mml:ci><xsl:value-of select="../../@id"/></mml:ci>
      </mml:apply>
    </xsl:template>
    
    <xsl:template match="sbml:listOfProducts/sbml:speciesReference[@stoichiometry!='1']" mode="ode.math">
      <mml:apply>
        <mml:times/>
        <mml:cn><xsl:value-of select="@stoichiometry"/></mml:cn>
        <mml:ci><xsl:value-of select="../../@id"/></mml:ci>
      </mml:apply>
    </xsl:template>
    
    <xsl:template match="sbml:listOfReactants/sbml:speciesReference[@stoichiometry!='1']" mode="ode.math">
      <mml:apply>
        <mml:minus/>
        <mml:apply>
          <mml:times/>
          <mml:cn><xsl:value-of select="@stoichiometry"/></mml:cn>
          <mml:ci><xsl:value-of select="../../@id"/></mml:ci>
        </mml:apply>
      </mml:apply>
    </xsl:template>
  
  <xsl:template match="@substanceUnits" mode="irt">
    <!--<i><xsl:apply-templates select="key('kkk',.)/@name" mode="irt"/>/<xsl:apply-templates select="key('kkk', key('kkk',../@compartment)/@units)/@name" mode="irt"/></i>-->
    <i><xsl:value-of select="."/>/<xsl:value-of select="key('kkk',../@compartment)/@units"/></i>
  </xsl:template>
  
  <xsl:template match="sbml:unitDefinition/@name" mode="irt">
    <xsl:value-of select="."/>
  </xsl:template>
  
  <!-- some correction of mml -->
  <xsl:template match="mml:ci">
    <xsl:element name="ci" namespace="http://www.w3.org/1998/Math/MathML">
      <!-- <xsl:value-of select="key('kkk',normalize-space(text()))/@name"/>--> <!-- for simbio only-->
      <xsl:value-of select="normalize-space(text())"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="mml:cn[@type='e-notation']">
    <xsl:element name="cn" namespace="http://www.w3.org/1998/Math/MathML">
      <xsl:copy-of select="normalize-space(text()[1])"/><xsl:if test="normalize-space(text()[2])!='0'">e<xsl:copy-of select="normalize-space(text()[2])"/>
      </xsl:if>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="mml:*">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!-- do nothing if nothing to output-->
  <xsl:template match="*"/>
  <xsl:template match="*" mode="ode.initial"/>
</xsl:stylesheet>
