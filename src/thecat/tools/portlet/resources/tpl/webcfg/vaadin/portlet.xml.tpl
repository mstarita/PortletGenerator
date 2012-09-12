<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<portlet-app xmlns="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xsi:schemaLocation="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd">

    <portlet>
        <portlet-name>1</portlet-name>
        <display-name>Vaadin ${portletName}</display-name>
        
        <portlet-class>com.vaadin.terminal.gwt.server.ApplicationPortlet2</portlet-class>
        <init-param>
            <name>application</name>
            <value>${packageName}.${portletName}Application</value>
        </init-param>
        
        <!--
          To enable displaying multiple Vaadin portlets on a page,
          they should all use the same widgetset. In that case, the
          widgetset can be configured on the portal level (parameter
          vaadin.widgetset) or here for each portlet.
        -->
        <!--
        <init-param>
            <name>widgetset</name>
            <value>com.vaadin.portal.gwt.PortalDefaultWidgetSet</value>
        </init-param>
        -->
        
        <!-- Supported portlet modes and content types. -->
        <supports>
            <mime-type>text/html</mime-type>
            <portlet-mode>view</portlet-mode>
            <portlet-mode>edit</portlet-mode>
            <!-- <portlet-mode>help</portlet-mode> -->
        </supports>
        
        <!-- Not always required but Liferay uses these. -->
        <portlet-info>
            <title>vaadin ${portletName}</title>
            <short-title>vaadin${portletName}</short-title>
        </portlet-info>
        
        <portlet-preferences>
			<preference>
				<name>showParams</name>
				<value>false</value>
			</preference>
			<preference>
				<name>param1</name>
				<value>value1</value>
			</preference>
			<preference>
				<name>param2</name>
				<value>value2</value>
			</preference>
			<preference>
				<name>param3</name>
				<value>value3</value>
			</preference>
		</portlet-preferences>
		
    </portlet>
</portlet-app>
