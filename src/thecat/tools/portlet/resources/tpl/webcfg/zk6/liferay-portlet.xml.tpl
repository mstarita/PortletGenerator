<?xml version="1.0"?>
<!DOCTYPE liferay-portlet-app PUBLIC "-//Liferay//DTD Portlet Application 5.2.0//EN" "http://www.liferay.com/dtd/liferay-portlet-app_5_2_0.dtd">
<liferay-portlet-app>
	<portlet>
		<portlet-name>1</portlet-name>
		<header-portlet-javascript>/zkau/web/js/zk.wpd</header-portlet-javascript>
	</portlet>
	
	<role-mapper>
		<role-name>administrator</role-name>
		<role-link>Administrator</role-link>
	</role-mapper>
	<role-mapper>
		<role-name>guest</role-name>
		<role-link>Guest</role-link>
	</role-mapper>
	<role-mapper>
		<role-name>power-user</role-name>
		<role-link>Power User</role-link>
	</role-mapper>
	<role-mapper>
		<role-name>user</role-name>
		<role-link>User</role-link>
	</role-mapper>
</liferay-portlet-app>