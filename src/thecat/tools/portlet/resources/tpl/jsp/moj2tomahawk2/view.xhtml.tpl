<#noparse><?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:f="http://java.sun.com/jsf/core" 
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:t="http://myfaces.apache.org/tomahawk" >

	<h:head/>
	
	<h:body>
	
		<link href="#{request.contextPath}/css/form.css" rel="stylesheet" type="text/css"/>
		
		<h:form styleClass="form">
			<h3><span><t:outputText value="#{i18n['</#noparse>${portletName}.view.header']}" /></span></h3><#noparse>
			
			<t:panelGrid columns="1" style="width:100%">
				<t:outputLabel value="#{i18n['view.message']}" id="lblMessage" />
				
				<hr/>
				
				<t:commandButton
					value="#{i18n['button.sample']}"
					action="#{view</#noparse>${portletName}<#noparse>BackingBean.actionSample}" />
			</t:panelGrid>

			<p/>
			
			<t:panelGrid columns="1" style="width:100%" rendered="#{edit</#noparse>${portletName}<#noparse>ModelBean.showParams}">
			
				<hr/>
				
				<t:panelGrid columns="2" style="width:100%">
					<t:outputLabel value="#{i18n['param.param1']}" id="lblParam1" />
					<t:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param1}" id="valParam1" />
					
					<t:outputLabel value="#{i18n['param.param2']}" id="lblParam2" />
					<t:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param2}" id="valParam2" />
					
					<t:outputLabel value="#{i18n['param.param3']}" id="lblParam3" />
					<t:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param3}" id="valParam3" />
				</t:panelGrid>
			</t:panelGrid>
		</h:form>

	</h:body>
	
</html>
</#noparse>