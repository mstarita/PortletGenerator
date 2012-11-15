package ${packageName};

import java.io.IOException;
import java.io.PrintWriter;

import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.portlet.ResourceURL;

import com.liferay.util.bridges.mvc.MVCPortlet;

public class ${portletName}Portlet extends MVCPortlet {
	
	public static final String EDIT_MODEL_KEY = "editModel";
	public static final String LOCALE_KEY = "locale";
	public static final String SAVE_ACTION_KEY = "saveAction";
	public static final String RESET_ACTION_KEY = "resetAction";
	
	public static final String RESOURCE_ID_SAVE_ACTION = "saveAction";
	public static final String RESOURCE_ID_RESET_ACTION = "resetAction";
	
	@Override
	public void doView(RenderRequest request, RenderResponse response) throws IOException, PortletException {

		request.setAttribute(EDIT_MODEL_KEY, loadPrefs(request.getPreferences()));
		request.setAttribute(LOCALE_KEY, request.getLocale());
				
		super.doView(request, response);
		
	}
	
	@Override
	public void doEdit(RenderRequest request, RenderResponse response) throws IOException, PortletException {
		
		ResourceURL saveActionURL = response.createResourceURL();
		saveActionURL.setResourceID(RESOURCE_ID_SAVE_ACTION);
		
		ResourceURL resetActionURL = response.createResourceURL();
		resetActionURL.setResourceID(RESOURCE_ID_RESET_ACTION);
		
		request.setAttribute(EDIT_MODEL_KEY, loadPrefs(request.getPreferences()));
		request.setAttribute(LOCALE_KEY, request.getLocale());
		request.setAttribute(SAVE_ACTION_KEY, saveActionURL);
		request.setAttribute(RESET_ACTION_KEY, resetActionURL);
		
		super.doEdit(request, response);
		
	}

	@Override
	public void serveResource(ResourceRequest request, ResourceResponse response) throws IOException, PortletException {
		
		PortletPreferences prefs = request.getPreferences();
		
		if (request.getResourceID().equals(RESOURCE_ID_SAVE_ACTION)) {
			
			System.out.println("Saving prefs...");
			
			prefs.setValue(Edit${portletName}ModelBean.PREFS_SHOW_PARAMS, request.getParameter("showParams"));
			prefs.setValue(Edit${portletName}ModelBean.PREFS_PARAM1, request.getParameter("param1"));
			prefs.setValue(Edit${portletName}ModelBean.PREFS_PARAM2, request.getParameter("param2"));
			prefs.setValue(Edit${portletName}ModelBean.PREFS_PARAM3, request.getParameter("param3"));
			prefs.store();
			
		} else if (request.getResourceID().equals(RESOURCE_ID_RESET_ACTION)) {
			
			System.out.println("Resetting prefs...");
			
			prefs.reset(Edit${portletName}ModelBean.PREFS_SHOW_PARAMS);
			prefs.reset(Edit${portletName}ModelBean.PREFS_PARAM1);
			prefs.reset(Edit${portletName}ModelBean.PREFS_PARAM2);
			prefs.reset(Edit${portletName}ModelBean.PREFS_PARAM3);
			
			Edit${portletName}ModelBean modelBean = loadPrefs(prefs);
			
			response.setContentType("text/xml");
			
			String xmlPrefs = "<showParams>" + modelBean.getShowParams().toString() + "</showParams>";
			xmlPrefs += "<param1>" + modelBean.getParam1() + "</param1>";
			xmlPrefs += "<param2>" + modelBean.getParam2() + "</param2>";
			xmlPrefs += "<param3>" + modelBean.getParam3() + "</param3>";
			
			PrintWriter out = response.getWriter();
			out.print(xmlPrefs);
			
		}
	}
	
	private Edit${portletName}ModelBean loadPrefs(PortletPreferences portletPrefs) {
		
		Edit${portletName}ModelBean editModel = new Edit${portletName}ModelBean();
		
		editModel.setShowParams(Boolean.parseBoolean(portletPrefs.getValue(Edit${portletName}ModelBean.PREFS_SHOW_PARAMS, "false")));
		editModel.setParam1(portletPrefs.getValue(Edit${portletName}ModelBean.PREFS_PARAM1, "p1"));
		editModel.setParam2(portletPrefs.getValue(Edit${portletName}ModelBean.PREFS_PARAM2, "p2"));
		editModel.setParam3(portletPrefs.getValue(Edit${portletName}ModelBean.PREFS_PARAM3, "p3"));
		
		return editModel;
	}
}
