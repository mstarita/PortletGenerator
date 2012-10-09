package thecat.tools.portlet;

import java.util.zip.ZipFile;

import org.codehaus.groovy.gfreemarker.FreeMarkerTemplateEngine
import org.apache.commons.lang.ClassUtils
import org.apache.commons.lang.StringUtils
import org.apache.commons.io.FileUtils
import org.apache.commons.io.FilenameUtils

def keyValueArgs = args.collect { def token = it.split('='); [key: token[0], value: token.length > 1 ? token[1] : null] }

def orderedFieldList = []
def defaultParams = ['-icefaces-ext-req', '-verbose']
def mandatoryParams = ['-portlet-name', '-output-package']

keyValueArgs.findAll { it.key in defaultParams }.each { it.value = true }

//check input parameters
if (	(keyValueArgs.size() < mandatoryParams.size()) ||
		(keyValueArgs.findAll { it.key in mandatoryParams }.size() != mandatoryParams.size()) || 
		(keyValueArgs.findAll { it.value == null }.size() > 0)) {
	showUsage()
	return
}

def portletName     = keyValueArgs.find { it.key == '-portlet-name'}.value
def outputPackage   = keyValueArgs.find { it.key == '-output-package'}.value
def icefacesExtReq  = keyValueArgs.find { it.key == '-icefaces-ext-req'}?.value
def viewUtilPackage = keyValueArgs.find { it.key == '-viewutil-package'}?.value ?: 'thecat.common.view.util'
def verboseOutput   = keyValueArgs.find { it.key == '-verbose'}?.value
def tplConfigDir    = keyValueArgs.find { it.key == '-tpl-config'}?.value ?: 'icefaces1_8'

def binding = ['portletName': portletName,
			   'packageName': outputPackage, 
               'viewUtilPackage': viewUtilPackage,  
               'icefacesExtReq': icefacesExtReq ?: false]

// outputFiles
// outputDir
def files4config = 
			['icefaces1_8,icefaces3_1,mojarra2,primefaces3_3,moj2tomahawk2,moj2alloy,richfaces4' : 
				['webcfg': [inputDir: 'tpl/webcfg', outputDir: 'web/WEB-INF', postfix: '.tpl',
	                        files: ['web.xml', 'faces-config.xml', 'portlet.xml', 'liferay-portlet.xml', 
	                              'liferay-plugin-package.properties', 'liferay-hook.xml', 'liferay-display.xml']],
	             'i18n':   [inputDir: 'tpl/i18n', outputDir: 'src/resources', postfix: '.tpl',
	                        files: ['Language_it_IT.properties', 'Language_en_US.properties']], 
	             'src':    [inputDir: 'tpl/src', outputDir: "src/${binding.packageName.replaceAll('[.]', '/')}", postfix: '.tpl',
	                        files: ['Edit${portletName}BackingBean.java', 'Edit${portletName}ModelBean.java',
								  'View${portletName}BackingBean.java', 'View${portletName}ModelBean.java']],
				 'viewutil':[inputDir: 'tpl/viewutil', outputDir: "src/${binding.viewUtilPackage.replaceAll('[.]', '/')}", postfix: '.tpl',
					  		files: ['FacesUtil.java', 'PortletUtil.java']],
	             'jsp':    [inputDir: 'tpl/jsp', outputDir: "web/${binding.portletName}", postfix: '.tpl',
	                        files: ['edit.*', 'view.*']],
	             'css':    [inputDir: 'css', outputDir: 'web/css', postfix: '',
	                        files: ['form.css']],
				 'lib':    [inputDir: 'lib', outputDir: 'web/lib', postfix: '', 
					 		files: []],
				 'projlib':[inputDir: 'projlib', outputDir: 'projlib', postfix: '', 
					 		files: ['portlet.jar', 'servlet-api.jar']]],
			'vaadin' : 
				['webcfg': [inputDir: 'tpl/webcfg', outputDir: 'web/WEB-INF', postfix: '.tpl',
	                        files: ['web.xml', 'portlet.xml', 
								    'liferay-portlet.xml', 'liferay-plugin-package.properties', 'liferay-display.xml']],
	             'i18n':   [inputDir: 'tpl/i18n', outputDir: 'src/resources', postfix: '.tpl',
	                        files: ['Language_it_IT.properties', 'Language_en_US.properties']], 
	             'src':    [inputDir: 'tpl/src', outputDir: "src/${binding.packageName.replaceAll('[.]', '/')}", postfix: '.tpl',
	                        files: ['${portletName}Application.java', 
								    'Edit${portletName}Layout.java', 'Edit${portletName}ModelBean.java',
								    'View${portletName}Layout.java', 'View${portletName}ModelBean.java']],
				 'viewutil':[inputDir: 'tpl/viewutil', outputDir: "src/${binding.viewUtilPackage.replaceAll('[.]', '/')}", postfix: '.tpl',
					  		files: ['VaadinNotificationUtil.java', 'ResourceBundleProperty.java']],
	             //'jsp':    [inputDir: 'tpl/jsp', outputDir: "web/${binding.portletName}", postfix: '.tpl',
	             //           files: []],
	             //'css':    [inputDir: 'css', outputDir: 'web/css', postfix: '',
	             //           files: []],
				 'lib':    [inputDir: 'lib', outputDir: 'web/lib', postfix: '', 
					 		files: []],
				 'projlib':[inputDir: 'projlib', outputDir: 'projlib', postfix: '', 
					 		files: ['portlet.jar', 'servlet-api.jar']]],
			'liferay_jsp' :
						 ['webcfg': [inputDir: 'tpl/webcfg', outputDir: 'web/WEB-INF', postfix: '.tpl',
									 files: ['web.xml', 'portlet.xml',
											 'liferay-portlet.xml', 'liferay-hook.xml', 'liferay-display.xml']],
						  'i18n':   [inputDir: 'tpl/i18n', outputDir: 'src/resources', postfix: '.tpl',
									 files: ['Language_it_IT.properties', 'Language_en_US.properties']],
						  'src':    [inputDir: 'tpl/src', outputDir: "src/${binding.packageName.replaceAll('[.]', '/')}", postfix: '.tpl',
									 files: ['${portletName}Portlet.java',
											 'Edit${portletName}ModelBean.java', 'View${portletName}ModelBean.java',
											 'Edit${portletName}ActionBean.java', 'View${portletName}ActionBean.java',
											 'Edit${portletName}ActionBeanImpl.java', 'View${portletName}ActionBeanImpl.java'
											 ]],
						  'jsp':    [inputDir: 'tpl/jsp', outputDir: "web/${binding.portletName}", postfix: '.tpl',
						             files: ['init.jsp', 'edit.jsp', 'view.jsp']],
						  'css':    [inputDir: 'css', outputDir: 'web/css', postfix: '',
						             files: ['form.css']],
						  'lib':    [inputDir: 'lib', outputDir: 'web/lib', postfix: '',
									  files: []],
						  'tld':    [inputDir: 'tld', outputDir: 'web/WEB-INF/tld', postfix: '',
									  files: ['c.tld', 'liferay-aui.tld', 'liferay-portlet.tld', 'liferay-security.tld', 
										  		'liferay-theme.tld', 'liferay-ui.tld', 'liferay-util.tld']],
						  'projlib':[inputDir: 'projlib', outputDir: 'projlib', postfix: '',
									  files: ['portal-service.jar', 'portlet.jar', 'servlet-api.jar', 'util-bridges.jar', 'util-taglib.jar']]],
			'zk6' :
								  ['webcfg': [inputDir: 'tpl/webcfg', outputDir: 'web/WEB-INF', postfix: '.tpl',
											  files: ['zk.xml', 'web.xml', 'portlet.xml',
													  'liferay-portlet.xml', 'liferay-plugin-package.properties', 'liferay-display.xml']],
								   'i18n':   [inputDir: 'tpl/i18n', outputDir: 'src/resources', postfix: '.tpl',
											  files: ['Language_it_IT.properties', 'Language_en_US.properties']],
								   'src':    [inputDir: 'tpl/src', outputDir: "src/${binding.packageName.replaceAll('[.]', '/')}", postfix: '.tpl',
											  files: ['Edit${portletName}Model.java', 'View${portletName}Model.java',
													  'Edit${portletName}ViewModel.java', 'View${portletName}ViewModel.java'
													  ]],
								   'zkviewutil':[inputDir: 'tpl/viewutil', outputDir: "src/${binding.viewUtilPackage.replaceAll('[.]', '/')}/zk", postfix: '.tpl',
									   		   files: ['LabelsUtil.java']],
								   'zkportlet':[inputDir: 'tpl/viewutil', outputDir: "src/org/zkoss/zk/ui/http", postfix: '.tpl',
									   		   files: ['FullDHtmlLayoutPortlet.java']],
								   'zul':    [inputDir: 'tpl/zul', outputDir: "web/${binding.portletName}", postfix: '.tpl',
											  files: ['view.zul', 'edit.zul']],
								   'css':    [inputDir: 'css', outputDir: 'web/css', postfix: '',
											  files: ['form.css']],
								   'lib':    [inputDir: 'lib', outputDir: 'web/lib', postfix: '',
											   files: []],
								   'projlib':[inputDir: 'projlib', outputDir: 'projlib', postfix: '',
											   files: ['portal-service.jar', 'portlet.jar', 'servlet-api.jar']]]
			]

showRunInfo outputPackage, viewUtilPackage, tplConfigDir

// setup config files
def files = null
files4config.each { config ->
	config.key.split(',').each { 
		if (it == tplConfigDir) {
			files = config.value 
		}
	}
}

if (!files) {
	println "Cannot find the specified ${tplConfigDir} configuration!!!"
	System.exit 0
}

// fill files for lib key
if (verboseOutput) println "fill libs for ${tplConfigDir}"

ZipFile zipFile = new ZipFile(getClass().getProtectionDomain().getCodeSource().getLocation().getFile())
zipFile.entries().each {
	def entryName = FilenameUtils.getName(it.name)
	//if (it.name.startsWith("thecat/tools/portlet/resources/${files['lib'].value.inputDir}/${tplConfigDir}/")) {
	if (it.name.startsWith("thecat/tools/portlet/resources/lib/${tplConfigDir}/")) {
		if (entryName.count > 0) {
			if (entryName.endsWith('.fake')) {
				files['lib'].files.add(entryName[0..-6])
			} else {
				files['lib'].files.add(entryName)
			}
		}
	}
}

if (!files['lib'].files.count) {
	println "Cannot find the specified ${tplConfigDir} configuration!!!"
	System.exit 0
}

print 'Generating code...'
if (verboseOutput) println ''

files.each { file -> 
	def baseOutputDir = "output-${tplConfigDir}"
	def outputDir = file.value.outputDir
	def inputDir  = file.value.inputDir
	def postfix   = file.value.postfix
	
	if (verboseOutput) println "\t${outputDir}"
	
	if (file.value.files.count) {
		FileUtils.forceMkdir(new File("${baseOutputDir}/${outputDir}"))
	}
	
	file.value.files.each { value ->
		def outputFile = freemark(value, binding)
		def inputFile = "resources/${inputDir}/${value}"
		def inputFileConfigDir = "resources/${inputDir}/${tplConfigDir}/${value}"
		
		if (value ==~ /^.+\.\*$/) { // if the entry ends with '.*'	
			//zipFile = new ZipFile(getClass().getProtectionDomain().getCodeSource().getLocation().getFile())
			zipFile.entries().each {
				def entryName = FilenameUtils.getName(FilenameUtils.removeExtension(it.name))
				if (it.name.startsWith("thecat/tools/portlet/${inputFileConfigDir[0..-2]}")) {
					inputFile = "resources/${inputDir}/${tplConfigDir}/${entryName}"
					outputFile = freemark(entryName, binding)
				} else if (it.name.startsWith("thecat/tools/portlet/${inputFile[0..-2]}")) {
					inputFile = "resources/${inputDir}/${entryName}"
					outputFile = freemark(entryName, binding)
				}
			}
		} else if (getClass().getResource(inputFileConfigDir + postfix) != null) {
			inputFile = inputFileConfigDir
		} 
		
		if (verboseOutput) println "\t\t$inputFile"
		
		if (postfix == '.tpl') {
			freemark("${inputFile}${postfix}", "${baseOutputDir}/${outputDir}/${outputFile}", binding)
		} else {
			FileUtils.copyURLToFile getClass().getResource(inputFile), 
				new File("${baseOutputDir}/${outputDir}/${outputFile}")
		}		
	}
}
println 'That\'s all Folks!!!'

def freemark(inputString, binding) {
	def engine = new FreeMarkerTemplateEngine('')
	
	return engine.createTemplate(inputString).make(binding)
}

def freemark(templateName, outputFileName, binding) {
	def engine = new FreeMarkerTemplateEngine('')
	
	def templateUrl = getClass().getResource(templateName);
	def templateText = templateUrl.getContent().getText()
	String freemarkedText = engine.createTemplate(templateText).make(binding)
	new File(outputFileName).setText(freemarkedText)
}

def showRunInfo(outputPackage, viewUtilPackage, tplConfig) {
	println "Output package: ${outputPackage}"
	println "View Util package: ${viewUtilPackage}"
	println "TPL Config: ${tplConfig}"
	println ""
}

def showUsage() {
	println "Please specify the following parameters:"
	println "\t-portlet-name=<name of the portlet>"
	println "\t-output-package=<package of the generated code>"
	println "\t[-icefaces-ext-req]"
	println "\t[-viewutil-package=<package of the view util classes>] - default: thecat.common.view.util"
	println "\t[-verbose] verbose output"
	println "\t[-tpl-config=<template config dir starting from thecat.tools.portlet.resources.tpl.*...] template configuration - default: icefaces1_8"
	println "\tAvailable template configuration: icefaces1_8, icefaces3_1, mojarra2, primefaces3_3, moj2tomahawk2, moj2alloy, vaadin, richfaces4, liferay_jsp, zk6"
}
