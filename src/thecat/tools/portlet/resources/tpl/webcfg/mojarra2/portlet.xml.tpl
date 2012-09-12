<?xml version="1.0"?>
<portlet-app xmlns="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd" version="2.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd">
        <portlet>
                <portlet-name>1</portlet-name>
                <display-name>Mojarra ${portletName} Portlet</display-name>
                <portlet-class>javax.portlet.faces.GenericFacesPortlet</portlet-class>
                
                <init-param>
                        <name>javax.portlet.faces.defaultViewId.view</name>
                        <value>/${portletName}/view.xhtml</value>
                </init-param>
                
                <init-param>
                        <name>javax.portlet.faces.defaultViewId.edit</name>
                        <value>/${portletName}/edit.xhtml</value>
                </init-param>
                
                <init-param>
                        <name>javax.portlet.faces.preserveActionParams</name>
                        <value>true</value>
                </init-param>
                
                <supports>
                        <mime-type>text/html</mime-type>
                        <portlet-mode>view</portlet-mode>
                        <portlet-mode>edit</portlet-mode>
                </supports>
                
                <portlet-info>
                        <title>Mojarra ${portletName} Portlet</title>
                        <short-title>moj${portletName}</short-title>
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
