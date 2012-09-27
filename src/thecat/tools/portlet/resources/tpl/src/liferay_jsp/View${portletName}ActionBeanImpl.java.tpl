package ${packageName};

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

public class View${portletName}ActionBeanImpl implements View${portletName}ActionBean {

	private View${portletName}ModelBean modelBean;
	
	public View${portletName}ActionBeanImpl(View${portletName}ModelBean modelBean) {
	
		this.modelBean = modelBean;
		
	}
	
	@Override
	public void simpleAction(ActionRequest actionRequest, ActionResponse actionResponse) {
		
		System.out.println("simpleAction fired!!!");
		
	}

}

