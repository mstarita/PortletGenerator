<?xml version="1.0" encoding="UTF-8"?><#noparse>
<zk>
	<style src="/css/form.css" />

	<window border="normal" width="100%" 
		apply="org.zkoss.bind.BindComposer"
		viewModel="@id('vm') @init('</#noparse>${packageName}.Edit${portletName}<#noparse>ViewModel')" >
		
		<vlayout width="100%" >
		
			<html><h3 class="header"><span>${labels.</#noparse>${portletName}<#noparse>.edit.header}</span></h3></html>
			
			<grid>
				<rows>
					<row>
						<label value="${labels.param.showParams}" width="50px" />
						<checkbox id="showParams" 
							checked="@init(vm.editModel.showParams) @load(vm.editModel.showParams, after='actionReset') @save(vm.editModel.showParams, before='actionSave')"/>
					</row>
					<row>
						<label value="${labels.param.param1}" width="50px" />
						<textbox id="param1" 
							value="@init(vm.editModel.param1) @load(vm.editModel.param1, after='actionReset') @save(vm.editModel.param1, before='actionSave')" />
					</row>
					<row>
						<label value="${labels.param.param2}" width="50px" />
						<textbox id="param2" 
							value="@init(vm.editModel.param2) @load(vm.editModel.param2, after='actionReset') @save(vm.editModel.param2, before='actionSave')" />
					</row>
					<row>
						<label value="${labels.param.param3}" width="50px" />
						<textbox id="param3" 
							value="@init(vm.editModel.param3) @load(vm.editModel.param3, after='actionReset') @save(vm.editModel.param3, before='actionSave')" />
					</row>
				</rows>
			</grid>
		</vlayout>
		
		<separator />
		
		<hlayout>
			<button label="${labels.button.reset}" onClick="@command('actionReset')" />
			<button label="${labels.button.save}" onClick="@command('actionSave')" />
		</hlayout>
		
		<div visible="@load(!empty vm.editModel.errorMessage)" sclass="portlet-msg-error">
			<label value="@load(vm.editModel.errorMessage)" />
		</div>
		
		<div visible="@load(!empty vm.editModel.infoMessage)" sclass="portlet-msg-success">
			<label value="@load(vm.editModel.infoMessage)" />
		</div>	
			
	</window>
	
</zk>
</#noparse>