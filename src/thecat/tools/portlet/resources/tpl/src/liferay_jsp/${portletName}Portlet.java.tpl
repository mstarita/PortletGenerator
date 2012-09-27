package ${packageName};

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.util.bridges.mvc.MVCPortlet;

public class ${portletName}Portlet extends MVCPortlet implements Edit${portletName}ActionBean, View${portletName}ActionBean {
	
	public static final String VIEW_MODEL_BEAN_ATTR_KEY = "viewModelBean";
	public static final String EDIT_MODEL_BEAN_ATTR_KEY = "editModelBean";

	public static final String INFO_MESSAGE_ATTR_KEY = "infoMessage";
	public static final String ERROR_MESSAGE_ATTR_KEY = "errorMessage";
	
	private View${portletName}ModelBean viewModelBean = null;
	private View${portletName}ActionBean viewActionBean = null;
	
	private Edit${portletName}ModelBean editModelBean = null;
	private Edit${portletName}ActionBean editActionBean = null;
	
	@Override
	public void doView(RenderRequest request, RenderResponse response) throws IOException, PortletException {
		
		if (viewModelBean == null) {
			init(request);
		}
		
		request.setAttribute(VIEW_MODEL_BEAN_ATTR_KEY, viewModelBean);
		request.setAttribute(EDIT_MODEL_BEAN_ATTR_KEY, editModelBean);
		
		super.doView(request, response);
		
	}
	
	@Override
	public void doEdit(RenderRequest request, RenderResponse response) throws IOException, PortletException {
		
		if (viewModelBean == null) {
			init(request);
		}
		
		request.setAttribute(EDIT_MODEL_BEAN_ATTR_KEY, editModelBean);
		
		super.doEdit(request, response);
		
	}

	private void init(RenderRequest request) {
		
		System.out.println("init ${portletName}Portlet...");
		
		viewModelBean = new View${portletName}ModelBean();
		viewActionBean = new View${portletName}ActionBeanImpl(viewModelBean);
		
		editModelBean = new Edit${portletName}ModelBean(request.getPreferences());
		editActionBean = new Edit${portletName}ActionBeanImpl(editModelBean);
		
	}

	///////////////////////////////////////////////////////////////////////////
	// View Action - start
	@Override
	public void simpleAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		
		viewActionBean.simpleAction(actionRequest, actionResponse);
		
	}
	// View Action - end
	///////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////////////////////////////////
	// Edit Action - start
	@Override
	public void saveAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		
		editActionBean.saveAction(actionRequest, actionResponse);
		
	}
	
	@Override
	public void resetAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		
		editActionBean.resetAction(actionRequest, actionResponse);
		
	}
	// Edit Action - end
	///////////////////////////////////////////////////////////////////////////
	
}
