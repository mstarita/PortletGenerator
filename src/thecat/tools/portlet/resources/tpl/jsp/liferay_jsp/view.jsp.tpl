<%@include file="/${portletName}/init.jsp" %>

<% 
Edit${portletName}ModelBean editModelBean = (Edit${portletName}ModelBean) 
	request.getAttribute(${portletName}Portlet.EDIT_MODEL_BEAN_ATTR_KEY);
%>

<portlet:actionURL name="simpleAction" var="simpleActionURL"/>

<aui:form action="<%= simpleActionURL.toString() %>" method="post">

	<h3 class="header"><span><%= LanguageUtil.get(pageContext, "${portletName}.view.header") %></span></h3>
	
	<aui:fieldset>
		
		<%= LanguageUtil.get(pageContext, "view.message") %>
		
		<aui:button-row>
			<aui:button type="submit" value="<%= LanguageUtil.get(pageContext, "button.sample") %>"/>
		</aui:button-row>
	</aui:fieldset>

<c:if test="<%= editModelBean.getShowParams() %>">
	<aui:fieldset>
	
		<hr/>
		
		<%= LanguageUtil.get(pageContext, "param.param1") %>: <%= editModelBean.getParam1() %><br/>
		<%= LanguageUtil.get(pageContext, "param.param2") %>: <%= editModelBean.getParam2() %><br/>
		<%= LanguageUtil.get(pageContext, "param.param3") %>: <%= editModelBean.getParam3() %><br/>
		
	</aui:fieldset>
</c:if>

</aui:form>
