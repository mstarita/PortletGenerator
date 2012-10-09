package ${packageName};

import javax.portlet.PortletPreferences;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ContextParam;
import org.zkoss.bind.annotation.ContextType;
import org.zkoss.bind.annotation.Init;
import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.http.FullDHtmlLayoutPortlet;

import com.liferay.portal.kernel.util.Validator;

public class View${portletName}ViewModel {

	private static final long serialVersionUID = 1L;
	
	private View${portletName}Model viewModel;
	
	private Edit${portletName}Model editModel;
	
	@Init
	public void init(@ContextParam(ContextType.SESSION) Session session, @ContextParam(ContextType.DESKTOP) Desktop desktop) {
	
		viewModel = new View${portletName}Model();
		
		if (Validator.isNull(desktop.getAttribute(Edit${portletName}Model.EDIT_MODEL_KEY_ATTR))) {
			PortletPreferences portletPrefs = (PortletPreferences) session.getAttribute(FullDHtmlLayoutPortlet.PORTLET_PREFS_ATTR_KEY);
			editModel = new Edit${portletName}Model(portletPrefs);
			desktop.setAttribute(Edit${portletName}Model.EDIT_MODEL_KEY_ATTR, editModel);
		} else {
			editModel = (Edit${portletName}Model) desktop.getAttribute(Edit${portletName}Model.EDIT_MODEL_KEY_ATTR);
		}
		
	}
	
	public Edit${portletName}Model getEditModel() {
		return editModel;
	}
	
	@Command
	public void actionSample() {
		
		System.out.println("actionSample invoked!!!");
		
	}
	
}
