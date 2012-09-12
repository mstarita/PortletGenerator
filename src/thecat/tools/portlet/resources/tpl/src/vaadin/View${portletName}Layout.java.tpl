package ${packageName};

import ${viewUtilPackage}.ResourceBundleProperty;

import com.vaadin.data.Property.ValueChangeEvent;
import com.vaadin.data.Property.ValueChangeListener;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.GridLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.VerticalLayout;

public class View${portletName}Layout extends VerticalLayout implements ValueChangeListener, ClickListener {

	private ResourceBundleProperty resourceBundleProperty;
	private Edit${portletName}ModelBean editModelBean;
	
	private Label headerLabel;
	private Label label;
	private Button button;
	private VerticalLayout paramContainer;
	private Label param1Label;
	private Label param2Label;
	private Label param3Label;
	
	public View${portletName}Layout(
			ResourceBundleProperty resourceBundleProperty,
			Edit${portletName}ModelBean editModelBean) {
		this.resourceBundleProperty = resourceBundleProperty;
		this.editModelBean = editModelBean;
		
		setWidth("100%");
		
		// label: ${portletName}.view.header
		headerLabel = new Label();
		headerLabel.setContentMode(Label.CONTENT_XHTML);
		headerLabel.setHeight("100%");
		headerLabel.setWidth("100%");
		addComponent(headerLabel);
		
		// label: view.message
		label = new Label();
		addComponent(label);
		
		addComponent(new Label("<hr/>", Label.CONTENT_XHTML));
		
		// label: button.sample
		button = new Button();
		button.addListener((ClickListener) this);
		addComponent(button);
		
		paramContainer = new VerticalLayout();
		paramContainer.setVisible(editModelBean.getPropShowParams().getValue());
		paramContainer.addComponent(new Label("<hr/>", Label.CONTENT_XHTML));
		
		editModelBean.getPropShowParams().addListener(this);
		
		GridLayout paramLayout = new GridLayout(2, 3);
		paramLayout.setSpacing(true);

		// label: param.param1
		param1Label = new Label();
		Label valueParam1 = new Label(editModelBean.getPropParam1());
		paramLayout.addComponent(param1Label);
		paramLayout.addComponent(valueParam1);
		
		// label: param.param2
		param2Label = new Label();
		Label valueParam2 = new Label(editModelBean.getPropParam2());
		paramLayout.addComponent(param2Label);
		paramLayout.addComponent(valueParam2);
		
		// label: param.param3
		param3Label = new Label();
		Label valueParam3 = new Label(editModelBean.getPropParam3());
		paramLayout.addComponent(param3Label);
		paramLayout.addComponent(valueParam3);		
		
		paramContainer.addComponent(paramLayout);
		
		addComponent(paramContainer);
		
		updateI18NCaptions();
		
		resourceBundleProperty.getResourceBundleProp().addListener(this);
	}
	
	@Override
	public void buttonClick(ClickEvent event) {
		
		if (event.getComponent() == button) {
			System.out.println("button clicked!!!");
		}
		
	}

	@Override
	public void valueChange(ValueChangeEvent event) {
		
		if (event.getProperty() == editModelBean.getPropShowParams()) {
			
			paramContainer.setVisible(editModelBean.getPropShowParams().getValue());
			
		} else if (event.getProperty() == resourceBundleProperty.getResourceBundleProp()) {
			
			updateI18NCaptions();
			
		}
		
	}
	
	private void updateI18NCaptions() {
		headerLabel.setValue("<h2 style='background:#57a700;color:#fff;font-size:20px'>" + 
				resourceBundleProperty.getString("${portletName}.view.header") +
				"</h2>");
		label.setValue(resourceBundleProperty.getString("view.message"));
		button.setCaption(resourceBundleProperty.getString("button.sample"));
		param1Label.setValue(resourceBundleProperty.getString("param.param1"));
		param2Label.setValue(resourceBundleProperty.getString("param.param2"));
		param3Label.setValue(resourceBundleProperty.getString("param.param3"));
		
	}
}
