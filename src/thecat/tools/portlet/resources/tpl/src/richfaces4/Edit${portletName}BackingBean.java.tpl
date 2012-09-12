package ${packageName};

import java.io.Serializable;

import javax.faces.event.ActionEvent;
import javax.faces.application.FacesMessage;
import javax.portlet.PortletPreferences;

import com.liferay.faces.portal.el.I18N;

import ${viewUtilPackage}.FacesUtil;
import ${viewUtilPackage}.PortletUtil;

public class Edit${portletName}BackingBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Edit${portletName}ModelBean modelBean;
	private transient I18N i18n;
	
	public void setModelBean(final Edit${portletName}ModelBean modelBean) {
		this.modelBean = modelBean;
	}

	public Edit${portletName}ModelBean getModelBean() {
		return modelBean;
	}

	public void setI18n(I18N i18n) {
		this.i18n = i18n;
	}

	public I18N getI18n() {
		return i18n;
	}
	
	public void actionSave(ActionEvent actionEvent) {
		System.out.println("Saving ${portletName} portlet preferences...");
		
		PortletPreferences portletPrefs = PortletUtil.getPortletPreferences();
		
		try {
			portletPrefs.setValue("showParams", modelBean.getShowParams().toString());
			portletPrefs.setValue("param1", modelBean.getParam1());
			portletPrefs.setValue("param2", modelBean.getParam2());
			portletPrefs.setValue("param3", modelBean.getParam3());
		
			portletPrefs.store();

			FacesUtil.addMessage(FacesMessage.SEVERITY_INFO, i18n.getString("edit.save.msg.success"), null);
		} catch (Exception ex) {
			FacesUtil.addMessage(FacesMessage.SEVERITY_ERROR, i18n.getString("edit.save.msg.fail"), ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	public void actionReset(ActionEvent actionEvent) {
		System.out.println("Reset ${portletName} portlet preferences...");

		PortletPreferences portletPrefs = PortletUtil.getPortletPreferences();
		
		try {
			portletPrefs.reset("showParams");
			portletPrefs.reset("param1");
			portletPrefs.reset("param2");
			portletPrefs.reset("param3");
			
			modelBean.init();
		} catch (Exception ex) {
			FacesUtil.addMessage(FacesMessage.SEVERITY_ERROR, i18n.getString("edit.reset.msg.fail"), ex.getMessage());
		}
	}

}
