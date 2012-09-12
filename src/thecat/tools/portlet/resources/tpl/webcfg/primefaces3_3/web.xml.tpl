<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<web-app 
	id="WebApp_ID" version="2.4" xmlns="http://java.sun.com/xml/ns/j2ee" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">
    
    <display-name>PrimeFaces ${portletName} Portlet</display-name>

    <description>PrimeFaces ${portletName} Portlet using Mojarra 2.x and PrimeFaces 3.3.</description>

    <context-param>
        <param-name>javax.faces.STATE_SAVING_METHOD</param-name>
        <param-value>server</param-value>
    </context-param>

	<context-param>
		<param-name>primefaces.THEME</param-name>	
		<param-value>aristo</param-value>
	</context-param>
	
    <servlet>
        <servlet-name>Faces Servlet</servlet-name>
        <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>

</web-app>

