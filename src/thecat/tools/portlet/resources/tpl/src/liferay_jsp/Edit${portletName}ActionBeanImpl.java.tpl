package ${packageName};

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

public class Edit${portletName}ActionBeanImpl implements Edit${portletName}ActionBean {

	private Edit${portletName}ModelBean modelBean;
	
	public Edit${portletName}ActionBeanImpl(Edit${portletName}ModelBean modelBean) {
		this.modelBean = modelBean;
	}
	
	@Override
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
			
			modelBean.setShowParams(Boolean.valueOf(showParams));
			modelBean.setParam1(param1);
			modelBean.setParam2(param2);
			modelBean.setParam3(param3);
			
			actionRequest.setAttribute(${portletName}Portlet.INFO_MESSAGE_ATTR_KEY, "edit.save.msg.success");
			
		} catch (Exception ex) {
			actionRequest.setAttribute(${portletName}Portlet.ERROR_MESSAGE_ATTR_KEY, "edit.save.msg.fail");
			ex.printStackTrace();
		}
	}
	
	@Override
	public void resetAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		
		System.out.println("resetAction fired!!!");
		
		try {
			
			actionRequest.getPreferences().reset(Edit${portletName}ModelBean.PREFS_SHOW_PARAMS);
			actionRequest.getPreferences().reset(Edit${portletName}ModelBean.PREFS_PARAM1);
			actionRequest.getPreferences().reset(Edit${portletName}ModelBean.PREFS_PARAM2);
			actionRequest.getPreferences().reset(Edit${portletName}ModelBean.PREFS_PARAM3);
			
			modelBean.init(actionRequest.getPreferences());
			
		} catch (Exception ex) {
			actionRequest.setAttribute(${portletName}Portlet.ERROR_MESSAGE_ATTR_KEY, "edit.reset.msg.fail");
			ex.printStackTrace();
		}
		
	}
}
