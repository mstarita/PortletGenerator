<#noparse><?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:c="http://java.sun.com/jsp/jstl/core">
	
	<h:head/>
	
	<h:body>
	
		<link href="#{request.contextPath}/css/form.css" rel="stylesheet" type="text/css"/>
		
		<h:form id="</#noparse>${portletName}<#noparse>Form" styleClass="form" >
		
			<h3><span><h:outputLabel value="#{i18n['</#noparse>${portletName}<#noparse>.edit.header']}"/></span></h3>
	
			<fieldset>
				<h:panelGrid columns="2" style="width:100%" >
					<h:outputLabel id="lblShowParams" value="#{i18n['param.showParams']}"/>
					<h:selectBooleanCheckbox id="chkShowParams" 
						value="#{edit</#noparse>${portletName}ModelBean.showParams}" /><#noparse>						
				</h:panelGrid>				
			</fieldset>
				
			<p/>
			
			<fieldset>
				<h:panelGrid columns="2" style="width:100%" >
					<h:outputLabel value="#{i18n['param.param1']}:" id="lblParam1" />
					<h:inputText id="txtParam1" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param1}" />
					
					<h:outputLabel value="#{i18n['param.param2']}:" id="lblParam2" />
					<h:inputText id="txtParam2" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param2}" />
					
					<h:outputLabel value="#{i18n['param.param3']}:" id="lblParam3" />
					<h:inputText id="txtParam3" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param3}" />
				</h:panelGrid>
			</fieldset>
			
			<p/>
				
			<h:commandButton
				value="#{i18n['button.reset']}"
				actionListener="#{edit</#noparse>${portletName}BackingBean.actionReset}" /><#noparse>
			<h:commandButton
				value="#{i18n['button.save']}"
				actionListener="#{edit</#noparse>${portletName}BackingBean.actionSave}" /><#noparse>
			
			<p/>
				
			<h:messages globalOnly="true" layout="table" />
			
		</h:form>
	</h:body>
</html>
</#noparse>
