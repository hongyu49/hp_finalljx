/*
  ҳ�� ��ת ���� cherry.js
  para:targetUrl Ŀ��url
  componetXmlUrl:��ѡ Ĭ�����Ϊ  web ���� ·����view/resources/Resources/PureWeb.scene.xml
 
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
 ҳ�� ��ת  �����ڷ�����һҳ
 ���� cherry.js
  para:targetUrl Ŀ��url
  componetXmlUrl:��ѡ Ĭ�����Ϊ  web ���� ·����view/resources/Resources/PureWeb.scene.xml
*/
function changePageBackWithBridge(targetUrl,componetXmlUrl){
	var serverUrl="http://mobile.sugon.com";
	if(typeof(commentXmlUrl)=="undefined"){
			componetXmlUrl=serverUrl+"/view/Resources/PureWeb.scene.xml";
			
	}
	var popScene = new cherry.bridge.NativeOperation("application", "popScene", [componetXmlUrl,targetUrl]);
	popScene.dispatch();
	cherry.bridge.flushOperations();
	return popScene;
}