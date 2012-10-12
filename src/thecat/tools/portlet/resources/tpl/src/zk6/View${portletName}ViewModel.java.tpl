package ${packageName};

import java.util.Locale;

import javax.portlet.PortletPreferences;

import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ContextParam;
import org.zkoss.bind.annotation.ContextType;
import org.zkoss.bind.annotation.Init;
import org.zkoss.util.resource.impl.LabelLoader;
import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.http.FullDHtmlLayoutPortlet;

public class View${portletName}ViewModel {

	private static final long serialVersionUID = 1L;
	
	private View${portletName}Model viewModel;
	
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
		
		editModel = new Edit${portletName}Model(portletPrefs);
		viewModel = new View${portletName}Model();
		
	}
	
	public Edit${portletName}Model getEditModel() {
		return editModel;
	}
	
	@Command
	public void actionSample() {
		
		System.out.println("actionSample invoked!!!");
		
	}
	
}
