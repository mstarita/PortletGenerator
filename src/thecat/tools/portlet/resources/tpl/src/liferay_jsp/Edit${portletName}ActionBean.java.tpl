package ${packageName};

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

public interface Edit${portletName}ActionBean {

	void saveAction(ActionRequest actionRequest, ActionResponse actionResponse);
		
	void resetAction(ActionRequest actionRequest, ActionResponse actionResponse);

}
