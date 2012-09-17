package ${packageName};

import java.io.Serializable;

import javax.portlet.PortletPreferences;
import javax.portlet.PortletRequest;

public class Edit${portletName}ModelBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final String PREFS_SHOW_PARAMS = "showParams";
	public static final String PREFS_PARAM1 = "param1";
	public static final String PREFS_PARAM2 = "param2";
	public static final String PREFS_PARAM3 = "param3";
	
	private Boolean showParams;
	private String param1;
	private String param2;
	private String param3;
	
	public Edit${portletName}ModelBean(PortletRequest portletRequest) {
		PortletPreferences portletPrefs = portletRequest.getPreferences();
		
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
}
