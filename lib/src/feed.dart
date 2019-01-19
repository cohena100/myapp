import 'dart:async';
import 'dart:isolate';
import 'package:webfeed/webfeed.dart';

final feed = """
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" media="screen" href="/~d/styles/rss2full.xsl"?><?xml-stylesheet type="text/css" media="screen" href="http://feeds.reuters.com/~d/styles/itemcontent.css"?><rss xmlns:feedburner="http://rssnamespace.org/feedburner/ext/1.0" version="2.0">
<channel>
<title>Reuters: Business News</title>
<link>https://www.reuters.com</link>
<description>Reuters.com is your source for breaking news, business, financial and investing news, including personal finance and stocks.  Reuters is the leading global provider of news, financial information and technology solutions to the world's media, financial institutions, businesses and individuals.</description>
<image>
	<title>Reuters News</title>
	<width>120</width>
	<height>35</height>
	<link>https://www.reuters.com</link>
	<url>https://www.reuters.com/resources_v2/images/reuters125.png</url>
</image>
<language>en-us</language>
<lastBuildDate>Sat, 19 Jan 2019 03:57:29 -0500</lastBuildDate>
<copyright>All rights reserved. Users may download and print extracts of content from this website for their own personal and non-commercial use only. Republication or redistribution of Reuters content, including by framing or similar means, is expressly prohibited without the prior written consent of Reuters. Reuters and the Reuters sphere logo are registered trademarks or trademarks of the Reuters group of companies around the world. © Reuters 2019</copyright>
<atom10:link xmlns:atom10="http://www.w3.org/2005/Atom" rel="self" type="application/rss+xml" href="http://feeds.reuters.com/reuters/businessNews" /><feedburner:info uri="reuters/businessnews" /><atom10:link xmlns:atom10="http://www.w3.org/2005/Atom" rel="hub" href="http://pubsubhubbub.appspot.com/" /><feedburner:feedFlare href="https://add.my.yahoo.com/rss?url=http%3A%2F%2Ffeeds.reuters.com%2Freuters%2FbusinessNews" src="http://us.i1.yimg.com/us.yimg.com/i/us/my/addtomyyahoo4.gif">Subscribe with My Yahoo!</feedburner:feedFlare><feedburner:feedFlare href="http://www.newsgator.com/ngs/subscriber/subext.aspx?url=http%3A%2F%2Ffeeds.reuters.com%2Freuters%2FbusinessNews" src="http://www.newsgator.com/images/ngsub1.gif">Subscribe with NewsGator</feedburner:feedFlare><feedburner:feedFlare href="http://feeds.my.aol.com/add.jsp?url=http%3A%2F%2Ffeeds.reuters.com%2Freuters%2FbusinessNews" src="http://o.aolcdn.com/favorites.my.aol.com/webmaster/ffclient/webroot/locale/en-US/images/myAOLButtonSmall.gif">Subscribe with My AOL</feedburner:feedFlare><feedburner:feedFlare href="http://www.bloglines.com/sub/http://feeds.reuters.com/reuters/businessNews" src="http://www.bloglines.com/images/sub_modern11.gif">Subscribe with Bloglines</feedburner:feedFlare><feedburner:feedFlare href="http://www.netvibes.com/subscribe.php?url=http%3A%2F%2Ffeeds.reuters.com%2Freuters%2FbusinessNews" src="//www.netvibes.com/img/add2netvibes.gif">Subscribe with Netvibes</feedburner:feedFlare><feedburner:feedFlare href="http://fusion.google.com/add?feedurl=http%3A%2F%2Ffeeds.reuters.com%2Freuters%2FbusinessNews" src="http://buttons.googlesyndication.com/fusion/add.gif">Subscribe with Google</feedburner:feedFlare><feedburner:feedFlare href="http://www.pageflakes.com/subscribe.aspx?url=http%3A%2F%2Ffeeds.reuters.com%2Freuters%2FbusinessNews" src="http://www.pageflakes.com/ImageFile.ashx?instanceId=Static_4&amp;fileName=ATP_blu_91x17.gif">Subscribe with Pageflakes</feedburner:feedFlare><item>
		<title>Supermarket retailer Casino to sell six stores to rival Leclerc</title>

		<description>French supermarket retailer Casino , in the process of divesting assets to cut debts, has agreed to sell six of its 'Geant' hypermarket stores to domestic rival Leclerc for 100.5 million euros (114 million).&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Sf7FpNqCK68:9guFRYQLReU:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Sf7FpNqCK68:9guFRYQLReU:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=Sf7FpNqCK68:9guFRYQLReU:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Sf7FpNqCK68:9guFRYQLReU:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=Sf7FpNqCK68:9guFRYQLReU:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/Sf7FpNqCK68" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/Sf7FpNqCK68/supermarket-retailer-casino-to-sell-six-stores-to-rival-leclerc-idUSKCN1PD07P</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-casino-m-a-leclerc/supermarket-retailer-casino-to-sell-six-stores-to-rival-leclerc-idUSKCN1PD07P?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Sat, 19 Jan 2019 03:47:23 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-casino-m-a-leclerc/supermarket-retailer-casino-to-sell-six-stores-to-rival-leclerc-idUSKCN1PD07P?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>U.S. chipmakers may give clues on China hazard</title>

		<description>Intel Corp  operates mostly outside the Apple-sphere, and that is exactly why whatever it says next week about business in its vital Chinese market matters so much for investors.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=ATY8mWuTtK4:D5K3D1p3KS8:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=ATY8mWuTtK4:D5K3D1p3KS8:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=ATY8mWuTtK4:D5K3D1p3KS8:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=ATY8mWuTtK4:D5K3D1p3KS8:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=ATY8mWuTtK4:D5K3D1p3KS8:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/ATY8mWuTtK4" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/ATY8mWuTtK4/u-s-chipmakers-may-give-clues-on-china-hazard-idUSKCN1PC24J</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-usa-stocks-weekahead/u-s-chipmakers-may-give-clues-on-china-hazard-idUSKCN1PC24J?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Sat, 19 Jan 2019 03:36:38 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-usa-stocks-weekahead/u-s-chipmakers-may-give-clues-on-china-hazard-idUSKCN1PC24J?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Malaysia court rules in favor of Wynn Macau in 4.2 million case: lawyer</title>

		<description>A Malaysian judge on Friday ruled in favor of Wynn Macau  in a case against a fund manager who owed the casino millions of dollars, the company's lawyer said, the first time a casino has been allowed to recover dues in the country.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=3EFXlFhesdQ:_-zdDjFWEwU:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=3EFXlFhesdQ:_-zdDjFWEwU:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=3EFXlFhesdQ:_-zdDjFWEwU:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=3EFXlFhesdQ:_-zdDjFWEwU:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=3EFXlFhesdQ:_-zdDjFWEwU:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/3EFXlFhesdQ" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/3EFXlFhesdQ/malaysia-court-rules-in-favor-of-wynn-macau-in-4-2-million-case-lawyer-idUSKCN1PD05J</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-wynn-macau-malaysia/malaysia-court-rules-in-favor-of-wynn-macau-in-4-2-million-case-lawyer-idUSKCN1PD05J?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Sat, 19 Jan 2019 00:54:50 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-wynn-macau-malaysia/malaysia-court-rules-in-favor-of-wynn-macau-in-4-2-million-case-lawyer-idUSKCN1PD05J?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>LJM Partners sues unnamed 'manipulators' it blames for volatility losses</title>

		<description>LJM Partners Ltd on Friday filed a lawsuit against unnamed parties it holds responsible for hundreds of millions of dollars it lost after last year's jump in stock market volatility that effectively put the fund manager out of business.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=0Hc7r2mVqeg:FU8Dkfi0_Ig:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=0Hc7r2mVqeg:FU8Dkfi0_Ig:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=0Hc7r2mVqeg:FU8Dkfi0_Ig:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=0Hc7r2mVqeg:FU8Dkfi0_Ig:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=0Hc7r2mVqeg:FU8Dkfi0_Ig:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/0Hc7r2mVqeg" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/0Hc7r2mVqeg/ljm-partners-sues-unnamed-manipulators-it-blames-for-volatility-losses-idUSKCN1PC2OK</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-ljm-lawsuit/ljm-partners-sues-unnamed-manipulators-it-blames-for-volatility-losses-idUSKCN1PC2OK?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 21:32:22 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-ljm-lawsuit/ljm-partners-sues-unnamed-manipulators-it-blames-for-volatility-losses-idUSKCN1PC2OK?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Exclusive: U.S. demands regular review of China trade reform</title>

		<description>The United States is pushing for regular reviews of China's progress on pledged trade reforms as a condition for a trade deal - and could again resort to tariffs if it deems Beijing has violated the agreement, according to sources briefed on negotiations to end the trade war between the two nations.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=PNUUryltzaM:Xil3vMOKZEg:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=PNUUryltzaM:Xil3vMOKZEg:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=PNUUryltzaM:Xil3vMOKZEg:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=PNUUryltzaM:Xil3vMOKZEg:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=PNUUryltzaM:Xil3vMOKZEg:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/PNUUryltzaM" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/PNUUryltzaM/exclusive-u-s-demands-regular-review-of-china-trade-reform-idUSKCN1PC2AG</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-usa-china-trade-exclusive/exclusive-u-s-demands-regular-review-of-china-trade-reform-idUSKCN1PC2AG?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 21:29:45 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-usa-china-trade-exclusive/exclusive-u-s-demands-regular-review-of-china-trade-reform-idUSKCN1PC2AG?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Explainer: How U.S.-China talks differ from any other trade deal</title>

		<description>The trade deal that U.S. negotiators are seeking with China may have more in common with a sanctions-monitoring regime than a traditional trade pact.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=1yDCZSZiX5E:btOytDAlP9Y:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=1yDCZSZiX5E:btOytDAlP9Y:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=1yDCZSZiX5E:btOytDAlP9Y:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=1yDCZSZiX5E:btOytDAlP9Y:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=1yDCZSZiX5E:btOytDAlP9Y:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/1yDCZSZiX5E" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/1yDCZSZiX5E/explainer-how-u-s-china-talks-differ-from-any-other-trade-deal-idUSKCN1PC2L0</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-usa-trade-china-explainer/explainer-how-u-s-china-talks-differ-from-any-other-trade-deal-idUSKCN1PC2L0?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 21:29:45 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-usa-trade-china-explainer/explainer-how-u-s-china-talks-differ-from-any-other-trade-deal-idUSKCN1PC2L0?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>White House adviser Kudlow says making progress on China trade talks</title>

		<description>White House economic adviser Larry Kudlow said on Friday that the United States and China were making progress on trade negotiations but reaching a deal would take time.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=oeeb5Y41vEA:z2_eWinOA5A:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=oeeb5Y41vEA:z2_eWinOA5A:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=oeeb5Y41vEA:z2_eWinOA5A:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=oeeb5Y41vEA:z2_eWinOA5A:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=oeeb5Y41vEA:z2_eWinOA5A:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/oeeb5Y41vEA" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/oeeb5Y41vEA/white-house-adviser-kudlow-says-making-progress-on-china-trade-talks-idUSKCN1PC2P5</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-usa-trade-china-kudlow/white-house-adviser-kudlow-says-making-progress-on-china-trade-talks-idUSKCN1PC2P5?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 21:29:45 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-usa-trade-china-kudlow/white-house-adviser-kudlow-says-making-progress-on-china-trade-talks-idUSKCN1PC2P5?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>PBGC steps in to oversee Sears' two pension plans</title>

		<description>Pension Benefit Guaranty Corp (PBGC) is taking steps to assume responsibility for bankrupt retailer Sears Holdings Corp's two pension plans, covering about 90,000 people, the U.S. government agency said on Friday.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Szfss2VWCvU:sf7l8hdcHxw:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Szfss2VWCvU:sf7l8hdcHxw:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=Szfss2VWCvU:sf7l8hdcHxw:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Szfss2VWCvU:sf7l8hdcHxw:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=Szfss2VWCvU:sf7l8hdcHxw:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/Szfss2VWCvU" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/Szfss2VWCvU/pbgc-steps-in-to-oversee-sears-two-pension-plans-idUSKCN1PC2A6</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-sears-bankruptcy-pbgc/pbgc-steps-in-to-oversee-sears-two-pension-plans-idUSKCN1PC2A6?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 21:27:46 -0500</pubDate>
		<category domain="http://rss.financialcontent.com/stocksymbol">PBGC</category><feedburner:origLink>https://www.reuters.com/article/us-sears-bankruptcy-pbgc/pbgc-steps-in-to-oversee-sears-two-pension-plans-idUSKCN1PC2A6?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Apple ordered to pull part of press release in Qualcomm case</title>

		<description>Apple Inc has been ordered by a German court to stop using part of a press release claiming all iPhones would be available in the country through carriers and resellers, a copy of the ruling seen by Reuters showed.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=4r3oornxmGI:ieYtiKbIwaU:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=4r3oornxmGI:ieYtiKbIwaU:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=4r3oornxmGI:ieYtiKbIwaU:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=4r3oornxmGI:ieYtiKbIwaU:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=4r3oornxmGI:ieYtiKbIwaU:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/4r3oornxmGI" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/4r3oornxmGI/apple-ordered-to-pull-part-of-press-release-in-qualcomm-case-idUSKCN1PC2FJ</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-apple-qualcomm-court/apple-ordered-to-pull-part-of-press-release-in-qualcomm-case-idUSKCN1PC2FJ?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 21:27:20 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-apple-qualcomm-court/apple-ordered-to-pull-part-of-press-release-in-qualcomm-case-idUSKCN1PC2FJ?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Exclusive: BlackRock, Goldman to move some fund managers to U.S. if no-deal Brexit - sources</title>

		<description>BlackRock and Goldman Sachs Asset Management both plan to temporarily move some British-based fund managers to New York in the event of a no-deal Brexit, two sources told Reuters.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=uD6LNB5cUAI:GRZLkh4Sxj8:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=uD6LNB5cUAI:GRZLkh4Sxj8:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=uD6LNB5cUAI:GRZLkh4Sxj8:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=uD6LNB5cUAI:GRZLkh4Sxj8:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=uD6LNB5cUAI:GRZLkh4Sxj8:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/uD6LNB5cUAI" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/uD6LNB5cUAI/exclusive-blackrock-goldman-to-move-some-fund-managers-to-u-s-if-no-deal-brexit-sources-idUSKCN1PC234</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-eu-britain-blackrock-goldman-exclusiv/exclusive-blackrock-goldman-to-move-some-fund-managers-to-u-s-if-no-deal-brexit-sources-idUSKCN1PC234?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 21:26:08 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-eu-britain-blackrock-goldman-exclusiv/exclusive-blackrock-goldman-to-move-some-fund-managers-to-u-s-if-no-deal-brexit-sources-idUSKCN1PC234?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Fed policymakers leave little doubt: Rate hikes can wait</title>

		<description>"Patience" is the new mantra at the Federal Reserve, less than two weeks ahead of the U.S. central bank's first policy meeting of the new year, as officials leave little doubt they want to stop raising interest rates - at least for a while.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=K4Tja-ZKTK0:EqTjkc6huVA:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=K4Tja-ZKTK0:EqTjkc6huVA:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=K4Tja-ZKTK0:EqTjkc6huVA:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=K4Tja-ZKTK0:EqTjkc6huVA:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=K4Tja-ZKTK0:EqTjkc6huVA:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/K4Tja-ZKTK0" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/K4Tja-ZKTK0/fed-policymakers-leave-little-doubt-rate-hikes-can-wait-idUSKCN1PC1NA</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-usa-fed-williams/fed-policymakers-leave-little-doubt-rate-hikes-can-wait-idUSKCN1PC1NA?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 18:35:34 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-usa-fed-williams/fed-policymakers-leave-little-doubt-rate-hikes-can-wait-idUSKCN1PC1NA?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Fed's Brainard sees mounting negative risks for U.S. economy</title>

		<description>Federal Reserve Governor Lael Brainard on Friday became the latest U.S. central banker to worry publicly about rising risks for the U.S. economy, suggesting she could embrace a pause on raising interest rates that has won support among most of her peers.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=0T9nBEuS4bU:PHZZ7mOHIuY:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=0T9nBEuS4bU:PHZZ7mOHIuY:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=0T9nBEuS4bU:PHZZ7mOHIuY:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=0T9nBEuS4bU:PHZZ7mOHIuY:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=0T9nBEuS4bU:PHZZ7mOHIuY:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/0T9nBEuS4bU" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/0T9nBEuS4bU/feds-brainard-sees-mounting-negative-risks-for-u-s-economy-idUSKCN1PC2PE</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-usa-fed-brainard/feds-brainard-sees-mounting-negative-risks-for-u-s-economy-idUSKCN1PC2PE?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 18:22:42 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-usa-fed-brainard/feds-brainard-sees-mounting-negative-risks-for-u-s-economy-idUSKCN1PC2PE?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>FedEx to take up to 575 million charge as it starts voluntary buyouts</title>

		<description>FedEx Corp  said on Friday it could take as much as 575 million in charges as it began offering voluntary cash buyouts to certain U.S-based employees in a bid to reduce costs.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=hHdQBheUhvQ:0FsW6jKD-hc:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=hHdQBheUhvQ:0FsW6jKD-hc:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=hHdQBheUhvQ:0FsW6jKD-hc:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=hHdQBheUhvQ:0FsW6jKD-hc:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=hHdQBheUhvQ:0FsW6jKD-hc:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/hHdQBheUhvQ" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/hHdQBheUhvQ/fedex-to-take-up-to-575-million-charge-as-it-starts-voluntary-buyouts-idUSKCN1PC2LU</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-fedex-layoffs/fedex-to-take-up-to-575-million-charge-as-it-starts-voluntary-buyouts-idUSKCN1PC2LU?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 17:54:05 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-fedex-layoffs/fedex-to-take-up-to-575-million-charge-as-it-starts-voluntary-buyouts-idUSKCN1PC2LU?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Wall Street extends rally on U.S.-China trade optimism</title>

		<description>U.S. stocks rallied on Friday, helping Wall Street's major indexes advance for the fourth consecutive week, as increased hopes the United States and China would resolve their trade dispute lifted shares across sectors.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=WylLW3gp3yY:NDQFYjau0Ck:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=WylLW3gp3yY:NDQFYjau0Ck:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=WylLW3gp3yY:NDQFYjau0Ck:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=WylLW3gp3yY:NDQFYjau0Ck:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=WylLW3gp3yY:NDQFYjau0Ck:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/WylLW3gp3yY" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/WylLW3gp3yY/wall-street-extends-rally-on-u-s-china-trade-optimism-idUSKCN1PC1FH</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-usa-stocks/wall-street-extends-rally-on-u-s-china-trade-optimism-idUSKCN1PC1FH?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 17:38:10 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-usa-stocks/wall-street-extends-rally-on-u-s-china-trade-optimism-idUSKCN1PC1FH?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Luxury online reseller The RealReal in talks with banks for IPO: sources</title>

		<description>U.S. online luxury reseller The RealReal Inc is talking to investment banks about the possibility of an initial public offering (IPO) later this year, people familiar with the matter said on Friday.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=MW3XkwhmLPk:e_ZxEB8DkP0:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=MW3XkwhmLPk:e_ZxEB8DkP0:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=MW3XkwhmLPk:e_ZxEB8DkP0:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=MW3XkwhmLPk:e_ZxEB8DkP0:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=MW3XkwhmLPk:e_ZxEB8DkP0:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/MW3XkwhmLPk" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/MW3XkwhmLPk/luxury-online-reseller-the-realreal-in-talks-with-banks-for-ipo-sources-idUSKCN1PC2O0</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-the-realreal-ipo/luxury-online-reseller-the-realreal-in-talks-with-banks-for-ipo-sources-idUSKCN1PC2O0?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 17:36:30 -0500</pubDate>
		<category domain="http://rss.financialcontent.com/stocksymbol">IPO</category><feedburner:origLink>https://www.reuters.com/article/us-the-realreal-ipo/luxury-online-reseller-the-realreal-in-talks-with-banks-for-ipo-sources-idUSKCN1PC2O0?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Stocks rally on trade hopes, dollar has first weekly gain of 2019</title>

		<description>World stock indexes jumped on Friday, with Wall Street posting a fourth straight week of gains, and the dollar had its first positive week since mid-December as optimism increased that an end is in sight to the U.S.-China trade conflict.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=L6F9HaCKL-o:TMzcqdJdNvg:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=L6F9HaCKL-o:TMzcqdJdNvg:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=L6F9HaCKL-o:TMzcqdJdNvg:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=L6F9HaCKL-o:TMzcqdJdNvg:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=L6F9HaCKL-o:TMzcqdJdNvg:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/L6F9HaCKL-o" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/L6F9HaCKL-o/stocks-rally-on-trade-hopes-dollar-has-first-weekly-gain-of-2019-idUSKCN1PC01D</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-global-markets/stocks-rally-on-trade-hopes-dollar-has-first-weekly-gain-of-2019-idUSKCN1PC01D?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 17:02:43 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-global-markets/stocks-rally-on-trade-hopes-dollar-has-first-weekly-gain-of-2019-idUSKCN1PC01D?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Morgan Stanley CEO James Gorman pay rises 7 percent to 29 million: filings</title>

		<description>Morgan Stanley  Chief Executive James Gorman's overall pay rose 7 percent to 29 million last year during a period that saw the firm's net revenues rise 5 percent to 40.1 billion, according to bank filings released on Friday.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=bunvkufnIFM:kRjmYjUwcWQ:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=bunvkufnIFM:kRjmYjUwcWQ:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=bunvkufnIFM:kRjmYjUwcWQ:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=bunvkufnIFM:kRjmYjUwcWQ:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=bunvkufnIFM:kRjmYjUwcWQ:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/bunvkufnIFM" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/bunvkufnIFM/morgan-stanley-ceo-james-gorman-pay-rises-7-percent-to-29-million-filings-idUSKCN1PC2LI</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-morgan-stanley-compensation/morgan-stanley-ceo-james-gorman-pay-rises-7-percent-to-29-million-filings-idUSKCN1PC2LI?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 16:57:05 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-morgan-stanley-compensation/morgan-stanley-ceo-james-gorman-pay-rises-7-percent-to-29-million-filings-idUSKCN1PC2LI?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Canada dismisses China's warning of repercussions over Huawei ban</title>

		<description>Canada's government on Friday dismissed China's warning of repercussions if Ottawa banned Huawei Technologies Co Ltd [HWT.UL] from supplying equipment to 5G networks, saying it would not compromise on security.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Kugg9zSV4l4:2LiTC1bWzTs:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Kugg9zSV4l4:2LiTC1bWzTs:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=Kugg9zSV4l4:2LiTC1bWzTs:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=Kugg9zSV4l4:2LiTC1bWzTs:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=Kugg9zSV4l4:2LiTC1bWzTs:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/Kugg9zSV4l4" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/Kugg9zSV4l4/canada-dismisses-chinas-warning-of-repercussions-over-huawei-ban-idUSKCN1PC1TG</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-china-canada-diplomacy/canada-dismisses-chinas-warning-of-repercussions-over-huawei-ban-idUSKCN1PC1TG?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 16:33:56 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-china-canada-diplomacy/canada-dismisses-chinas-warning-of-repercussions-over-huawei-ban-idUSKCN1PC1TG?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>Avianca Brasil's legal fight with plane leasing firms escalates</title>

		<description>Avianca Brasil's battle with its aircraft leasing firms intensified on Friday after Brazil's aviation regulator said it would no longer ground 10 of the struggling carrier's planes and another lessor renewed its effort to repossess 10 others.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=d1TLLQ1l7eM:gVwwzNkkziA:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=d1TLLQ1l7eM:gVwwzNkkziA:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=d1TLLQ1l7eM:gVwwzNkkziA:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=d1TLLQ1l7eM:gVwwzNkkziA:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=d1TLLQ1l7eM:gVwwzNkkziA:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/d1TLLQ1l7eM" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/d1TLLQ1l7eM/avianca-brasils-legal-fight-with-plane-leasing-firms-escalates-idUSKCN1PC2BI</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-avianca-brasil-bankruptcy/avianca-brasils-legal-fight-with-plane-leasing-firms-escalates-idUSKCN1PC2BI?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 16:02:33 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-avianca-brasil-bankruptcy/avianca-brasils-legal-fight-with-plane-leasing-firms-escalates-idUSKCN1PC2BI?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
<item>
		<title>U.S. regulators discuss fining Facebook for privacy violations: report</title>

		<description>U.S. regulators have met to discuss imposing a fine against Facebook Inc  for violating a legally binding agreement with the government to protect the privacy of personal data, the Washington Post reported on Friday, citing three people familiar with the discussions.&lt;div class="feedflare"&gt;
&lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=EgGxhzIkIxY:7jMA5U_voME:yIl2AUoC8zA"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?d=yIl2AUoC8zA" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=EgGxhzIkIxY:7jMA5U_voME:F7zBnMyn0Lo"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=EgGxhzIkIxY:7jMA5U_voME:F7zBnMyn0Lo" border="0"&gt;&lt;/img&gt;&lt;/a&gt; &lt;a href="http://feeds.reuters.com/~ff/reuters/businessNews?a=EgGxhzIkIxY:7jMA5U_voME:V_sGLiPBpWU"&gt;&lt;img src="http://feeds.feedburner.com/~ff/reuters/businessNews?i=EgGxhzIkIxY:7jMA5U_voME:V_sGLiPBpWU" border="0"&gt;&lt;/img&gt;&lt;/a&gt;
&lt;/div&gt;&lt;img src="http://feeds.feedburner.com/~r/reuters/businessNews/~4/EgGxhzIkIxY" height="1" width="1" alt=""/&gt;</description>

		<link>http://feeds.reuters.com/~r/reuters/businessNews/~3/EgGxhzIkIxY/u-s-regulators-discuss-fining-facebook-for-privacy-violations-report-idUSKCN1PC2EN</link>
        <guid isPermaLink="false">https://www.reuters.com/article/us-facebook-data/u-s-regulators-discuss-fining-facebook-for-privacy-violations-report-idUSKCN1PC2EN?feedType=RSS&amp;feedName=businessNews</guid>
        <category>businessNews</category>
		<pubDate>Fri, 18 Jan 2019 15:59:04 -0500</pubDate>
		<feedburner:origLink>https://www.reuters.com/article/us-facebook-data/u-s-regulators-discuss-fining-facebook-for-privacy-violations-report-idUSKCN1PC2EN?feedType=RSS&amp;feedName=businessNews</feedburner:origLink></item>
</channel>
</rss>
""";

Future getFeed() async {
  final response = new ReceivePort();
  await Isolate.spawn(_isolate, response.sendPort);
  return response.first;
}

void _isolate(SendPort sendPort) {
  final rssFeed = RssFeed.parse(feed);
  sendPort.send(rssFeed);
}
