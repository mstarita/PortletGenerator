<#noparse><?xml version="1.0" encoding="UTF-8"?>
<f:view 
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:c="http://java.sun.com/jstl/core"
	xmlns:ice="http://www.icesoft.com/icefaces/component">
	
	<ice:portlet>
		
		<ice:outputStyle href="/xmlhttp/css/rime/rime-portlet.css"/>
		<ice:outputStyle href="/css/form.css"/>
	
		<ice:form id="</#noparse>${portletName}<#noparse>Form" styleClass="form" >

			<h3><span><h:outputLabel value="#{i18n['</#noparse>${portletName}<#noparse>.edit.header']}"/></span></h3>
			
			<fieldset>
				
				<ice:panelGrid columns="2" style="width:100%" >
					<ice:outputLabel value="#{i18n['param.showParams']}:" id="lblShowParams" />
					<ice:selectBooleanCheckbox id="chkShowParams" 
						value="#{edit</#noparse>${portletName}<#noparse>ModelBean.showParams}" />
				</ice:panelGrid>
			</fieldset>

			<p/>
				
			<fieldset>
			
				<ice:panelGrid columns="2" style="width:100%" >
					<ice:outputLabel value="#{i18n['param.param1']}:" id="lblParam1" />
					<ice:inputText id="txtParam1" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param1}" />
					
					<ice:outputLabel value="#{i18n['param.param2']}:" id="lblParam2" />
					<ice:inputText id="txtParam2" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param2}" />
					
					<ice:outputLabel value="#{i18n['param.param3']}:" id="lblParam3" />
					<ice:inputText id="txtParam3" value="#{edit</#noparse>${portletName}<#noparse>ModelBean.param3}" />
				</ice:panelGrid>
				
			</fieldset>
						
			<p/>
			
			<ice:commandButton
				value="#{i18n['button.reset']}"
				actionListener="#{edit</#noparse>${portletName}BackingBean.actionReset}" /><#noparse>
			<ice:commandButton
				value="#{i18n['button.save']}"
				actionListener="#{edit</#noparse>${portletName}BackingBean.actionSave}" /><#noparse>
			
			<p/>
				
			<ice:messages globalOnly="true" layout="table" />
			
		</ice:form>
		
	</ice:portlet>
</f:view>
</#noparse>
