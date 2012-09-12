<?xml version="1.0"?>
<portlet-app xmlns="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd"
        version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd">
        <portlet>
                <portlet-name>1</portlet-name>
                <display-name>Icefaces ${portletName} Portlet</display-name>
                <portlet-class>com.icesoft.faces.webapp.http.portlet.MainPortlet</portlet-class>
                
                <init-param>
                        <name>com.icesoft.faces.portlet.viewPageURL</name>
                        <value>/${portletName}/view.iface</value>
                </init-param>
                
                <init-param>
                        <name>com.icesoft.faces.portlet.editPageURL</name>
                        <value>/${portletName}/edit.iface</value>
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
                        <title>Icefaces ${portletName} Portlet</title>
                        <short-title>ice${portletName}</short-title>
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
