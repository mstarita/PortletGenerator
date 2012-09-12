package ${packageName};

import javax.portlet.PortletRequest;

import ${viewUtilPackage}.VaadinNotificationUtil;
import ${viewUtilPackage}.ResourceBundleProperty;

import com.vaadin.data.Property.ValueChangeEvent;
import com.vaadin.data.Property.ValueChangeListener;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.GridLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.TextField;
import com.vaadin.ui.VerticalLayout;

public class Edit${portletName}Layout extends VerticalLayout implements ValueChangeListener, ClickListener {

	private ResourceBundleProperty resourceBundleProperty;
	private Edit${portletName}ModelBean modelBean;
	
	private Label headerLabel;
	
	private Label showParamsLabel;
	private CheckBox showParamsCheckBox;
	
	private Label param1Label;
	private TextField param1TextField;
	
	private Label param2Label;
	private TextField param2TextField;
	
	private Label param3Label;
	private TextField param3TextField;
	
	private Button resetButton;
	private Button saveButton;
	
	private PortletRequest portletRequest;
	
	public Edit${portletName}Layout(
			ResourceBundleProperty resourceBundleProperty,
			Edit${portletName}ModelBean modelBean) {
		this.resourceBundleProperty = resourceBundleProperty;
		this.modelBean = modelBean;
		
		setWidth("100%");
		
		// label: ${portletName}.edit.header
		headerLabel = new Label();
		headerLabel.setContentMode(Label.CONTENT_XHTML);
		headerLabel.setHeight("100%");
		headerLabel.setWidth("100%");
		addComponent(headerLabel);
		
		GridLayout paramContainer = new GridLayout(2, 4);
		paramContainer.setSpacing(true);
		
		// label: param.showParams
		showParamsLabel = new Label();
		showParamsCheckBox = new CheckBox("", modelBean.getPropShowParams());
		paramContainer.addComponent(showParamsLabel);
		paramContainer.addComponent(showParamsCheckBox);
		
		// label: param.param1
		param1Label = new Label();
		param1TextField = new TextField(modelBean.getPropParam1());
		paramContainer.addComponent(param1Label);
		paramContainer.addComponent(param1TextField);
		
		// label: param.param2
		param2Label = new Label();
		param2TextField = new TextField(modelBean.getPropParam2());
		paramContainer.addComponent(param2Label);
		paramContainer.addComponent(param2TextField);
		
		// label: param.param3
		param3Label = new Label();
		param3TextField = new TextField(modelBean.getPropParam3());
		paramContainer.addComponent(param3Label);
		paramContainer.addComponent(param3TextField);
		
		addComponent(paramContainer);
		
		HorizontalLayout buttonContainer = new HorizontalLayout();
		buttonContainer.setSpacing(true);
		
		// label: button.reset
		resetButton = new Button();
		resetButton.addListener((ClickListener) this);
		buttonContainer.addComponent(resetButton);
		
		// label: button.save
		saveButton = new Button();
		saveButton.addListener((ClickListener) this);
		buttonContainer.addComponent(saveButton);
		
		addComponent(buttonContainer);
		
		updateI18NCaptions();
		
		resourceBundleProperty.getResourceBundleProp().addListener(this);
	}

	public void setModelBean(EditSimpleSampleModelBean modelBean) {
		this.modelBean = modelBean;
	}
	
	public void setPortletRequest(PortletRequest portletRequest) {
		this.portletRequest = portletRequest;
	}
	
	@Override
	public void buttonClick(ClickEvent event) {
		
		if (event.getComponent() == saveButton) {
			System.out.println("Saving ${portletName} portlet preferences... [" + modelBean + "]");
			
			try {
				
				portletRequest.getPreferences().setValue("showParams", modelBean.getPropShowParams().getValue().toString());
				portletRequest.getPreferences().setValue("param1", modelBean.getPropParam1().getValue());
				portletRequest.getPreferences().setValue("param2", modelBean.getPropParam2().getValue());
				portletRequest.getPreferences().setValue("param3", modelBean.getPropParam3().getValue());
				
				portletRequest.getPreferences().store();

				NotificationUtil.notificationInfo(this, 
						resourceBundleProperty.getString("edit.save.msg.success"), "");
				
			} catch (Exception ex) {
				System.out.println("error saving ${portletName} portlet preferences: " + ex.getMessage());
				
				NotificationUtil.notificationError(this, 
						resourceBundleProperty.getString("edit.save.msg.fail"), "");
			}
			
		} else if (event.getComponent() == resetButton) {
			System.out.println("Reset ${portletName} portlet preferences");
			
			try {
				portletRequest.getPreferences().reset("showParams");
				portletRequest.getPreferences().reset("param1");
				portletRequest.getPreferences().reset("param2");
				portletRequest.getPreferences().reset("param3");
				
				modelBean.getPropShowParams().setValue(new Boolean(portletRequest.getPreferences().getValue("showParams", "false")));
				modelBean.getPropParam1().setValue(portletRequest.getPreferences().getValue("param1", "param1"));
				modelBean.getPropParam2().setValue(portletRequest.getPreferences().getValue("param2", "param2"));
				modelBean.getPropParam3().setValue(portletRequest.getPreferences().getValue("param3", "param3"));
				
			} catch (Exception ex) {
				System.out.println("error resetting ${portletName} portlet preferences: " + ex.getMessage());
		
				NotificationUtil.notificationError(this, 
						resourceBundleProperty.getString("edit.reset.msg.fail"), "");
			}
			
		}
		
	}
	
	@Override
	public void valueChange(ValueChangeEvent event) {
		
		if (event.getProperty() == resourceBundleProperty.getResourceBundleProp()) {
			updateI18NCaptions();
		}
		
	}
	
	private void updateI18NCaptions() {
		headerLabel.setValue("<h2 style='background:#57a700;color:#fff;font-size:20px'>" + 
				resourceBundleProperty.getString("${portletName}.edit.header") +
				"</h2>");
		showParamsLabel.setValue(resourceBundleProperty.getString("param.showParams"));
		param1Label.setValue(resourceBundleProperty.getString("param.param1"));
		param2Label.setValue(resourceBundleProperty.getString("param.param2"));
		param3Label.setValue(resourceBundleProperty.getString("param.param3"));		
		resetButton.setCaption(resourceBundleProperty.getString("button.reset"));
		saveButton.setCaption(resourceBundleProperty.getString("button.save"));
	}
	
}
