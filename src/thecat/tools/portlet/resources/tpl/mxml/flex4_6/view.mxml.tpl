<?xml version="1.0" encoding="utf-8"?>
<s:Application
	xmlns:fx="http://ns.adobe.com/mxml/2009"
	xmlns:s="library://ns.adobe.com/flex/spark"
	xmlns:mx="library://ns.adobe.com/flex/mx" 
	initialize="init()" creationComplete="initAfterComplete()" >
	
	<fx:Metadata>
		[ResourceBundle("Language")]
	</fx:Metadata>
	
	<fx:Style>
		 @namespace s "library://ns.adobe.com/flex/spark";
		 
		.h3 {
			color: #ffffff;
			fontSize: 20;
			paddingTop: 3;
			paddingBotton: 3;
		}
	
		@font-face {
			src: url("../../resources/Ubuntu-L.ttf");
			font-family: ubuntu;
			font-style: normal;
			font-weight: normal;
			embed-as-cff: true;
			advanced-anti-aliasing: true;
		}
		
		s|Label {
        	font-family: ubuntu;
    	}
	</fx:Style>
	
	<mx:VBox id="${portletName?uncap_first}View" width="100%">
		<s:Label id="header" text="{resourceManager.getString('Language', '${portletName}.view.header')}" width="100%" styleName="h3" />
		<mx:Spacer />
		<mx:Label text="{resourceManager.getString('Language', 'view.message')}" />
		<mx:Spacer />
		<mx:Button label="{resourceManager.getString('Language', 'button.sample')}" click="${portletName?uncap_first}ViewService.sampleAction()" />
		
		<mx:VBox id="vboxParam" width="100%" visible="{editModel.showParams}" includeInLayout="{editModel.showParams}" >
			
			<mx:Spacer />
			<mx:HRule width="100%" />
			
			<mx:HBox>
				<mx:Label text="{resourceManager.getString('Language', 'param.param1')}" width="100" />
				<mx:Label text="{editModel.param1}" />
			</mx:HBox>
			<mx:HBox>
				<mx:Label text="{resourceManager.getString('Language', 'param.param2')}" width="100" />
				<mx:Label text="{editModel.param2}" />
			</mx:HBox>
			<mx:HBox>
				<mx:Label text="{resourceManager.getString('Language', 'param.param3')}" width="100" />
				<mx:Label text="{editModel.param3}" />
			</mx:HBox>
			
		</mx:VBox>
		
	</mx:VBox>

	<fx:Declarations>
		<mx:RemoteObject id="${portletName?uncap_first}ViewService" showBusyCursor="true" fault="onFault(event)" destination="${portletName?uncap_first}ViewService" >
			<mx:method name="sampleAction" result="onResultSampleAction(event)" fault="onFault(event)" />
		</mx:RemoteObject>
	</fx:Declarations>
	
	<fx:Script>
        <![CDATA[
        	import ${packageName}.Edit${portletName}Model;
        	
        	import mx.core.FlexGlobals;
        	import mx.controls.Alert;
        	import mx.rpc.events.FaultEvent;
			import mx.rpc.events.ResultEvent;
			
        	[Bindable]
        	private var editModel: Edit${portletName}Model;
        	
        	private function init():void {
        		header.setStyle("backgroundColor", "#57a700");
        		
        		editModel = new Edit${portletName}Model();
        		if (FlexGlobals.topLevelApplication.parameters.showParams == "true") {
        			editModel.showParams = true;
        		} else {
        			editModel.showParams = false;
        		}
        		editModel.param1 = FlexGlobals.topLevelApplication.parameters.param1;
        		editModel.param2 = FlexGlobals.topLevelApplication.parameters.param2;
        		editModel.param3 = FlexGlobals.topLevelApplication.parameters.param3;
        		
        		var locale: String = FlexGlobals.topLevelApplication.parameters.locale;
        		resourceManager.localeChain = [ locale ];
        	}
        	
        	private function initAfterComplete() {
				ExternalInterface.call('resizeContainer', ${portletName?uncap_first}View.height);
    		}
    		
        	private function onFault(event : FaultEvent) : void {
				Alert.show(event.fault.message);
			}
			
			private function onResultSampleAction(event : ResultEvent) : void {
				
			}
        ]]>
	</fx:Script>	
</s:Application>
