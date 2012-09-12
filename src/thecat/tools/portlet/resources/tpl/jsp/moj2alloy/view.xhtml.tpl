<#noparse><?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:f="http://java.sun.com/jsf/core" 
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:aui="http://liferay.com/faces/aui" >

	<h:head/>
	
	<h:body>
	
		<link href="#{request.contextPath}/css/form.css" rel="stylesheet" type="text/css"/>
		
		<aui:layout>
			<h:form styleClass="form">
				<h3><span><h:outputText value="#{i18n['</#noparse>${portletName}.view.header']}" /></span></h3><#noparse>
				
					<aui:fieldset>
						<h:panelGrid columns="1" style="width:100%">
							<h:outputLabel id="lblMessage" value="#{i18n['view.message']}" />
							
							<hr/>
							
							<h:commandButton
								value="#{i18n['button.sample']}"
								action="#{view</#noparse>${portletName}<#noparse>BackingBean.actionSample}" />
						</h:panelGrid>
					</aui:fieldset>

					<p/>
				
					<aui:fieldset rendered="#{edit</#noparse>${portletName}<#noparse>ModelBean.showParams}">
					
						<hr/>
						
						<h:panelGrid columns="2" style="width:100%">
							<h:outputLabel id="lblParam1" value="#{i18n['param.param1']}" />
							<h:outputLabel id="valParam1" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param1}" />
							
							<h:outputLabel id="lblParam2" value="#{i18n['param.param2']}" />
							<h:outputLabel id="valParam2" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param2}" />
							
							<h:outputLabel id="lblParam3" value="#{i18n['param.param3']}" />
							<h:outputLabel id="valParam3" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param3}" />
						</h:panelGrid>
					</aui:fieldset>

			</h:form>
		</aui:layout>

	</h:body>

</html>
</#noparse>