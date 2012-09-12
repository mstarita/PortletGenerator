package ${packageName};

import java.util.Locale;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.EventRequest;
import javax.portlet.EventResponse;
import javax.portlet.PortletMode;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import ${viewUtilPackage}.ResourceBundleProperty;

import com.vaadin.Application;
import com.vaadin.terminal.gwt.server.PortletApplicationContext2;
import com.vaadin.terminal.gwt.server.PortletApplicationContext2.PortletListener;
import com.vaadin.terminal.gwt.server.PortletRequestListener;
import com.vaadin.ui.Window;

public class ${portletName}Application extends Application implements PortletListener, PortletRequestListener {

	private ResourceBundleProperty resourceBundleProperty = 
			new ResourceBundleProperty(Locale.ITALY);
	private Edit${portletName}ModelBean editModelBean;
	
	private Window mainWindow;
	
	private View${portletName}Layout viewContent;
	private Edit${portletName}Layout editContent;

	private String currentLocale;
	
	@Override
	public void init() {
		mainWindow = new Window("${portletName} Portlet Application");
		setMainWindow(mainWindow);
		
		// start in view mode
		mainWindow.setContent(viewContent);
		
		if (getContext() instanceof PortletApplicationContext2) {
			PortletApplicationContext2 ctx = (PortletApplicationContext2) getContext();
			ctx.addPortletListener(this, this);
		}
		
	}
	
	@Override
	public void onRequestStart(javax.portlet.PortletRequest request, javax.portlet.PortletResponse response) {
		if (mainWindow == null) {
			editModelBean = new Edit${portletName}ModelBean();
			editModelBean.getPropShowParams().setValue(new Boolean(request.getPreferences().getValue("showParams", "false")));
			editModelBean.getPropParam1().setValue(request.getPreferences().getValue("param1", "param1"));
			editModelBean.getPropParam2().setValue(request.getPreferences().getValue("param2", "param2"));
			editModelBean.getPropParam3().setValue(request.getPreferences().getValue("param3", "param3"));
			
			viewContent = new View${portletName}Layout(resourceBundleProperty, editModelBean);
			editContent = new Edit${portletName}Layout(resourceBundleProperty, editModelBean);			
		}
		
		editContent.setPortletRequest(request);
	}
	
	@Override
	public void onRequestEnd(javax.portlet.PortletRequest request, javax.portlet.PortletResponse response) {
		// TODO Auto-generated method stub
	}
	
	@Override
	public void handleEventRequest(EventRequest request,
			EventResponse response, Window window) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void handleRenderRequest(RenderRequest request,
			RenderResponse response, Window window) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void handleActionRequest(ActionRequest request,
			ActionResponse response, Window window) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void handleResourceRequest(ResourceRequest request,
			ResourceResponse response, Window window) {
		
		resourceBundleProperty.setupLocale(request.getLocale());
		
		 if (request.getPortletMode() == PortletMode.EDIT) {
			 
			 window.setContent(editContent);
			 
		 } else if (request.getPortletMode() == PortletMode.VIEW) {
			 
			 window.setContent(viewContent);
	            
		 }
	}
}
