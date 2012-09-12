package ${packageName};

import java.io.Serializable;

import com.liferay.faces.portal.el.I18N;

public class View${portletName}BackingBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private View${portletName}ModelBean viewModelBean;
	private transient I18N i18n;

	public void setViewModelBean(final View${portletName}ModelBean viewModelBean) {
		this.viewModelBean = viewModelBean;
	}

	public View${portletName}ModelBean getViewModelBean() {
		return viewModelBean;
	}	

	public void setI18n(I18N i18n) {
		this.i18n = i18n;
	}

	public I18N getI18n() {
		return i18n;
	}

	public String actionSample() {
		System.out.println("actionSample invoked!!!");
		
		return null;
	}
	
}
