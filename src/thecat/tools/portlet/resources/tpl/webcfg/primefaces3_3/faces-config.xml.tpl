<#noparse><?xml version="1.0" encoding="UTF-8"?>
<faces-config
    xmlns="http://java.sun.com/xml/ns/javaee"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-facesconfig_2_0.xsd"
    version="2.0">
	
	<managed-bean>
		</#noparse><managed-bean-name>view${portletName}ModelBean</managed-bean-name>
		<managed-bean-class>${packageName}.View${portletName}ModelBean</managed-bean-class><#noparse>
		<managed-bean-scope>session</managed-bean-scope>
	</managed-bean>
	
	<managed-bean>
		<managed-bean-name>facesUtil</managed-bean-name>
		<managed-bean-class>thecat.common.view.util.FacesUtil</managed-bean-class>
		<managed-bean-scope>none</managed-bean-scope>
	</managed-bean>
	
	<managed-bean>
		<managed-bean-name>view</#noparse>${portletName}BackingBean</managed-bean-name>
		<managed-bean-class>${packageName}.View${portletName}BackingBean</managed-bean-class><#noparse>
		<managed-bean-scope>view</managed-bean-scope>
		<managed-property>
			<property-name>viewModelBean</property-name>
			<value>#{view</#noparse>${portletName}ModelBean}</value><#noparse>
		</managed-property>
		<managed-property>
			<property-name>i18n</property-name>
			<value>#{i18n}</value>
		</managed-property>
	</managed-bean>
	
	<managed-bean>
		</#noparse><managed-bean-name>edit${portletName}ModelBean</managed-bean-name>
		<managed-bean-class>${packageName}.Edit${portletName}ModelBean</managed-bean-class>
		<managed-bean-scope>session</managed-bean-scope>
	</managed-bean><#noparse>	
	
	<managed-bean>
		<managed-bean-name>edit</#noparse>${portletName}BackingBean</managed-bean-name>
		<managed-bean-class>${packageName}.Edit${portletName}BackingBean</managed-bean-class>
		<managed-bean-scope>request</managed-bean-scope>
		<managed-property><#noparse>
			<property-name>modelBean</property-name>
			<value>#{edit</#noparse>${portletName}ModelBean}</value><#noparse>
		</managed-property>
		<managed-property>
			<property-name>i18n</property-name>
			<value>#{i18n}</value>
		</managed-property>
	</managed-bean>
</#noparse>
	
</faces-config>
