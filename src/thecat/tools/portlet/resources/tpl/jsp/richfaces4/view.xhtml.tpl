<#noparse><?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:f="http://java.sun.com/jsf/core" 
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:a4j="http://richfaces.org/a4j"
	xmlns:rich="http://richfaces.org/rich" >

	<h:head/>
	
	<h:body>
	
		<link href="#{request.contextPath}/css/form.css" rel="stylesheet" type="text/css"/>
		
		<h:form styleClass="form">
			<h3><span><h:outputText value="#{i18n['</#noparse>${portletName}.view.header']}" /></span></h3><#noparse>
			
			<h:panelGrid columns="1" style="width:100%">
				<h:outputLabel value="#{i18n['view.message']}" id="lblMessage" />
				
				<hr/>
				
				<a4j:commandButton
					value="#{i18n['button.sample']}"
					action="#{view</#noparse>${portletName}<#noparse>BackingBean.actionSample}" />
			</h:panelGrid>

			<p/>
			
			<h:panelGrid columns="1" style="width:100%" rendered="#{edit</#noparse>${portletName}<#noparse>ModelBean.showParams}">
			
				<hr/>
				
				<h:panelGrid columns="2" style="width:100%" >
					<h:outputLabel value="#{i18n['param.param1']}" id="lblParam1" />
					<h:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param1}" id="valParam1" />
					
					<h:outputLabel value="#{i18n['param.param2']}" id="lblParam2" />
					<h:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param2}" id="valParam2" />
					
					<h:outputLabel value="#{i18n['param.param3']}" id="lblParam3" />
					<h:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param3}" id="valParam3" />
				</h:panelGrid>
				
			</h:panelGrid>
		</h:form>

	</h:body>
	
</html>
</#noparse>