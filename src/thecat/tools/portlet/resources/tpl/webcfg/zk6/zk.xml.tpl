<?xml version="1.0" encoding="UTF-8"?>
<zk>
<!--	<library-property>-->
<!--		<name>org.zkoss.zk.portlet.PageRenderPatch.class</name>-->
<!--		<value>org.zkoss.zkplus.liferay.JQueryRenderPatch</value>-->
<!--	</library-property>-->
	<library-property>
		<name>org.zkoss.zk.portlet.PageRenderPatch.class</name>
		<value>org.zkoss.zkplus.liferay.JQueryRenderCachedPatch</value>
	</library-property>
	<library-property>
		<name>org.zkoss.zkplus.liferary.jQueryPatch</name>
		<value>500</value>
	</library-property>
	<system-config>
	    <label-location>/WEB-INF/classes/resources/Language.properties</label-location>
	</system-config>
</zk>