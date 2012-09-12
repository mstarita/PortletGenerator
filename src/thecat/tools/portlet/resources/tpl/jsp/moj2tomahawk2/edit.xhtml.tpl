<#noparse><?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:c="http://java.sun.com/jsp/jstl/core"
	xmlns:t="http://myfaces.apache.org/tomahawk" >
	
	<h:head/>
	
	<h:body>
		
		<link href="#{request.contextPath}/css/form.css" rel="stylesheet" type="text/css"/>
		
		<h:form id="</#noparse>${portletName}<#noparse>Form" styleClass="form" >
		
			<h3><span><t:outputLabel value="#{i18n['</#noparse>${portletName}<#noparse>.edit.header']}"/></span></h3>
	
			<fieldset>
				<t:panelGrid columns="2" style="width:100%" >
					<t:outputLabel id="lblShowParams" value="#{i18n['param.showParams']}"/>
					<t:selectBooleanCheckbox id="chkShowParams" 
						value="#{edit</#noparse>${portletName}ModelBean.showParams}" /><#noparse>						
				</t:panelGrid>				
			</fieldset>
				
			<p/>
			
			<fieldset>
				<t:panelGrid columns="2" style="width:100%" >
					<t:outputLabel value="#{i18n['param.param1']}:" id="lblParam1" />
					<t:inputText id="txtParam1" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param1}" />
					
					<t:outputLabel value="#{i18n['param.param2']}:" id="lblParam2" />
					<t:inputText id="txtParam2" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param2}" />
					
					<t:outputLabel value="#{i18n['param.param3']}:" id="lblParam3" />
					<t:inputText id="txtParam3" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param3}" />
				</t:panelGrid>
			</fieldset>	
			
			<p/>
			
			<t:commandButton
				value="#{i18n['button.reset']}"
				actionListener="#{edit</#noparse>${portletName}BackingBean.actionReset}" /><#noparse>
			<t:commandButton
				value="#{i18n['button.save']}"
				actionListener="#{edit</#noparse>${portletName}BackingBean.actionSave}" /><#noparse>
			
			<p/>
				
			<h:messages globalOnly="true" layout="table" />
			
		</h:form>
	</h:body>
</html>
</#noparse>
