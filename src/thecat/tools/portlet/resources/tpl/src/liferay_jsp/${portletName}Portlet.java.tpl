package ${packageName};

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.util.bridges.mvc.MVCPortlet;

public class SimpleSamplePortlet extends MVCPortlet {
	
	public static final String EDIT_MODEL_BEAN_ATTR_KEY = "editModelBean";

	public static final String INFO_MESSAGE_ATTR_KEY = "infoMessage";
	public static final String ERROR_MESSAGE_ATTR_KEY = "errorMessage";
	
	private Edit${portletName}ModelBean editModelBean = null;
	
	@Override
	public void doView(RenderRequest request, RenderResponse response) throws IOException, PortletException {
		
		if (editModelBean == null) {
			init(request);
		}
		
		request.setAttribute(EDIT_MODEL_BEAN_ATTR_KEY, editModelBean);
		
		super.doView(request, response);
		
	}
	
	@Override
	public void doEdit(RenderRequest request, RenderResponse response) throws IOException, PortletException {
		
		if (editModelBean == null) {
			init(request);
		}
		
		request.setAttribute(EDIT_MODEL_BEAN_ATTR_KEY, editModelBean);
		
		super.doEdit(request, response);
		
	}

	private void init(RenderRequest request) {
		
		System.out.println("init editModelBean...");
		
		editModelBean = new Edit${portletName}ModelBean(request);
		
	}

	public void simpleAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		
		System.out.println("simpleAction fired!!!");
		
	}

	public void saveAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		
		System.out.println("saveAction fired!!!");
		
		try {
			
			String showParams = actionRequest.getParameter(Edit${portletName}ModelBean.PREFS_SHOW_PARAMS);
			String param1 = actionRequest.getParameter(Edit${portletName}ModelBean.PREFS_PARAM1);
			String param2 = actionRequest.getParameter(Edit${portletName}ModelBean.PREFS_PARAM2);
			String param3 = actionRequest.getParameter(Edit${portletName}ModelBean.PREFS_PARAM3);
			
			actionRequest.getPreferences().setValue(Edit${portletName}ModelBean.PREFS_SHOW_PARAMS, 
				showParams);
			actionRequest.getPreferences().setValue(Edit${portletName}ModelBean.PREFS_PARAM1, 
					param1);
			actionRequest.getPreferences().setValue(Edit${portletName}ModelBean.PREFS_PARAM2, 
					param2);
			actionRequest.getPreferences().setValue(Edit${portletName}ModelBean.PREFS_PARAM3, 
					param3);
			actionRequest.getPreferences().store();
			
			editModelBean.setShowParams(Boolean.valueOf(showParams));
			editModelBean.setParam1(param1);
			editModelBean.setParam2(param2);
			editModelBean.setParam3(param3);
			
			actionRequest.setAttribute(EDIT_MODEL_BEAN_ATTR_KEY, editModelBean);
			
			actionRequest.setAttribute(INFO_MESSAGE_ATTR_KEY, "edit.save.msg.success");
			
		} catch (Exception ex) {
			actionRequest.setAttribute(ERROR_MESSAGE_ATTR_KEY, "edit.save.msg.fail");
			ex.printStackTrace();
		}
	}
	
	public void resetAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		
		System.out.println("resetAction fired!!!");
		
		try {
			
			actionRequest.getPreferences().reset(Edit${portletName}ModelBean.PREFS_SHOW_PARAMS);
			actionRequest.getPreferences().reset(Edit${portletName}ModelBean.PREFS_PARAM1);
			actionRequest.getPreferences().reset(Edit${portletName}ModelBean.PREFS_PARAM2);
			actionRequest.getPreferences().reset(Edit${portletName}ModelBean.PREFS_PARAM3);
			
			editModelBean = new Edit${portletName}ModelBean(actionRequest);
			
			actionRequest.setAttribute(EDIT_MODEL_BEAN_ATTR_KEY, editModelBean);
			
		} catch (Exception ex) {
			actionRequest.setAttribute(ERROR_MESSAGE_ATTR_KEY, "edit.reset.msg.fail");
			ex.printStackTrace();
		}
		
	}
}
