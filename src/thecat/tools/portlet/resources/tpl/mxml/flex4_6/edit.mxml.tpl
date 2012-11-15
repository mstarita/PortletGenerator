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
		
	<mx:VBox id="${portletName?uncap_first}Edit" width="100%">
		<s:Label id="header" text="{resourceManager.getString('Language', '${portletName}.edit.header')}" width="100%" styleName="h3" />
		
		<mx:Spacer />
		
		<mx:HBox>
			<mx:Label text="{resourceManager.getString('Language', 'param.showParams')}" width="150"/>
			<mx:CheckBox id="chkShowParams" selected="@{editModel.showParams}" />
		</mx:HBox>
		
		<mx:Spacer />
		
		<mx:HBox>
			<mx:Label text="{resourceManager.getString('Language', 'param.param1')}" width="150" />
			<mx:TextInput text="@{editModel.param1}" />
		</mx:HBox>
		<mx:HBox>
			<mx:Label text="{resourceManager.getString('Language', 'param.param2')}" width="150" />
			<mx:TextInput text="@{editModel.param2}" />
		</mx:HBox>
		<mx:HBox>
			<mx:Label text="{resourceManager.getString('Language', 'param.param3')}" width="150" />
			<mx:TextInput text="@{editModel.param3}" />
		</mx:HBox>
		
		<mx:HBox>
			<mx:Button label="{resourceManager.getString('Language', 'button.reset')}" 	click="{resetPrefsRPC.send()}" />
			<mx:Button label="{resourceManager.getString('Language', 'button.save')}" 	click="{savePrefsRPC.send()}" />
		</mx:HBox>
	</mx:VBox>

	<fx:Declarations>
		<mx:HTTPService id="savePrefsRPC" fault="onFault(event);" resultFormat="text"
		    url="{saveActionURL}"
		    useProxy="false" showBusyCursor="true"
		    method="POST">
		    <mx:request xmlns="">
		        <showParams>{editModel.showParams}</showParams>
		        <param1>{editModel.param1}</param1>
		        <param2>{editModel.param2}</param2>
		        <param3>{editModel.param3}</param3>
		    </mx:request>
		</mx:HTTPService>
    
	    <mx:HTTPService id="resetPrefsRPC" result="onResetPrefsResult(event);" fault="onFault(event);" 	    
	    	url="{resetActionURL}"
		    method="POST"
		    useProxy="false" showBusyCursor="true">
		    <mx:request xmlns="">
		    </mx:request>
		</mx:HTTPService>
	</fx:Declarations>
	
	<fx:Script>
        <![CDATA[
        	import ${packageName}.Edit${portletName}Model;			
			import mx.core.FlexGlobals;
			import mx.controls.Alert;
        	import mx.rpc.events.FaultEvent;
			import mx.rpc.events.ResultEvent;
			
        	[Bindable]
        	public var editModel: Edit${portletName}Model;
        	[Bindable]
        	public var saveActionURL: String;
        	[Bindable]
        	public var resetActionURL: String;
        	
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
        		
        		var locale: String =  FlexGlobals.topLevelApplication.parameters.locale;
        		resourceManager.localeChain = [ locale ];
        		
        		var reg: RegExp = /[|]/g;
        		saveActionURL = FlexGlobals.topLevelApplication.parameters.saveActionURL.replace(reg, "&");
        		resetActionURL = FlexGlobals.topLevelApplication.parameters.resetActionURL.replace(reg, "&");
        	}
        	
        	private function initAfterComplete() {
				ExternalInterface.call('resizeContainer', ${portletName?uncap_first}Edit.height);
    		}
    		
        	public function onFault(event : FaultEvent) : void {
				Alert.show(event.fault.message);
			}
			
			public function onResetPrefsResult(event : ResultEvent) : void {
				
				if (event.result.showParams == "true") {
					editModel.showParams = true;
				} else {
					editModel.showParams = false;
				}
				editModel.param1 = event.result.param1 as String;
				editModel.param2 = event.result.param2 as String;
				editModel.param3 = event.result.param3 as String;
				
			}
        ]]>
	</fx:Script>
	
</s:Application>
