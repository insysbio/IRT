/*
This file is a part of IRT navigator
Author: Evgeny Metelkin

This work is licensed under a Creative Commons Attribution-NoDerivatives 4.0 International 

License http://creativecommons.org/licenses/by-nd/4.0/

© Institute for Systems Biology, Moscow, 2016-2017
http://insysbio.ru
*/
function readXml(a){try{xmlhttp=new XMLHttpRequest,xmlhttp.open("GET",a,!1),xmlhttp.send();var b=xmlhttp.responseXML;return b}catch(a){return null}}function updateEq(){MathJax.Hub.Queue(["Typeset",MathJax.Hub])}window.onload=function(){window.opener.updateStatistics();var a=readXml("./js/sbml2ode.xsl"),b=new XSLTProcessor;b.importStylesheet(a);var c=b.transformToFragment(window.opener.cloneModelDoc,document);document.body.appendChild(c),window.addEventListener("resize",updateEq),updateEq()},window.onunload=function(){};