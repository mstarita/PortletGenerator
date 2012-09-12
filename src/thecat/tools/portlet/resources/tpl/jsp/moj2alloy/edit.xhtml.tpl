<#noparse><?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:c="http://java.sun.com/jsp/jstl/core"
	xmlns:aui="http://liferay.com/faces/aui" >
	
	<h:head/>
	
	<h:body>
	
		<link href="#{request.contextPath}/css/form.css" rel="stylesheet" type="text/css"/>
		
		<aui:layout>
			<h:form id="</#noparse>${portletName}<#noparse>Form" styleClass="form" >
			
				<h3><span><h:outputLabel value="#{i18n['</#noparse>${portletName}<#noparse>.edit.header']}"/></span></h3>
		
				<aui:fieldset>
					<h:panelGrid columns="2" style="width:100%" >
						<aui:field id="lblShowParams" label="#{i18n['param.showParams']}">
							<h:selectBooleanCheckbox id="chkShowParams" value="#{edit</#noparse>${portletName}ModelBean.showParams}" /><#noparse>
						</aui:field>							
					</h:panelGrid>					
				</aui:fieldset>
					
				<hr/>
				
				<aui:fieldset>	
					<h:panelGrid columns="1" >
						<aui:field id="lblParam1" label="#{i18n['param.param1']}">
							<h:inputText id="txtParam1" value="#{edit</#noparse>${portletName}ModelBean.param1}" /><#noparse>
						</aui:field>
						
						<aui:field id="lblParam2" label="#{i18n['param.param2']}">
							<h:inputText id="txtParam2" value="#{edit</#noparse>${portletName}ModelBean.param2}" /><#noparse>
						</aui:field>
						
						<aui:field id="lblParam3" label="#{i18n['param.param3']}">
							<h:inputText id="txtParam3" value="#{edit</#noparse>${portletName}ModelBean.param3}" /><#noparse>
						</aui:field>
					</h:panelGrid>
				</aui:fieldset>	
				
				<hr/>
				
				<h:commandButton
					value="#{i18n['button.reset']}"
					actionListener="#{edit</#noparse>${portletName}BackingBean.actionReset}" /><#noparse>
				<h:commandButton
					value="#{i18n['button.save']}"
					actionListener="#{edit</#noparse>${portletName}BackingBean.actionSave}" /><#noparse>
				
				<p/>
					
				<h:messages globalOnly="true" layout="table" />
				
			</h:form>
		</aui:layout>
		
	</h:body>
</html>
</#noparse>
