package ${packageName};

import java.util.Locale;

import javax.portlet.PortletPreferences;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ContextParam;
import org.zkoss.bind.annotation.ContextType;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.util.resource.impl.LabelLoader;
import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.http.FullDHtmlLayoutPortlet;

import com.liferay.portal.kernel.util.Validator;

public class Edit${portletName}ViewModel {

	private static final long serialVersionUID = 1L;

	private Edit${portletName}Model editModel;
	
	private PortletPreferences portletPrefs;
	private LabelLoader labelLoader;
	private Locale locale;
	
	@Init
	public void init(@ContextParam(ContextType.DESKTOP) Desktop desktop) {
		
		portletPrefs = 
			(PortletPreferences) Executions.getCurrent().getAttribute(FullDHtmlLayoutPortlet.PORTLET_PREFS_ATTR_KEY);
		labelLoader = (LabelLoader) Executions.getCurrent().getAttribute(FullDHtmlLayoutPortlet.LABEL_LOADER_ATTR_KEY);
		locale = (Locale) Executions.getCurrent().getAttribute(FullDHtmlLayoutPortlet.LOCALE_ATTR_KEY);
		
		if (Validator.isNull(desktop.getAttribute(Edit${portletName}Model.EDIT_MODEL_KEY_ATTR))) {
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
	public void actionReset() {
		
		System.out.println("actionReset invoked!!!");
		
		try {
			
			portletPrefs.reset(Edit${portletName}Model.PREFS_SHOW_PARAMS);
			portletPrefs.reset(Edit${portletName}Model.PREFS_PARAM1);
			portletPrefs.reset(Edit${portletName}Model.PREFS_PARAM2);
			portletPrefs.reset(Edit${portletName}Model.PREFS_PARAM3);
		
			editModel.init(portletPrefs);
			
			editModel.setErrorMessage(null);
			editModel.setInfoMessage(null);
			
		} catch (Exception ex) {
			
			editModel.setErrorMessage(labelLoader.getLabel(locale, "edit.reset.msg.fail"));
			editModel.setInfoMessage(null);
			
			ex.printStackTrace();
			
		}
		
	}
	
	@Command
	@NotifyChange("editModel")
	public void actionSave() {
		
		System.out.println("actionSave invoked!!!");
		
		try {
			portletPrefs.setValue(Edit${portletName}Model.PREFS_SHOW_PARAMS, editModel.getShowParams().toString());
			portletPrefs.setValue(Edit${portletName}Model.PREFS_PARAM1, editModel.getParam1());
			portletPrefs.setValue(Edit${portletName}Model.PREFS_PARAM2, editModel.getParam2());
			portletPrefs.setValue(Edit${portletName}Model.PREFS_PARAM3, editModel.getParam3());
			
			portletPrefs.store();
			
			editModel.setInfoMessage(labelLoader.getLabel(locale, "edit.save.msg.success"));
			editModel.setErrorMessage(null);
			
		} catch (Exception ex) {
			
			editModel.setErrorMessage(labelLoader.getLabel(locale, "edit.save.msg.fail"));
			editModel.setInfoMessage(null);
			
			ex.printStackTrace();
			
		}

	}

}
