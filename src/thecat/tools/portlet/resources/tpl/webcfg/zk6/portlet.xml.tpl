<?xml version="1.0" encoding="UTF-8"?>
<portlet-app xmlns="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd" version="2.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd">
	<portlet>
		<portlet-name>1</portlet-name>
		<display-name>ZK ${portletName} Portlet</display-name>
		<portlet-class>org.zkoss.zk.ui.http.FullDHtmlLayoutPortlet</portlet-class>
		<expiration-cache>0</expiration-cache>
		<supports>
			<mime-type>text/html</mime-type>
			<portlet-mode>view</portlet-mode>
		</supports>
		<supports>
			<mime-type>text/html</mime-type>
			<portlet-mode>edit</portlet-mode>
		</supports>
		<portlet-info>
			<title>ZK ${portletName} Portlet</title>
			<short-title>zk${portletName}</short-title>
		</portlet-info>
		
		<portlet-preferences>
			 <preference>
				<name>zk_view_page</name>
				<value>/${portletName}/view.zul</value>
			</preference>
			<preference>
				<name>zk_edit_page</name>
				<value>/${portletName}/edit.zul</value>
			</preference>
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