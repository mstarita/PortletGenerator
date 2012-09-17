<?xml version="1.0"?>

<portlet-app xmlns="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd" version="2.0">
	<portlet>
		<portlet-name>1</portlet-name>
		<display-name>Liferay Jsp ${portletName} Portlet</display-name>
		<portlet-class>${packageName}.${portletName}Portlet</portlet-class>
		<init-param>
			<name>view-jsp</name>
			<value>/${portletName}/view.jsp</value>
		</init-param>
		<init-param>
			<name>edit-jsp</name>
			<value>/${portletName}/edit.jsp</value>
		</init-param>
		<init-param>
	      <name>add-process-action-success-action</name>
	      <value>false</value>
	    </init-param>
		<expiration-cache>0</expiration-cache>
		<supports>
			<mime-type>text/html</mime-type>
			<portlet-mode>view</portlet-mode>
			<portlet-mode>edit</portlet-mode>
		</supports>
		<portlet-info>
			<title>Liferay Jsp ${portletName} Portlet</title>
			<short-title>liferayJsp${portletName}</short-title>
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
		
		<security-role-ref>
			<role-name>administrator</role-name>
		</security-role-ref>
		<security-role-ref>
			<role-name>guest</role-name>
		</security-role-ref>
		<security-role-ref>
			<role-name>power-user</role-name>
		</security-role-ref>
		<security-role-ref>
			<role-name>user</role-name>
		</security-role-ref>
	</portlet>
</portlet-app>