package base.cfg
{
	import avmplus.getQualifiedClassName;
	
	import base.interfaces.IConfig;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	
	/******************************************************
	 *
	 * 创建者：njw
	 * 功能：
	 * 说明：
	 *
	 ******************************************************/
	public class BaseConfig implements IConfig
	{
		protected var m_ConfigInfoList:Dictionary = new Dictionary;
		protected var m_ConfigInfoArr:Array = new Array;
		protected var m_length:int;
		protected var m_DataList:XMLList;
		
		public function get length():int
		{
			return m_length;
		}

		public function set length(value:int):void
		{
			m_length = value;
		}
		
		public function BaseConfig()
		{

		}
		public function parseByteArray(data:ByteArray,cls:Class):void {}
		
		public function parseXML(data:XML,cls:Class,needAsyn:Boolean = false):void
		{
			var dataList:XMLList = data.children();
			length = dataList.length();
			if(length <= 0) 
			{
				trace("配置数据为空：" + this);
				return;
			}
//			var dataList:XMLList = data.elements(tempList[0].name());
//			var len:uint = dataList.length();
			for(var i:uint = 0; i < length; i++)
			{
				var configInfo:BaseConfigInfo = new cls;
				configInfo.fillXml(dataList[i]);
				if(m_ConfigInfoList.hasOwnProperty(configInfo.getKey()))
				{
					trace("配置ID号重复：" + configInfo.getKey() + this);
				}
				else{
					m_ConfigInfoList[configInfo.getKey()] = configInfo;
					m_ConfigInfoArr.push(configInfo);					
				}
			}
			length = m_ConfigInfoArr.length;
			m_ConfigInfoArr.sortOn("id",Array.NUMERIC);
		}
		
		public function getConfigList():Dictionary
		{
			return m_ConfigInfoList;
		}
		
		public function getConfigInfo(id:int):BaseConfigInfo
		{
			if(m_ConfigInfoList[id] == null)
			{
				var name:String = getQualifiedClassName(this);
				var str:String = name.slice(name.indexOf("::") + 2,name.length) + " 配置文件出错 ID:" + id;
//				if(GameConfig.MODEL_DEBUG) TestUtility.sendAlert(str);
//				TestUtility.sendLog(str);	
				return null;
			}
			
			return m_ConfigInfoList[id];
		}
		
	}
}