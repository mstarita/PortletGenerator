package ${viewUtilPackage};

import java.util.Locale;
import java.util.ResourceBundle;

import com.vaadin.data.util.ObjectProperty;

public class ResourceBundleProperty {
	
	private static final String resourceBundleFile = "resources/Language";
	
	private Locale currentLocale = null;
	private ObjectProperty<ResourceBundle> resourceBundleProp;
	
	public ResourceBundleProperty(Locale locale) {
		currentLocale = locale;
		resourceBundleProp = new ObjectProperty<ResourceBundle>(buildResourceBundle());
	}
	
	public void setupLocale(Locale locale) {
		if (currentLocale == null) {
			
			currentLocale = locale;
			setupResourceBundleProp();
			
		} else if (!this.currentLocale.equals(locale)){
			
			currentLocale = locale;
			setupResourceBundleProp();
			
		}
	}
	
	public ObjectProperty<ResourceBundle> getResourceBundleProp() {
		return resourceBundleProp;
	}
	
	public String getString(String key) {
		return resourceBundleProp.getValue().getString(key);
	}
	
	private void setupResourceBundleProp() {
		resourceBundleProp.setValue(buildResourceBundle());
	}
	
	private ResourceBundle buildResourceBundle() {
		return ResourceBundle.getBundle(resourceBundleFile, currentLocale);
	}
}
