<?xml version="1.0" encoding="UTF-8"?>
<project name="${portletName?uncap_first}FlexPortlet" default="war">

    <property file="env.properties"/>
    <property file="project.properties"/>
    <xmlproperty prefix="eclipse" file=".project"/>

    <echo message="Found in env.properties {"/>
    <echo message="    FLEX_HOME=<#noparse>${FLEX_HOME}</#noparse>"/>
    <echo message="    FLEX_TASKS_JAR=<#noparse>${FLEX_TASKS_JAR}</#noparse>"/>
    <echo message="}"/>

    <taskdef resource="flexTasks.tasks" classpath="<#noparse>${FLEX_TASKS_JAR}</#noparse>" />

    <!--
     ! Update core GDS libs.
     !-->
    <target name="update.libs" if="graniteds.path">
        <ant
            antfile="<#noparse>${GRANITEDS_PROJECT_PATH}</#noparse>/build.xml"
            dir="<#noparse>${GRANITEDS_PROJECT_PATH}</#noparse>"
            target="build.jar.swc" />
        <copy todir="WEB-INF/lib">
            <fileset dir="<#noparse>${GRANITEDS_PROJECT_PATH}</#noparse>/build">
                <include name="granite.jar"/>
            </fileset>
        </copy>
    </target>

    <!--
     ! Build swf (if swf is out of date).
     !-->
    <target name="copy.mxml">
        <mkdir dir="build"/>
        <mkdir dir="build/swf"/>
        <copy todir="build/swf">
            <fileset dir="WebContent">
                <include name="**/*.mxml"/>
                <include name="**/*.css"/>
                <include name="**/*.png"/>
                <include name="**/*.as"/>
            	<include name="img/*.*"/>
            </fileset>
        </copy>
    </target>
    <target name="check.swf" depends="copy.mxml">
        <uptodate property="skip.mxmlc" targetfile="build/swf/<#noparse>${APP_NAME}</#noparse>.swf">
            <srcfiles dir= "<#noparse>${FLEX_HOME}</#noparse>/frameworks" includes="**"/>
            <srcfiles dir= "build/swf" includes="**/*.mxml"/>
            <srcfiles dir= "WebContent" includes="WEB-INF/flex/services-config.xml"/>
        </uptodate>
    </target>
    <target name="build.mxml" depends="check.swf" unless="skip.mxmlc">
        <mxmlc
            file="WebContent/${portletName}/view.mxml"
            output="build/swf/${portletName}/view.swf"
            context-root="<#noparse>${WEBAPP_CONTEXT_ROOT}</#noparse>"
            use-network="true"
            keep-generated-actionscript="true"
            incremental="true"
        	debug="true"
        	locale="it_IT,en_US" 
        	services="WebContent/WEB-INF/flex/services-config.xml" >
        	
        	<arg line="-static-link-runtime-shared-libraries=true"/>

            <load-config filename="<#noparse>${FLEX_HOME}</#noparse>/frameworks/flex-config.xml"/>

            <source-path path-element="<#noparse>${FLEX_HOME}</#noparse>/frameworks"/>
            <source-path path-element="build/swf"/>
        	<source-path path-element="locale/{locale}"/>
        	<source-path path-element="src"/>
        </mxmlc>
    	<mxmlc
            file="WebContent/${portletName}/edit.mxml"
            output="build/swf/${portletName}/edit.swf"
            context-root="<#noparse>${WEBAPP_CONTEXT_ROOT}</#noparse>"
            use-network="true"
            keep-generated-actionscript="true"
            incremental="true"
        	debug="true"
        	locale="it_IT,en_US" 
    		services="WebContent/WEB-INF/flex/services-config.xml" >
    		
    		<arg line="-static-link-runtime-shared-libraries=true"/>

            <load-config filename="<#noparse>${FLEX_HOME}</#noparse>/frameworks/flex-config.xml"/>

            <source-path path-element="<#noparse>${FLEX_HOME}</#noparse>/frameworks"/>
            <source-path path-element="build/swf"/>
        	<source-path path-element="locale/{locale}"/>
    		<source-path path-element="src"/>
        </mxmlc>
    </target>

	<target name="wrapper.swf" depends="build.mxml">
		<html-wrapper title="${portletName?uncap_first} flex portlet"
			file="view.html"
			application="app"
			swf="view"
			history="true"
			express-install="true"
			version-detection="true"
			output="build/swf/${portletName}"/>
		
		<html-wrapper title="${portletName?uncap_first} flex portlet"
					file="edit.html"
					application="app"
					swf="edit"
					history="true"
					express-install="true"
					version-detection="true"
					output="build/swf/${portletName}"/>
	</target>
	
    <!--
     ! Compile Java sources (unless this script is launched from Eclipse).
     !-->
    <target name="build.javac" depends="update.libs" unless="eclipse.pdebuild.home">
        <mkdir dir="classes"/>

        <path id="gds.classpath">
            <fileset dir="WebContent/WEB-INF/lib" includes="**"/>
        </path>

        <javac destdir="classes" srcdir="src" classpathref="gds.classpath"
            target="1.6" source="1.6"/>
    </target>

    <!--
     ! Build war.
     !-->
    <target name="war" depends="build.javac,build.mxml">
        <mkdir dir="build"/>
        <mkdir dir="build/war"/>
        <war destfile="build/war/<#noparse>${APP_NAME}</#noparse>.war" webxml="WebContent/WEB-INF/web.xml">
            <zipfileset dir="build/classes" prefix="WEB-INF/classes" />
            <fileset dir="build/swf" includes="${portletName}/*.swf"/>
        	<fileset dir="build/swf" includes="${portletName}/*.html"/>
            <fileset dir="WebContent">
                <include name="*.js"/>
                <include name="*.html"/>
                <include name="*.gif"/>
            	<include name="img/*.*"/>
            	<include name="${portletName}/*.jsp"/>
            	<include name="WEB-INF/**"/>
            	<include name="WEB-INF/flex/**"/>
				<include name="WEB-INF/granite/**"/>
            </fileset>
            <lib dir="WebContent/WEB-INF/lib">
                <exclude name="javax.servlet.jar"/>
            </lib>
        </war>
    </target>
    
</project>
