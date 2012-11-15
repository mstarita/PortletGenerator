# Set 'FLEX_HOME' property to your flex4 sdk installation directory and
# 'FLEX_TASKS_JAR' to your flexTasks.jar location.
# WARNING: this property must have this exact name ('FLEX_HOME').
FLEX_HOME=/flex_sdk_4.6
<#noparse>FLEX_TASKS_JAR=${FLEX_HOME}/ant/lib/flexTasks.jar</#noparse>

# War and context path.
APP_NAME=${portletName?uncap_first}FlexPortlet
<#noparse>WEBAPP_CONTEXT_ROOT=/${APP_NAME}</#noparse>
