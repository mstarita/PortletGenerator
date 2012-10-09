<?xml version="1.0" encoding="UTF-8"?><#noparse>
<zk>
	<style src="/css/form.css" />
	
	<window border="normal" width="100%" 
		apply="org.zkoss.bind.BindComposer"
		viewModel="@id('vmView') @init('</#noparse>${packageName}.View${portletName}ViewModel')"><#noparse>
		
		<vlayout width="100%" >
		
			<html><h3 class="header"><span>${labels.</#noparse>${portletName}<#noparse>.view.header}</span></h3></html>
			
			<label value="${labels.view.message}" />
			
			<separator bar="true" />
			
			<button label="${labels.button.sample}" onClick="@command('actionSample')" />
			
			<separator />
			
			<grid visible="@load(vmView.editModel.showParams)">
				<rows>
					<row>
						<label value="${labels.param.param1}" width="50px"/>
						<label value="@load(vmView.editModel.param1)" />
					</row>
					<row>
						<label value="${labels.param.param2}" width="50px" />
						<label value="@load(vmView.editModel.param2)" />
					</row>
					<row>
						<label value="${labels.param.param3}" width="50px" />
						<label value="@load(vmView.editModel.param3)" />
					</row>
				</rows>
			</grid>
		</vlayout>
		
	</window>
	
</zk>
</#noparse>