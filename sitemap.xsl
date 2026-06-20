<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xhtml">

<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Sitemap — WellFit Seat Covers</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
      background: #f8f9fa;
      color: #1a1a2e;
      padding: 16px;
      line-height: 1.5;
    }
    .container {
      max-width: 800px;
      margin: 0 auto;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
      padding: 24px;
    }
    h1 {
      font-size: 1.5rem;
      font-weight: 700;
      margin-bottom: 4px;
      color: #1a1a2e;
    }
    .subtitle {
      font-size: 0.875rem;
      color: #6b7280;
      margin-bottom: 20px;
    }
    .stats {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
      margin-bottom: 20px;
      padding-bottom: 16px;
      border-bottom: 1px solid #e5e7eb;
    }
    .stat {
      background: #f3f4f6;
      border-radius: 8px;
      padding: 8px 14px;
      font-size: 0.8rem;
      color: #4b5563;
    }
    .stat strong {
      color: #1a1a2e;
      font-size: 0.9rem;
    }
    ul {
      list-style: none;
      display: flex;
      flex-direction: column;
      gap: 8px;
    }
    li {
      border: 1px solid #e5e7eb;
      border-radius: 8px;
      padding: 12px 16px;
      transition: border-color 0.15s;
    }
    li:active {
      border-color: #2563eb;
      background: #f0f7ff;
    }
    .url {
      font-size: 0.875rem;
      word-break: break-all;
      color: #2563eb;
      text-decoration: none;
      font-weight: 500;
      display: block;
      margin-bottom: 4px;
    }
    .url:hover {
      text-decoration: underline;
    }
    .meta {
      font-size: 0.75rem;
      color: #9ca3af;
      display: flex;
      gap: 16px;
      flex-wrap: wrap;
    }
    .meta span {
      display: inline-flex;
      align-items: center;
      gap: 4px;
    }
    .priority-high { border-left: 3px solid #059669; }
    .priority-mid  { border-left: 3px solid #2563eb; }
    .priority-low  { border-left: 3px solid #d97706; }
    .footer {
      margin-top: 20px;
      text-align: center;
      font-size: 0.75rem;
      color: #9ca3af;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>🗺️ Sitemap</h1>
    <p class="subtitle">WellFit Seat Covers</p>

    <div class="stats">
      <div class="stat"><strong><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></strong> pages</div>
      <xsl:variable name="now" select="current-date()"/>
    </div>

    <ul>
      <xsl:for-each select="sitemap:urlset/sitemap:url">
        <xsl:sort select="sitemap:priority" order="descending" data-type="number"/>
        <li>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="number(sitemap:priority) >= 0.9">priority-high</xsl:when>
              <xsl:when test="number(sitemap:priority) >= 0.7">priority-mid</xsl:when>
              <xsl:otherwise>priority-low</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <a class="url" href="{sitemap:loc}" target="_blank">
            <xsl:value-of select="sitemap:loc"/>
          </a>
          <div class="meta">
            <xsl:if test="sitemap:lastmod">
              <span>📅 <xsl:value-of select="sitemap:lastmod"/></span>
            </xsl:if>
            <xsl:if test="sitemap:changefreq">
              <span>🔄 <xsl:value-of select="sitemap:changefreq"/></span>
            </xsl:if>
            <xsl:if test="sitemap:priority">
              <span>⭐ <xsl:value-of select="sitemap:priority"/></span>
            </xsl:if>
          </div>
        </li>
      </xsl:for-each>
    </ul>
    <div class="footer">
      Generated for search engines · <a href="https://thiblol.github.io/wellfit-site/">Home</a>
    </div>
  </div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>
