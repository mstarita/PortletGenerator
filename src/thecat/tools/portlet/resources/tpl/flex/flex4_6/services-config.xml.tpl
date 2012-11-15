<?xml version="1.0" encoding="UTF-8"?>

<services-config>

    <services>
        <service
            id="granite-service-${portletName}-view"
            class="flex.messaging.services.RemotingService"
            messageTypes="flex.messaging.messages.RemotingMessage">
            <destination id="${portletName?uncap_first}ViewService">
                <channels>
                    <channel ref="my-graniteamf"/>
                </channels>
                <properties>
                    <scope>request</scope>
                    <source>${packageName}.View${portletName}Service</source>
                </properties>
            </destination>
        </service>
    </services>

    <channels>
        <channel-definition id="my-graniteamf" class="mx.messaging.channels.AMFChannel">
            <endpoint
                uri="http://{server.name}:{server.port}/{context.root}/graniteamf/amf"
                class="flex.messaging.endpoints.AMFEndpoint"/>
        </channel-definition>
    </channels>

</services-config>
