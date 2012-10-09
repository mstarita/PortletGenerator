package ${packageName};

import javax.portlet.PortletPreferences;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ContextParam;
import org.zkoss.bind.annotation.ContextType;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.http.FullDHtmlLayoutPortlet;

import ${viewUtilPackage}.zk.LabelsUtil;

import com.liferay.portal.kernel.util.Validator;

public class Edit${portletName}ViewModel {

	private static final long serialVersionUID = 1L;

	private Edit${portletName}Model editModel;
	
	@Init
	public void init(@ContextParam(ContextType.SESSION) Session session, @ContextParam(ContextType.DESKTOP) Desktop desktop) {
		
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
	@NotifyChange("editModel")
	public void actionReset(@ContextParam(ContextType.SESSION) Session session) {
		
		System.out.println("actionReset invoked!!!");
		
		PortletPreferences portletPrefs = (PortletPreferences) session.getAttribute(FullDHtmlLayoutPortlet.PORTLET_PREFS_ATTR_KEY);
		
		try {
			
			portletPrefs.reset(Edit${portletName}Model.PREFS_SHOW_PARAMS);
			portletPrefs.reset(Edit${portletName}Model.PREFS_PARAM1);
			portletPrefs.reset(Edit${portletName}Model.PREFS_PARAM2);
			portletPrefs.reset(Edit${portletName}Model.PREFS_PARAM3);
		
			editModel.init(portletPrefs);
			
			editModel.setErrorMessage(null);
			editModel.setInfoMessage(null);
			
		} catch (Exception ex) {
			
			editModel.setErrorMessage(LabelsUtil.getLabel("edit.reset.msg.fail"));
			editModel.setInfoMessage(null);
			
			ex.printStackTrace();
			
		}
		
	}
	
	@Command
	@NotifyChange("editModel")
	public void actionSave(@ContextParam(ContextType.SESSION) Session session) {
		
		System.out.println("actionSave invoked!!!");
		
		PortletPreferences portletPrefs = (PortletPreferences) session.getAttribute(FullDHtmlLayoutPortlet.PORTLET_PREFS_ATTR_KEY);
		
		try {
			portletPrefs.setValue(Edit${portletName}Model.PREFS_SHOW_PARAMS, editModel.getShowParams().toString());
			portletPrefs.setValue(Edit${portletName}Model.PREFS_PARAM1, editModel.getParam1());
			portletPrefs.setValue(Edit${portletName}Model.PREFS_PARAM2, editModel.getParam2());
			portletPrefs.setValue(Edit${portletName}Model.PREFS_PARAM3, editModel.getParam3());
			
			portletPrefs.store();
			
			editModel.setInfoMessage(LabelsUtil.getLabel("edit.save.msg.success"));
			editModel.setErrorMessage(null);
			
		} catch (Exception ex) {
			
			editModel.setErrorMessage(LabelsUtil.getLabel("edit.save.msg.fail"));
			editModel.setInfoMessage(null);
			
			ex.printStackTrace();
			
		}

	}

}
