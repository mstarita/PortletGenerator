<#noparse><?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:f="http://java.sun.com/jsf/core" 
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:ice="http://www.icesoft.com/icefaces/component" 
	xmlns:ace="http://www.icefaces.org/icefaces/components" >

	<h:head/>
	
	<h:body>
	
		<link href="#{request.contextPath}/xmlhttp/css/rime/rime-portlet.css" rel="stylesheet" type="text/css"/>
		<link href="#{request.contextPath}/css/form.css" rel="stylesheet" type="text/css"/>
		
		<ice:form styleClass="form" >
			<h3><span><h:outputText value="#{i18n['</#noparse>${portletName}.view.header']}" /></span></h3><#noparse>
			
			<ice:panelGrid columns="1" style="width:100%">					
				<ice:outputLabel value="#{i18n['view.message']}:" id="lblMessage" />
				
				<hr/>
				
				<ice:commandButton
					value="#{i18n['button.sample']}"
					action="#{view</#noparse>${portletName}<#noparse>BackingBean.actionSample}" />
			</ice:panelGrid>
		
			<p/>
			
			<ice:panelGrid columns="1" style="width:100%" rendered="#{edit</#noparse>${portletName}<#noparse>ModelBean.showParams}">
				
			<hr/>
			
				<ice:panelGrid columns="2" style="width:100%" >
					<ice:outputLabel value="#{i18n['param.param1']}" id="lblParam1" />
					<ice:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param1}" id="valParam1" />
					
					<ice:outputLabel value="#{i18n['param.param2']}" id="lblParam2" />
					<ice:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param2}" id="valParam2" />
					
					<ice:outputLabel value="#{i18n['param.param3']}" id="lblParam3" />
					<ice:outputLabel value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param3}" id="valParam3" />
				</ice:panelGrid>
				
			</ice:panelGrid>
			
		</ice:form>

	</h:body>
	
</html>
</#noparse>