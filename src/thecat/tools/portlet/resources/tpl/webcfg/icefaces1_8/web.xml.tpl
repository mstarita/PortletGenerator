<?xml version="1.0" encoding="UTF-8" standalone="no"?>

<web-app version="2.4">
    <display-name>${portletName} Portlet</display-name>

    <description>${portletName} Portlet using Mojarra and Icefaces 1.8.</description>

	<context-param>
		<param-name>com.icesoft.faces.hiddenPortletAttributes</param-name>
		<param-value>COMPANY_ID LAYOUT RENDER_PORTLET THEME_DISPLAY</param-value>
	</context-param>    
    <context-param>
        <param-name>javax.faces.application.CONFIG_FILES</param-name>
        <param-value>/WEB-INF/faces-config.xml</param-value>
    </context-param>

    <context-param>
        <param-name>javax.faces.STATE_SAVING_METHOD</param-name>
        <param-value>server</param-value>
    </context-param>

    <context-param> 
          <param-name>javax.faces.DEFAULT_SUFFIX</param-name> 
          <param-value>.jspx</param-value> 
    </context-param>

    <context-param>
        <param-name>com.icesoft.faces.compressResources</param-name>
        <param-value>true</param-value>
    </context-param>

<!-- Specifies to the ICEfaces framework that synchronous update mode is to be 
     used.  By default, ICEfaces uses asynchronous update mode to support 
     server-initiated updates (AJAX push).  Setting to true will enable 
     synchronous update mode and disable AJAX push features. -->
    <context-param>
        <param-name>com.icesoft.faces.synchronousUpdate</param-name>
        <param-value>false</param-value>
    </context-param>

<!-- Specifies to the ICEfaces framework whether to support multiple views of a 
     single application from the same browser.  When running in a Portlet 
     environment, this parameter must be set to true. -->
    <context-param>
        <param-name>com.icesoft.faces.concurrentDOMViews</param-name>
        <param-value>true</param-value>
    </context-param>

<!-- Specifies the amount of time in milliseconds that the bridge will wait for  
     a response from the server for a user-initiated request before declaring 
     the connection lost.  Un-comment and change the default value, if necessary.    
    <context-param>
        <param-name>com.icesoft.faces.connectionTimeout</param-name>
        <param-value>60000</param-value>
    </context-param>
-->

<!-- Specifies the amount of time in milliseconds that an idle asynchronous 
     blocking connection should be held open before being released. Normally, 
     the blocking connection is closed and re-opened with every communication to 
     the browser, such as user interaction or a heartbeat ping. The purpose of 
     this setting is to remove the possibility of threads being held blocked for 
     a long duration on a dead or completely inactive client connection. This 
     value should be longer than the heartbeat interval to avoid unnecessary
     network traffic.  Un-comment and change the default value, if necessary.    
    <context-param>
        <param-name>com.icesoft.faces.blockingConnectionTimeout</param-name>
        <param-value>90000</param-value>
    </context-param>
-->

<!-- Specifies the amount of time in milliseconds between heartbeat messages.  
     Un-comment and change the default value, if necessary.    
    <context-param>
        <param-name>com.icesoft.faces.heartbeatInterval</param-name>
        <param-value>50000</param-value>
    </context-param>
-->

<!-- Specifies how many consecutive heartbeat connection attempts may fail 
     before the connection is considered lost.  Un-comment and change the 
     default value, if necessary.    
    <context-param>
        <param-name>com.icesoft.faces.heartbeatRetries</param-name>
        <param-value>3</param-value>
    </context-param>
-->

<!-- Specifies the number of milliseconds that a heartbeat request waits for a 
     successful response before it is considered timed out.  Un-comment and 
     change the default value, if necessary.    
    <context-param>
        <param-name>com.icesoft.faces.heartbeatTimeout</param-name>
        <param-value>30000</param-value>
    </context-param>
-->

<!-- Specifies a page URI to redirect the client to when an asynchronous 
     connection is lost. The parameter value must be surrounded by single 
     quotes.  Un-comment and change the default value, if necessary.    
    <context-param>
        <param-name>com.icesoft.faces.connectionLostRedirectURI</param-name>
        <param-value></param-value>
    </context-param>
-->

<!-- ConfigureListener is not generally required. Due to an apparent bug in 
     Tomcat users have reported seeing the following error "SEVERE: ICEfaces 
     could not initialize JavaServer Faces. Please check that the JSF .jar files 
     are installed correctly.". Specifying the ConfigureListener resolves the 
     issue. 
    <listener> 
        <listener-class>com.sun.faces.config.ConfigureListener</listener-class> 
    </listener>
--> 

<#if ! icefacesExtReq>
	<context-param>
		<param-name>
			com.icesoft.faces.standardRequestScope
		</param-name>
		<param-value>true</param-value>
	</context-param>
</#if>

    <servlet>
        <servlet-name>Faces Servlet</servlet-name>
        <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet>
        <servlet-name>Blocking Servlet</servlet-name>
        <servlet-class>com.icesoft.faces.webapp.xmlhttp.BlockingServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet>
        <servlet-name>Persistent Faces Servlet</servlet-name>
        <servlet-class>com.icesoft.faces.webapp.xmlhttp.PersistentFacesServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>Faces Servlet</servlet-name>
        <url-pattern>*.faces</url-pattern>
    </servlet-mapping>

    <servlet-mapping>
        <servlet-name>Blocking Servlet</servlet-name>
        <url-pattern>/block/*</url-pattern>
    </servlet-mapping>

    <servlet-mapping>
        <servlet-name>Persistent Faces Servlet</servlet-name>
        <url-pattern>/xmlhttp/*</url-pattern>
    </servlet-mapping>

    <servlet-mapping>
        <servlet-name>Persistent Faces Servlet</servlet-name>
        <url-pattern>*.iface</url-pattern>
    </servlet-mapping>

    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>

</web-app>

