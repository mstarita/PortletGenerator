<%@include file="/${portletName}/init.jsp" %>

<% 
Edit${portletName}ModelBean editModelBean = (Edit${portletName}ModelBean) 
	request.getAttribute(${portletName}Portlet.EDIT_MODEL_BEAN_ATTR_KEY);

String infoMessage = (String) request.getAttribute(${portletName}Portlet.INFO_MESSAGE_ATTR_KEY);
String errorMessage = (String) request.getAttribute(${portletName}Portlet.ERROR_MESSAGE_ATTR_KEY);

%>

<portlet:actionURL name="saveAction" var="saveActionURL"/>
<portlet:actionURL name="resetAction" var="resetActionURL"/>

<aui:form name="${portletName}Form" method="post">

	<h3 class="header"><span><%= LanguageUtil.get(pageContext, "${portletName}.edit.header") %></span></h3>
	
	<aui:fieldset>
		
		<aui:input inlineLabel="left" label="<%= LanguageUtil.get(pageContext, "param.showParams") %>" type="checkbox" 
			name="<%= editModelBean.PREFS_SHOW_PARAMS %>" value="<%= editModelBean.getShowParams() %>" />
				
	</aui:fieldset>
	
	<hr/>
	
	<aui:fieldset>
		
		<aui:input label="<%= LanguageUtil.get(pageContext, "param.param1") %>" type="text" 
			name="<%= editModelBean.PREFS_PARAM1 %>" value="<%= editModelBean.getParam1() %>" />
		<aui:input label="<%= LanguageUtil.get(pageContext, "param.param2") %>" type="text" 
			name="<%= editModelBean.PREFS_PARAM2 %>" value="<%= editModelBean.getParam2() %>" />
		<aui:input label="<%= LanguageUtil.get(pageContext, "param.param3") %>" type="text" 
			name="<%= editModelBean.PREFS_PARAM3 %>" value="<%= editModelBean.getParam3() %>" />
				
	</aui:fieldset>
	
	<aui:button-row>
		<aui:button type="submit" name="resetAction" value="<%= LanguageUtil.get(pageContext, "button.reset") %>" 
			onClick='<%= "this.form.action = '" + resetActionURL.toString() + "'"%>' />
		<aui:button type="submit" name="saveAction" value="<%= LanguageUtil.get(pageContext, "button.save") %>" 
			onClick='<%= "this.form.action = '" + saveActionURL.toString() + "'"%>' />
	</aui:button-row>
	
	<c:if test="<%= infoMessage != null %>">
		<span class="portlet-msg-success"> 
			<liferay-ui:message key="<%= infoMessage %>" />
		</span> 
	</c:if>
	
	<c:if test="<%= errorMessage != null %>">
		<span class="portlet-msg-error"> 
			<liferay-ui:message key="<%= errorMessage %>" />
		</span>
	</c:if>
	
</aui:form>

