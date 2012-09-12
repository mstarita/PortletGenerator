package ${packageName};

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.portlet.PortletPreferences;

import ${viewUtilPackage}.PortletUtil;

public class Edit${portletName}ModelBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Boolean showParams;
	private String param1;
	private String param2;
	private String param3;
	
	@PostConstruct
	public void init() {
		System.out.println("Edit${portletName}ModelBean.init()");
		
		PortletPreferences portletPrefs = PortletUtil.getPortletPreferences();
		
		showParams = new Boolean(portletPrefs.getValue("param1", "p1"));
		param1 = portletPrefs.getValue("param1", "p1");
		param2 = portletPrefs.getValue("param2", "p2");
		param3 = portletPrefs.getValue("param3", "p3");
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
