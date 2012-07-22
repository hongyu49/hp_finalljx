/*
  页面 跳转 依赖 cherry.js
  para:targetUrl 目标url
  componetXmlUrl:可选 默认组件为  web 容器 路径：view/resources/Resources/PureWeb.scene.xml
 
*/
function changePageWithBridge(targetUrl,componetXmlUrl){
	
	var serverUrl="http://mobile.sugon.com";
	if(typeof(commentXmlUrl)=="undefined"){
			componetXmlUrl=serverUrl+"/view/Resources/PureWeb.scene.xml";
			
	}
	alert(targetUrl);
	var pushScene = new cherry.bridge.NativeOperation("application", "pushScene", [componetXmlUrl,targetUrl]);
	pushScene.dispatch();
	cherry.bridge.flushOperations();
	return pushScene;
		
}
/*
 页面 跳转  多用于返回上一页
 依赖 cherry.js
  para:targetUrl 目标url
  componetXmlUrl:可选 默认组件为  web 容器 路径：view/resources/Resources/PureWeb.scene.xml
*/
function changePageBackWithBridge(componetXmlUrl){
	if(typeof(commentXmlUrl)=="undefined"){
			componetXmlUrl=serverUrl+"/view/Resources/PureWeb.scene.xml";
			
	}
	var popScene = new cherry.bridge.NativeOperation("application", "popScene", [componetXmlUrl]);
	popScene.dispatch();
	cherry.bridge.flushOperations();
	return popScene;
}