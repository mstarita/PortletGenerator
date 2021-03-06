package ${packageName};

import java.io.Serializable;

import javax.portlet.PortletPreferences;

public class Edit${portletName}Model implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final String PREFS_SHOW_PARAMS = "showParams";
	public static final String PREFS_PARAM1 = "param1";
	public static final String PREFS_PARAM2 = "param2";
	public static final String PREFS_PARAM3 = "param3";
	
	public static final String EDIT_MODEL_KEY_ATTR = "edit${portletName}Model";
	
	private Boolean showParams;
	private String param1;
	private String param2;
	private String param3;

	private String infoMessage;
	private String errorMessage;

	public Edit${portletName}Model(PortletPreferences portletPrefs) {
		
		init(portletPrefs);
		
	}
	
	public void init(PortletPreferences portletPrefs) {
		
		showParams = new Boolean(portletPrefs.getValue(PREFS_SHOW_PARAMS, "false"));
		param1 = portletPrefs.getValue(PREFS_PARAM1, "p1");
		param2 = portletPrefs.getValue(PREFS_PARAM2, "p2");
		param3 = portletPrefs.getValue(PREFS_PARAM3, "p3");
		
	}
	
	public void setShowParams(Boolean showParams) {
		this.showParams = showParams;
	}

	public Boolean getShowParams() {
		return showParams;
	}
	
	public void setParam1(String param1) {
		this.param1 = param1;
	}

	public String getParam1() {
		return param1;
	}

	public void setParam2(String param2) {
		this.param2 = param2;
	}

	public String getParam2() {
		return param2;
	}
	
	public void setParam3(String param3) {
		this.param3 = param3;
	}

	public String getParam3() {
		return param3;
	}
	
	public String getInfoMessage() {
		return infoMessage;
	}

	public void setInfoMessage(String infoMessage) {
		this.infoMessage = infoMessage;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
}
