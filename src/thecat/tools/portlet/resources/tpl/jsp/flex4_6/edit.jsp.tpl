<%@page session="false" contentType="text/html" pageEncoding="UTF-8" 
	import="${packageName}.Edit${portletName}ModelBean, ${packageName}.${portletName}Portlet, 
		java.util.Locale, javax.portlet.RenderResponse"
%>
<%
Edit${portletName}ModelBean modelBean = (Edit${portletName}ModelBean) request.getAttribute(${portletName}Portlet.EDIT_MODEL_KEY);
Locale locale = (Locale) request.getAttribute(${portletName}Portlet.LOCALE_KEY);
String saveActionURL = request.getAttribute(${portletName}Portlet.SAVE_ACTION_KEY).toString();
String resetActionURL = request.getAttribute(${portletName}Portlet.RESET_ACTION_KEY).toString();

String flexFileName = request.getContextPath() + "/${portletName}/edit.swf" + 
	"?saveActionURL=" + saveActionURL.replace('&', '|') +
	"&resetActionURL=" + resetActionURL.replace('&', '|');
String flashWidth = "100%";
String flashHeight = "100%";

String flashVars = 
	"showParams=" + modelBean.getShowParams() + 
	"&param1=" + modelBean.getParam1() + 
	"&param2=" + modelBean.getParam2() + 
	"&param3=" + modelBean.getParam3() +
	"&locale=" + locale.toString();
%>

<script language="javascript" >
	function resizeContainer(height) {
		var div = document.getElementById("${portletName?uncap_first}EditSwfWrapper");
		div.style.height = height + "px";
	}
</script>

<div id="${portletName?uncap_first}EditSwfWrapper" style="overflow: auto; overflow-y:hidden">
	<object 
		border="none"
		classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
		codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab" 
		width="<%= flashWidth %>" height="<%= flashHeight %>"> 
		<param name="movie" value="<%= flexFileName %>"/> 
		<param name="play" value="true"/>
		<param name="loop" value="false"/>
		<param name="quality" value="high"/>
		<param name="menu" value="false"/>
		<param name="wmode" value="window"/>
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="flashVars" value="<%= flashVars %>"/>
		<embed 
			src="<%= flexFileName %>" 
			play="true" loop="false" quality="high" 
			menu="false" type="application/x-shockwave-flash" wmode="window" 
			pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash" 
			width="<%= flashWidth %>" height="<%= flashHeight %>"
			allowScriptAccess="sameDomain"
			flashVars="<%= flashVars %>" />
	</object>
</div>
