<?xml version="1.0" encoding="euc-jp" ?>
<!--
   Written by Masaya YAMAGUCHI
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="c">
    <html xmlns:xhtml="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=shift_jis"/>
        <meta http-equiv="Content-Style-Type" content="text/css" />
        <link rel="stylesheet" href="bunrui.css" type="text/css" />
        <title>
          <xsl:text>分類語彙表-</xsl:text>
          <xsl:value-of select="@概念パス"/>
          <xsl:text>(</xsl:text>
          <xsl:value-of select="@分類番号"/>
          <xsl:text>)</xsl:text>
        </title>
      </head>
      <body>
        <h1><xsl:value-of select="@概念パス"/> (<xsl:value-of select="@分類番号"/>)</h1>
        <xsl:apply-templates/>
	<script type="text/javascript">
          function jumpToAnchor () {
	      var c = 0;
	      
	      var tid = setInterval(function(){
		  if(document.getElementById("himawari") != null){
		      clearInterval(tid);
		      location.href="#himawari";
		  } else{
		      c++;
		      if(c > 10){
			  clearInterval(tid);
		      }
		  }
	      }, 100);
	  }

          if (window.addEventListener){
	      window.addEventListener("load", jumpToAnchor, false);
	  } else if (window.attachEvent) {
	      window.attachEvent("onload", jumpToAnchor);
	  } else {
	      window.onload = jumpToAnchor;
	  }
	</script>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="s">
    <h2><xsl:value-of select="@段落番号"/></h2>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="l[@小段落番号 = '99']">
    <hr class="kugiri" />
  </xsl:template>

  <xsl:template match="l">
    <ul>
      <li>
        <xsl:apply-templates/>
      </li>
    </ul>
  </xsl:template>

  <xsl:template match="e">
    <span class="hyouki">
      <xsl:apply-templates/>
    </span>
    <span class="midashi">
      (<xsl:value-of select="@読み"/>)
    </span>
    <xsl:text>　</xsl:text>
  </xsl:template>

  <xsl:template match="tg">
    <span class="target_char">
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>
