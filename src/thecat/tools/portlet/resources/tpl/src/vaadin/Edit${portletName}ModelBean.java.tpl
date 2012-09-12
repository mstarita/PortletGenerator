package ${packageName};

import java.io.Serializable;

import com.vaadin.data.util.ObjectProperty;

public class Edit${portletName}ModelBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Boolean showParams = false;
	private String param1 = "";
	private String param2 = "";
	private String param3 = "";

	private ObjectProperty<Boolean> propShowParams = new ObjectProperty<Boolean>(showParams);
	private ObjectProperty<String> propParam1 = new ObjectProperty<String>(param1);
	private ObjectProperty<String> propParam2 = new ObjectProperty<String>(param2);
	private ObjectProperty<String> propParam3 = new ObjectProperty<String>(param3);
	
	public ObjectProperty<Boolean> getPropShowParams() {
		return propShowParams;
	}
	
	public ObjectProperty<String> getPropParam1() {
		return propParam1;
	}
	
	public ObjectProperty<String> getPropParam2() {
		return propParam2;
	}
	
	public ObjectProperty<String> getPropParam3() {
		return propParam3;
	}
}
