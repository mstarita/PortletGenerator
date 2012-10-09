package ${viewUtilPackage}.zk;

import java.util.Locale;

import org.zkoss.util.resource.impl.LabelLoader;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.http.FullDHtmlLayoutPortlet;

public class LabelsUtil {
	
	private LabelsUtil() { }
	
	public static final String getLabel(String label) {
		
		Session session = Executions.getCurrent().getSession();
		
		Locale locale = (Locale) session.getAttribute(FullDHtmlLayoutPortlet.LOCALE_ATTR_KEY);
		LabelLoader labelLoader = (LabelLoader) session.getAttribute(FullDHtmlLayoutPortlet.LABEL_LOADER_ATTR_KEY);
		
		return labelLoader.getLabel(locale, label);
		
	}
	
}
